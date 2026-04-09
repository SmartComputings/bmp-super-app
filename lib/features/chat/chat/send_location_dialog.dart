import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:matrix/matrix.dart';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/chat/events/map_bubble.dart';
import 'package:bmp/features/chat/chat/events/editable_map_widget.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/adaptive_dialog_action.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';

class SendLocationDialog extends StatefulWidget {
  final Room room;

  const SendLocationDialog({
    required this.room,
    super.key,
  });

  @override
  SendLocationDialogState createState() => SendLocationDialogState();
}

class SendLocationDialogState extends State<SendLocationDialog> {
  bool disabled = false;
  bool denied = false;
  bool isSending = false;
  Position? position;
  Object? error;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    requestLocation().timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        print('💥 Location: Overall timeout - setting error');
        if (mounted) setState(() => error = Exception('Location request timeout'));
      },
    );
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;
    
    setState(() => _isSearching = true);
    
    try {
      final locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        final location = locations.first;
        setState(() {
          position = Position(
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
        });
      }
    } catch (e) {
      print('Search error: $e');
    }
    
    setState(() => _isSearching = false);
  }

  Future<void> requestLocation() async {
    print('🚀 Location: Starting location request...');
    
    try {
      // Check service with timeout
      print('🔍 Location: Checking service...');
      final serviceEnabled = await Geolocator.isLocationServiceEnabled().timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          print('⏰ Location: Service check timeout, assuming enabled');
          return true;
        },
      );
      print('📍 Location: Service enabled: $serviceEnabled');
      
      if (!serviceEnabled) {
        print('❌ Location: Service disabled');
        setState(() => disabled = true);
        return;
      }

      // Check permission with timeout
      print('🔐 Location: Checking permission...');
      var permission = await Geolocator.checkPermission().timeout(
        const Duration(seconds: 3),
        onTimeout: () {
          print('⏰ Location: Permission check timeout, assuming denied');
          return LocationPermission.denied;
        },
      );
      print('📋 Location: Permission: $permission');
      
      if (permission == LocationPermission.denied) {
        print('🙏 Location: Requesting permission...');
        permission = await Geolocator.requestPermission().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            print('⏰ Location: Permission request timeout');
            return LocationPermission.denied;
          },
        );
        print('📝 Location: New permission: $permission');
      }
      
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        print('🚫 Location: Permission denied');
        setState(() => denied = true);
        return;
      }

      // Get position
      print('📡 Location: Getting position...');
      Position? position;
      
      // Try last known position first (faster in release mode)
      try {
        print('🔄 Location: Trying last known position first...');
        position = await Geolocator.getLastKnownPosition(
          forceAndroidLocationManager: true,
        ).timeout(const Duration(seconds: 5));
        if (position != null) {
          print('✅ Location: Last known: ${position.latitude}, ${position.longitude}');
        }
      } catch (e) {
        print('⚠️ Location: Last known failed: $e');
      }
      
      // If no last known position, try current position
      if (position == null) {
        try {
          print('⏱️ Location: Trying current position...');
          position = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.medium,
              timeLimit: Duration(seconds: 8),
            ),
            forceAndroidLocationManager: true,
          ).timeout(const Duration(seconds: 10));
          print('✅ Location: Current position: ${position.latitude}, ${position.longitude}');
        } catch (e) {
          print('⚠️ Location: Current position failed: $e');
        }
      }

      if (position != null) {
        print('🎯 Location: Setting position: ${position.latitude}, ${position.longitude}');
        if (mounted) setState(() => this.position = position);
      } else {
        print('💥 Location: No position available');
        if (mounted) setState(() => error = Exception('Location unavailable'));
      }
      
    } catch (e) {
      print('💀 Location: Fatal error: $e');
      if (mounted) setState(() => error = e);
    }
  }

  void sendAction() async {
    setState(() => isSending = true);
    final body =
        'https://www.openstreetmap.org/?mlat=${position!.latitude}&mlon=${position!.longitude}#map=16/${position!.latitude}/${position!.longitude}';
    final uri =
        'geo:${position!.latitude},${position!.longitude};u=${position!.accuracy}';
    await showFutureLoadingDialog(
      context: context,
      future: () => widget.room.sendLocation(body, uri),
    );
    Navigator.of(context, rootNavigator: false).pop();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 SendLocationDialog: Building with position: $position, disabled: $disabled, denied: $denied, error: $error');
    Widget contentWidget;
    if (position != null) {
      print('🗺️ SendLocationDialog: Creating location display with position: ${position!.latitude}, ${position!.longitude}');
      contentWidget = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: EditableMapWidget(
            initialLatitude: position!.latitude,
            initialLongitude: position!.longitude,
            externalPosition: position,
            onLocationChanged: (lat, lng) {
              setState(() {
                position = Position(
                  latitude: lat,
                  longitude: lng,
                  timestamp: DateTime.now(),
                  accuracy: position!.accuracy,
                  altitude: position!.altitude,
                  altitudeAccuracy: position!.altitudeAccuracy,
                  heading: position!.heading,
                  headingAccuracy: position!.headingAccuracy,
                  speed: position!.speed,
                  speedAccuracy: position!.speedAccuracy,
                );
              });
            },
          ),
        ),
      );
      print('✅ SendLocationDialog: Location display container created');
    } else if (disabled) {
      contentWidget = Text(L10n.of(context).locationDisabledNotice);
    } else if (denied) {
      contentWidget = Text(L10n.of(context).locationPermissionDeniedNotice);
    } else if (error != null) {
      contentWidget =
          Text(L10n.of(context).errorObtainingLocation(error.toString()));
    } else {
      contentWidget = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          const SizedBox(width: 12),
          Text(L10n.of(context).obtainingLocation),
        ],
      );
    }
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1B1C30),
              const Color(0xFF2A2D4A),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3976F8),
                    const Color(0xFF5C1697),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.share_location,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          L10n.of(context).shareLocation,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context, rootNavigator: false).pop(),
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onSubmitted: _searchLocation,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Search city, country...',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              prefixIcon: Icon(Icons.search, color: const Color(0xFF3976F8)),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        if (_isSearching)
                          const Padding(
                            padding: EdgeInsets.all(12),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          )
                        else if (_searchController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {});
                            },
                          )
                        else
                          const SizedBox(width: 48),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3976F8),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () => _searchLocation(_searchController.text),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                child: contentWidget,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: Navigator.of(context, rootNavigator: false).pop,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(L10n.of(context).cancel),
                  ),
                  const SizedBox(width: 12),
                  if (position != null)
                    ElevatedButton(
                      onPressed: isSending ? null : sendAction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3976F8),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSending)
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          else
                            const Icon(Icons.send, size: 18),
                          const SizedBox(width: 8),
                          Text(L10n.of(context).send),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
