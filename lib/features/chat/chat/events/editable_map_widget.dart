import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

class EditableMapWidget extends StatefulWidget {
  final double initialLatitude;
  final double initialLongitude;
  final Function(double lat, double lng) onLocationChanged;
  final Position? externalPosition;

  const EditableMapWidget({
    required this.initialLatitude,
    required this.initialLongitude,
    required this.onLocationChanged,
    this.externalPosition,
    super.key,
  });

  @override
  State<EditableMapWidget> createState() => _EditableMapWidgetState();
}

class _EditableMapWidgetState extends State<EditableMapWidget> {
  late LatLng selectedLocation;
  late MapController mapController;
  bool isPinMode = false;
  LatLng? pinnedLocation;

  @override
  void initState() {
    super.initState();
    selectedLocation = LatLng(widget.initialLatitude, widget.initialLongitude);
    mapController = MapController();
  }

  @override
  void didUpdateWidget(EditableMapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.externalPosition != null &&
        (widget.externalPosition!.latitude != oldWidget.externalPosition?.latitude ||
            widget.externalPosition!.longitude != oldWidget.externalPosition?.longitude)) {
      final newLocation = LatLng(
        widget.externalPosition!.latitude,
        widget.externalPosition!.longitude,
      );
      setState(() {
        selectedLocation = newLocation;
        pinnedLocation = newLocation;
        isPinMode = true;
      });
      mapController.move(newLocation, 14.0);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onLocationChanged(newLocation.latitude, newLocation.longitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: selectedLocation,
            initialZoom: 14.0,
            minZoom: 3.0,
            maxZoom: 18.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all,
            ),
            onTap: (tapPosition, point) {
              if (isPinMode) {
                setState(() {
                  pinnedLocation = point;
                  selectedLocation = point;
                });
                widget.onLocationChanged(point.latitude, point.longitude);
              }
            },
            onPositionChanged: (position, hasGesture) {
              if (hasGesture && position.center != null && !isPinMode) {
                selectedLocation = position.center!;
                widget.onLocationChanged(selectedLocation.latitude, selectedLocation.longitude);
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'chat.bemindepower.bmpchat',
            ),
            if (pinnedLocation != null)
              MarkerLayer(
                markers: [
                  Marker(
                    point: pinnedLocation!,
                    width: context.screenWidth * 0.12,
                    height: context.screenWidth * 0.12,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: context.screenWidth * 0.12,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: context.screenWidth * 0.01,
                          offset: Offset(0, context.screenHeight * 0.0025),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (!isPinMode && pinnedLocation == null)
          Center(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: context.screenWidth * 0.12,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: context.screenWidth * 0.01,
                  offset: Offset(0, context.screenHeight * 0.0025),
                ),
              ],
            ),
          ),
        Positioned(
          top: context.screenHeight * 0.02,
          right: context.screenWidth * 0.04,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: isPinMode ? Colors.red : Colors.white,
            onPressed: () {
              setState(() {
                isPinMode = !isPinMode;
                if (!isPinMode) {
                  pinnedLocation = null;
                }
              });
            },
            child: Icon(
              Icons.push_pin,
              color: isPinMode ? Colors.white : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}