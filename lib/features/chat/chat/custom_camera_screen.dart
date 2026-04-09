import 'dart:async';

import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'chat.dart';
import 'media_preview_screen.dart';
 
class CustomCameraScreen extends StatefulWidget {
  final ChatController controller;
  final Room room;
 
  const CustomCameraScreen({
    required this.controller,
    required this.room,
    super.key,
  });
 
  @override
  State<CustomCameraScreen> createState() => _CustomCameraScreenState();
}
 
class _CustomCameraScreenState extends State<CustomCameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isFlashOn = false;
  bool _isRecording = false;
  int _currentCameraIndex = 0;
  Offset? _focusPoint;
  int _recordingSeconds = 0;
  Timer? _recordingTimer;
  bool _isSwitchingCamera = false;
 
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }
 
  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _controller = CameraController(
          _cameras![_currentCameraIndex],
          ResolutionPreset.high,
          enableAudio: true,
        );
        await _controller!.initialize();
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e) {
      print('Camera initialization error: $e');
      if (mounted) {
        setState(() {});
      }
    }
  }
 
  @override
  void dispose() {
    _controller?.dispose();
    _recordingTimer?.cancel();
    super.dispose();
  }
 
  Future<void> _toggleFlash() async {
    if (_controller != null) {
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
      await _controller!
          .setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    }
  }
 
  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final image = await _controller!.takePicture();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MediaPreviewScreen(
              mediaPath: image.path,
              isVideo: false,
              controller: widget.controller,
              room: widget.room,
            ),
          ),
        );
      } catch (e) {
        print('Error taking picture: $e');
      }
    }
  }
 
  Future<void> _toggleRecording() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        if (_isRecording) {
          // Stop recording
          final video = await _controller!.stopVideoRecording();
          setState(() {
            _isRecording = false;
          });
          _recordingTimer?.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MediaPreviewScreen(
                mediaPath: video.path,
                isVideo: true,
                controller: widget.controller,
                room: widget.room,
              ),
            ),
          );
        } else {
          // Start recording
          await _controller!.startVideoRecording();
          setState(() {
            _isRecording = true;
            _recordingSeconds = 0;
          });
          _startTimer();
        }
      } catch (e) {
        print('Error recording video: $e');
        setState(() {
          _isRecording = false;
        });
        _recordingTimer?.cancel();
      }
    }
  }
 
  Future<void> _switchCamera() async {
    if (_cameras != null && _cameras!.length > 1 && !_isSwitchingCamera) {
      try {
        setState(() {
          _isSwitchingCamera = true;
        });
        
        final wasRecording = _isRecording;
        
        // If recording, stop current recording
        if (wasRecording) {
          await _controller!.stopVideoRecording();
          setState(() {
            _isRecording = false;
          });
        }
        
        _currentCameraIndex = (_currentCameraIndex + 1) % _cameras!.length;
        await _controller?.dispose();
        _controller = CameraController(
          _cameras![_currentCameraIndex],
          ResolutionPreset.high,
          enableAudio: true,
        );
        await _controller!.initialize();
        
        // If was recording, restart recording
        if (wasRecording) {
          await _controller!.startVideoRecording();
          setState(() {
            _isRecording = true;
          });
        }
        
        if (mounted) {
          setState(() {
            _isSwitchingCamera = false;
          });
        }
      } catch (e) {
        print('Switch camera error: $e');
        if (mounted) {
          setState(() {
            _isSwitchingCamera = false;
          });
        }
      }
    }
  }
 
  void _startTimer() {
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _recordingSeconds++;
      });
    });
  }
 
  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
 
  Future<void> _onTapToFocus(TapUpDetails details) async {
    if (_controller != null && _controller!.value.isInitialized) {
      final renderBox = context.findRenderObject() as RenderBox;
      final localPoint = renderBox.globalToLocal(details.globalPosition);
      final focusPoint = Offset(
        localPoint.dx / renderBox.size.width,
        localPoint.dy / renderBox.size.height,
      );
 
      setState(() {
        _focusPoint = localPoint;
      });
 
      await _controller!.setFocusPoint(focusPoint);
      await _controller!.setExposurePoint(focusPoint);
 
      // Hide focus circle after 2 seconds
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _focusPoint = null;
          });
        }
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized || _isSwitchingCamera) {
      return const Scaffold(
        backgroundColor: Color(0xFF131016),
        body: AppLoadingWidget(),
      );
    }
 
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF131016),
        body: Stack(
          children: [
            // Camera Preview
            Positioned.fill(
              child: GestureDetector(
                onTapUp: _onTapToFocus,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller!.value.previewSize!.height,
                    height: _controller!.value.previewSize!.width,
                    child: CameraPreview(_controller!),
                  ),
                ),
              ),
            ),
       
            // Focus Circle
            if (_focusPoint != null)
              Positioned(
                left: _focusPoint!.dx - 40,
                top: _focusPoint!.dy - 40,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.yellow,
                      width: 2,
                    ),
                  ),
                ),
              ),
       
            // Back Button
            Positioned(
              left: 16,
              top: 50,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  ImageAssets.arrowLeft,
                  width: 40,
                  height: 40,
                  color: const Color.fromARGB(255, 255, 255, 255)
      ,
                ),
              ),
            ),
       
            // Timer (when recording)
            if (_isRecording)
              Positioned(
                left: 0,
                right: 0,
                top: 60,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFEF2F2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF63D3D),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(_recordingSeconds),
                          style: const TextStyle(
                            color: Color(0xFFF63D3D),
                            fontSize: 12,
                            fontFamily: 'All Round Gothic',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
       
            // Bottom Controls
            Positioned(
              left: 0,
              bottom: context.screenHeight*0.02,
              child: _isRecording
                  ? _buildRecordingControls()
                  : _buildNormalControls(),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildNormalControls() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 75,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment(0.50, 0.00),
      //     end: Alignment(0.50, 1.00),
      //     colors: [const Color(0x001F252D), const Color(0xFF1F252D)],
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Flash Button
          Flexible(
            child: GestureDetector(
              onTap: _toggleFlash,
              child: Image.asset(
                'assets/images/icons/flash.png',
                width: 68,
                height: 75,
              ),
            ),
          ),
          // Video Button
 
          Flexible(
            child: GestureDetector(
              onTap: _toggleRecording,
              child: Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isRecording ? const Color(0xFFF63D3D) : null,
                  boxShadow: _isRecording
                      ? [
                          const BoxShadow(
                            color: Color(0x66F63D3D),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: _isRecording
                    ? const Icon(
                        Icons.stop,
                        color: Colors.white,
                        size: 40,
                      )
                    : Image.asset(
                        'assets/images/icons/vedio.png',
                        width: 64,
                        height: 65,
                      ),
              ),
            ),
          ),
          // Picture Button
          Flexible(
            child: GestureDetector(
              onTap: _takePicture,
              child: Image.asset(
                'assets/images/icons/picture.png',
                width: 78,
                height: 78,
              ),
            ),
          ),
          // Switch Camera Button
          Flexible(
            child: GestureDetector(
              onTap: _switchCamera,
              child: Image.asset(
                'assets/images/icons/changecamera.png',
                width: 80,
                height: 85,
              ),
            ),
          ),
        ],
      ),
    );
  }
 
  Widget _buildRecordingControls() {
    return SizedBox(
    height: 60,
     
      width: MediaQuery.of(context).size.width,
     
     
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 104,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stop/Star
                //t Recording Button
                const Spacer(),
 
                GestureDetector(
                  onTap: _toggleRecording,
                  child: Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        'assets/images/icons/Icon Button (5).png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: _switchCamera,
                  child: Image.asset(
                    'assets/images/icons/changecamera.png',
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
 