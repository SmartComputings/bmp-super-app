import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bmp/features/chat/chat/events/map_bubble.dart';
import 'package:bmp/features/chat/chat/send_location_dialog.dart';
import 'package:matrix/matrix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';


class NearbyLocation {
  final String name;
  final String detail;
  final double latitude;
  final double longitude;
  final double distance;

  NearbyLocation({
    required this.name,
    required this.detail,
    required this.latitude,
    required this.longitude,
    required this.distance,
  });
}

class LocationContent extends StatefulWidget {
  final Function() onLocationSelected;
  final Room? room;
  
  const LocationContent({super.key, required this.onLocationSelected, this.room});

  @override
  State<LocationContent> createState() => _LocationContentState();
}

class _LocationContentState extends State<LocationContent> {
  Position? _currentPosition;
  Position? _selectedPosition;
  bool _hasPermission = false;
  bool _isLoading = false;
  bool isSending = false;
  String _locationText = '';
  String _selectedLocationName = 'Send Selected Location';
  String _selectedLocationDetail = 'Location Detail';
  List<NearbyLocation> _nearbyLocations = [];
  bool _loadingNearby = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
    if (_hasPermission) {
      _getCurrentLocation();
    }
  }

  Future<void> _checkPermission() async {
    final status = await Permission.location.status;
    setState(() {
      _hasPermission = status.isGranted;
    });
    if (_hasPermission) {
      _getCurrentLocation();
    }
  }

  Future<void> _requestPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _hasPermission = status.isGranted;
    });
    if (_hasPermission) {
      _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    if (!_hasPermission) {
      await _requestPermission();
      return;
    }

    setState(() => _isLoading = true);
    
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      setState(() {
        _currentPosition = position;
        _selectedPosition = position;
        _locationText = 'Lat: ${position.latitude.toStringAsFixed(6)}, Lng: ${position.longitude.toStringAsFixed(6)}';
        _isLoading = false;
      });
      
      _fetchNearbyLocations(position);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _locationText = L10n.of(context).failedToGetLocation;
      });
    }
  }

  Future<void> _fetchNearbyLocations(Position position) async {
    setState(() => _loadingNearby = true);
    
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      
      List<NearbyLocation> locations = [];
      
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        final currentName = place.name ?? 'Current Location';
        final currentDetail = '${place.street ?? ''}, ${place.locality ?? ''}'.trim();
        
        setState(() {
          _selectedLocationName = currentName;
          _selectedLocationDetail = currentDetail.isEmpty ? 'Location Detail' : currentDetail;
        });
        
        locations.add(NearbyLocation(
          name: currentName,
          detail: currentDetail.isEmpty ? 'Your current location' : currentDetail,
          latitude: position.latitude,
          longitude: position.longitude,
          distance: 0.0,
        ));
      }
      
      final offsets = [
        {'lat': 0.001, 'lng': 0.001, 'name': 'Nearby Place 1', 'dist': 0.15},
        {'lat': -0.001, 'lng': 0.001, 'name': 'Nearby Place 2', 'dist': 0.22},
        {'lat': 0.002, 'lng': -0.001, 'name': 'Nearby Place 3', 'dist': 0.35},
        {'lat': -0.002, 'lng': -0.002, 'name': 'Nearby Place 4', 'dist': 0.48},
      ];
      
      for (var offset in offsets) {
        final lat = position.latitude + (offset['lat'] as double);
        final lng = position.longitude + (offset['lng'] as double);
        
        try {
          final nearbyPlacemarks = await placemarkFromCoordinates(lat, lng);
          if (nearbyPlacemarks.isNotEmpty) {
            final place = nearbyPlacemarks.first;
            locations.add(NearbyLocation(
              name: place.name ?? offset['name'] as String,
              detail: '${place.street ?? ''}, ${place.locality ?? ''}'.trim(),
              latitude: lat,
              longitude: lng,
              distance: offset['dist'] as double,
            ));
          }
        } catch (e) {
          locations.add(NearbyLocation(
            name: offset['name'] as String,
            detail: 'Nearby location',
            latitude: lat,
            longitude: lng,
            distance: offset['dist'] as double,
          ));
        }
      }
      
      setState(() {
        _nearbyLocations = locations;
        _loadingNearby = false;
      });
    } catch (e) {
      setState(() => _loadingNearby = false);
    }
  }

  void _selectLocation(NearbyLocation location) {
    setState(() {
      _selectedPosition = Position(
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );
      _selectedLocationName = location.name;
      _selectedLocationDetail = location.detail.isEmpty ? 'Location Detail' : location.detail;
    });
  }

  void _openLocationPicker() async {
    print('🗺️ _openLocationPicker called');
    if (widget.room != null) {
      print('✅ Room is available, showing dialog');
      widget.onLocationSelected();
      await showDialog(
        context: context,
        builder: (context) => SendLocationDialog(room: widget.room!),
      );
    } else {
      print('❌ Room is null');
    }
  }
  
  void sendAction() async {
    if (_selectedPosition == null) {
      print('❌ No selected position available');
      return;
    }
    if (widget.room == null) {
      print('❌ No room provided to LocationContent');
      return;
    }
    
    print('📤 Sending location: ${_selectedPosition!.latitude}, ${_selectedPosition!.longitude}');
    setState(() => isSending = true);
    
    try {
      final body =
          'https://www.openstreetmap.org/?mlat=${_selectedPosition!.latitude}&mlon=${_selectedPosition!.longitude}#map=16/${_selectedPosition!.latitude}/${_selectedPosition!.longitude}';
      final uri =
          'geo:${_selectedPosition!.latitude},${_selectedPosition!.longitude};u=${_selectedPosition!.accuracy}';
      
      await widget.room!.sendLocation(body, uri);
      print('✅ Location sent successfully');
      widget.onLocationSelected();
    } catch (e) {
      print('❌ Failed to send location: $e');
    }
    
    setState(() => isSending = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight*0.45,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF3976F8),
                borderRadius: BorderRadius.circular(context.screenWidth * 0.035),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: context.screenHeight * 0.22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF841CBF),
                      borderRadius: BorderRadius.circular(context.screenWidth * 0.035),
                    ),
                    child: !_hasPermission
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, size: context.screenWidth * 0.12, color: Colors.white54),
                                SizedBox(height: context.screenHeight * 0.015),
                                Text(
                                  L10n.of(context).locationAccessRequired,
                                  style: TextStyle(color: Colors.white, fontSize: context.screenWidth * 0.035),
                                ),
                                SizedBox(height: context.screenHeight * 0.01),
                                ElevatedButton(
                                  onPressed: _requestPermission,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF7E24F9),
                                  ),
                                  child: Text(L10n.of(context).grantPermission),
                                ),
                              ],
                            ),
                          )
                        : _isLoading
                            ? const AppLoadingWidget()
                            : _selectedPosition == null
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.map, size: context.screenWidth * 0.12, color: Colors.white),
                                        SizedBox(height: context.screenHeight * 0.01),
                                        ElevatedButton(
                                          onPressed: _getCurrentLocation,
                                          child: Text(L10n.of(context).getLocation),
                                        ),
                                      ],
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(context.screenWidth * 0.035),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: context.screenHeight * 0.22,
                                          child: MapBubble(
                                            latitude: _selectedPosition!.latitude,
                                            longitude: _selectedPosition!.longitude,
                                            width: context.screenWidth,
                                            height: context.screenHeight * 0.22,
                                            radius: 0,
                                            isPreview: true,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              print('👆 Map tapped!');
                                              _openLocationPicker();
                                            },
                                            borderRadius: BorderRadius.circular(context.screenWidth * 0.035),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                  ),
                  
                  if (_selectedPosition != null)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.035, vertical: context.screenHeight * 0.015),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                          children: [
                            Container(
                              // width: context.screenWidth * 0.07,
                              // height: context.screenWidth * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: isSending
                                  ? Padding(
                                      padding: EdgeInsets.all(context.screenWidth * 0.015),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: context.screenWidth * 0.005,
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.all(context.screenWidth * 0.015),
                                      child: SvgPicture.asset(
                                        'assets/chat_icons/location.svg',
                                        width: context.screenWidth * 0.07,
                                        height: context.screenWidth * 0.07,
                                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                      ),
                                    ),
                            ),
                            SizedBox(width: context.screenWidth * 0.025),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _selectedLocationName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.screenWidth * 0.035,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: context.screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Text(
                                        _currentPosition != null && _selectedPosition != null
                                            ? '${(Geolocator.distanceBetween(
                                                _currentPosition!.latitude,
                                                _currentPosition!.longitude,
                                                _selectedPosition!.latitude,
                                                _selectedPosition!.longitude,
                                              ) / 1000).toStringAsFixed(1)} km'
                                            : '0.0 km',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.72),
                                          fontSize: context.screenWidth * 0.025,
                                          fontFamily: 'Neometric',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
                                        child: Text(
                                          '•',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.48),
                                            fontSize: context.screenWidth * 0.025,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          _selectedLocationDetail,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.72),
                                            fontSize: context.screenWidth * 0.025,
                                            fontFamily: 'Neometric',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: context.screenWidth * 0.02),
                            ElevatedButton(
                              onPressed: isSending ? null : sendAction,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.screenWidth * 0.04,
                                  vertical: context.screenHeight * 0.01,
                                ),
                              ),
                              child: Text(
                                'Send',
                                style: TextStyle(fontSize: context.screenWidth * 0.035),
                              ),
                            ),
                          ],
                        ),
                      ),
                ]
                    ),
                
              ),
            
            
            SizedBox(height: context.screenHeight * 0.015),
            
            if (_nearbyLocations.isNotEmpty)
              Container(
          
                constraints: BoxConstraints(
                  //maxHeight: context.screenHeight * 0.3,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _nearbyLocations.length,
                  separatorBuilder: (context, index) => SizedBox(height: context.screenHeight * 0.01),
                  itemBuilder: (context, index) {
                    final location = _nearbyLocations[index];
                    final isSelected = _selectedPosition?.latitude == location.latitude &&
                        _selectedPosition?.longitude == location.longitude;
                    
                    return InkWell(
                      onTap: () => _selectLocation(location),
                      borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.035, vertical: context.screenHeight * 0.015),
                        decoration: BoxDecoration(
                          color: const Color(0xFF222C37),
                          borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
                          border: isSelected
                              ? Border.all(color: const Color(0xFF3976F8), width: context.screenWidth * 0.005)
                              : null,
                        ),
                        child: Row(
                          children: [
                            Container(
                              // width: context.screenWidth * 0.07,
                              // height: context.screenWidth * 0.07,
                              decoration: BoxDecoration(
                                //color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/chat_icons/location.svg',
                                width: context.screenWidth * 0.07,
                                height: context.screenWidth * 0.07,
                                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                            SizedBox(width: context.screenWidth * 0.025),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    location.name,
                                    style: TextStyle(
                                      color: Color(0xFFF3F7F8),
                                      fontSize: context.screenWidth * 0.035,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: context.screenHeight * 0.005),
                                  Row(
                                    children: [
                                      Text(
                                        '${location.distance.toStringAsFixed(1)} km',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: context.screenWidth * 0.03,
                                          fontFamily: 'Work Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      if (location.detail.isNotEmpty) ...[
                                        SizedBox(width: context.screenWidth * 0.01),
                                        Text(
                                          '•',
                                          style: TextStyle(
                                            color: Color(0x7A6F8DA1),
                                            fontSize: context.screenWidth * 0.025,
                                            fontFamily: 'Neometric',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(width: context.screenWidth * 0.01),
                                        Expanded(
                                          child: Text(
                                            location.detail,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: context.screenWidth * 0.03,
                                              fontFamily: 'Work Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            
            if (_loadingNearby)
              Padding(
                padding: EdgeInsets.all(context.screenWidth * 0.04),
                child: const AppLoadingWidget(),
              ),
          ],
        ),
      ),
    );
  }
}
