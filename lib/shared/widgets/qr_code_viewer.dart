import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/auth_onboarding/widgets/bg_gradient_theme.dart';
import 'package:bmp/shared/providers/check_username_provider.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/utils/url_launcher.dart';
import 'package:bmp/shared/utils/username_helper.dart';
import 'package:bmp/shared/widgets/Backgroundgradient/constants/position_constants.dart';
import 'package:bmp/shared/widgets/adaptive_dialogs/user_dialog.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:matrix/matrix.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:qr_image/qr_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showQrCodeViewer(
  BuildContext context,
  String content, {
  String? name,
  String? subtitle,
  Room? room,
  String? avatarUrl,
  QrCodeType type = QrCodeType.chat,
}) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QrCodeViewer(
          content: content,
          name: name,
          subtitle: subtitle,
          room: room,
          avatarUrl: avatarUrl,
          type: type,
        ),
      ),
    );

enum QrCodeType { chat }

class QrCodeViewer extends StatefulWidget {
  final String content;
  final String? name;
  final String? subtitle;
  final Room? room;
  final String? avatarUrl;
  final QrCodeType type;

  const QrCodeViewer({
    required this.content,
    this.name,
    this.subtitle,
    this.room,
    this.avatarUrl,
    this.type = QrCodeType.chat,
    super.key,
  });

  @override
  State<QrCodeViewer> createState() => _QrCodeViewerState();
}

class _QrCodeViewerState extends State<QrCodeViewer> {
  int selectedTab = 0;

  Future<String?> _getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('phone_no');
    debugPrint('✅ QR Viewer: Phone number retrieved: $phone');
    return phone;
  }

  void _save(BuildContext context) async {
    final imageResult = await showFutureLoadingDialog(
      context: context,
      future: () async {
        final qrContent = 'https://be-mindpower.net/#/${widget.content}'; // For chat, use invite link
        final image = QRImage(
          qrContent,
          size: 256,
          radius: 1,
        ).generate();
        return compute(img.encodePng, image);
      },
    );
    final bytes = imageResult.result;
    if (bytes == null) return;
    if (!context.mounted) return;

    final fileName = widget.content.contains(':')
        ? widget.content.split(':')[0]
        : widget.content;
    const prefix = 'QR_Code';
    MatrixImageFile(
      bytes: bytes,
      name: '${prefix}_$fileName.png',
      mimeType: 'image/png',
    ).save(context);
  }

  void _openUserModal(Profile profile) {
    showAdaptiveDialog(
      context: context,
      builder: (dialogContext) => UserDialog(
        profile,
        onStartConversation: (String roomId) {
          if (mounted) {
            Navigator.of(context).pop();
            GoRouter.of(context).go('/rooms/$roomId');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final qrContent = 'https://be-mindpower.net/#/${widget.content}'; // For chat, use invite link
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
                color: const Color(0xFF1B1C30)),
          ),

          BgGradientTheme(
            position: ShapePosition.center,
            width: context.screenWidth * 1.75,
            height: context.screenHeight * 0.875,
            gradient: const RadialGradient(
              colors: [
                Color(0xFF4754FF),
                Colors.transparent,
              ],
            ),
            opacity: 0.45,
          ),
          // Finance gradients removed

          BgGradientTheme(
            position: ShapePosition.topLeft,
            width: context.screenWidth * 0.55,
            height: context.screenHeight * 0.275,
            color: Colors.black,
            opacity: 0.25,
          ),

          BgGradientTheme(
            position: ShapePosition.topRight,
            width: context.screenWidth * 0.55,
            height: context.screenHeight * 0.275,
            color: Colors.black,
            opacity: 0.25,
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Main content area
          if (selectedTab == 0)
            _buildMyQrTab(context, qrContent, theme)
          else
            _buildScanQrTab(context),

          // Close button

          // Bottom tabs
          Positioned(
            left: 0,
            right: 0,
            bottom: context.screenHeight * 0.08,
            child: _buildBottomTabs(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMyQrTab(
      BuildContext context, String qrContent, ThemeData theme) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: context.screenHeight * 0.75,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.01,
                    vertical: context.screenHeight * 0.0,
                  ),
                  child: Container(
                    height: context.screenHeight * 0.75,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF5F18BF),
                                Color(0xFF5F18BF),
                                Color(0xFF7216BF),
                              ],
                              stops: [0.0, 0.6, 1.0],
                            ),
                      border: Border.all(
                        color: AppColors.vividPurple,
                        width: 1,
                      ),
                      borderRadius:
                          BorderRadius.circular(context.screenWidth * 0.02),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.screenHeight * 0.0,
                        ),
                        _buildHeaderSection(
                          context: context,
                          room: widget.room,
                          Name: widget.name,
                          Subtitle: widget.subtitle,
                          qrContent: qrContent,
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.05,
                        ),
                        Container(
                          height: context.screenHeight * 0.31,
                          width: context.screenWidth * 0.8,
                          padding: EdgeInsets.all(context.screenWidth * 0.04),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppConfig.borderRadius),
                          ),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: FluffyThemes.columnWidth,
                              ),
                              child: PrettyQrView.data(
                                data: qrContent,
                                decoration: PrettyQrDecoration(
                                  shape: PrettyQrSmoothSymbol(
                                    roundFactor: 1,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //   ),
    );
  }

  Widget _buildHeaderSection({
    required BuildContext context,
    required Room? room,
    required String? Name,
    required String? Subtitle,
    required String qrContent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Card(
        elevation: 10,
        //   shadowColor: const Color(0xff1B1C30),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(context.screenWidth * 0.05)),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.33,
          decoration: BoxDecoration(
            color: const Color(0xFF5F18BF),
            border: Border.all(
              color: const Color(0xff7216BF).withOpacity(1.0),
              width: 1,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(context.screenWidth * 0.05)),
          ),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.blueBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(context.screenWidth * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: 
                            Image.asset(
                              ImageAssets.arrowLeft,
                              width: context.screenWidth * 0.1,
                              height: context.screenWidth * 0.1,
                            ),
                          ),
                          SizedBox()
                        
                          // IconButton(
                          //   style: IconButton.styleFrom(
                          //     backgroundColor:
                          //         const Color(0xffFFFFFF).withAlpha(128),
                          //   ),
                          //   icon: const Icon(Icons.download_outlined),
                          //   onPressed: () => _save(context),
                          //   color: Colors.white,
                          //   tooltip: L10n.of(context).downloadFile,
                          // ),
                          //       ],
                          //     ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.06,
                left: 0,
                right: 0,
                child: Center(
                  child: FutureBuilder<Profile>(
                    future: widget.room?.client
                            .getProfileFromUserId(widget.room!.client.userID!),
                    builder: (context, snapshot) {
                      final profile = snapshot.data;
                      final avatarUrl =
                          profile?.avatarUrl?.toString() ?? widget.avatarUrl;

                      return CircleAvatar(
                        radius: context.screenWidth * 0.1575,
                        backgroundColor: Colors.white,
                        child: avatarUrl != null && avatarUrl.isNotEmpty
                            ? Avatar(                              
                                mxContent: Uri.tryParse(avatarUrl),
                                name: Name,
                                size: context.screenWidth * 0.315,
                              )
                            : Avatar(
                                mxContent: null,
                                name: Name,
                                size: context.screenWidth * 0.315,
                              ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.screenHeight * 0.2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.screenHeight * 0.025),
                    child: Center(
                      child: SelectableText(
                        Name ?? 'Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.005),
                  
                  // FutureBuilder<String?>(
                  //   future: _getPhoneNumber(),
                  //   builder: (context, snapshot) {
                  //     // Only show phone for direct chats
                  //     final usernameBase = widget.roomId?.split(':').first.replaceAll('@', '') ?? '';
                  //     final isDirectChat = widget.room?.isDirectChat ?? false;
                  //     final phoneNumber = snapshot.data;
                      
                  //     if (isDirectChat && phoneNumber != null && phoneNumber.isNotEmpty) {
                  //       return SelectableText(
                  //         phoneNumber,
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           color: Colors.white.withOpacity(0.8),
                  //           fontSize: context.screenWidth * 0.035,
                  //         ),
                  //       );
                  //     }
                  //     return const SizedBox.shrink();
                  //   },
                  // ),
                  SizedBox(height: context.screenHeight * 0.019),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScanQrTab(BuildContext context) {
    return QrScannerModal(
      qrType: widget.type,
      onScan: (link) async {
        // Original chat functionality
        if (link.startsWith('@') && link.contains(':')) {
          final profile = Profile(userId: link);
          _openUserModal(profile);
        } else if (link.contains('/#/@') && link.contains(':')) {
          final userIdStart = link.indexOf('/#/@') + 3;
          final userId = link.substring(userIdStart);
          final profile = Profile(userId: userId);
          _openUserModal(profile);
        } else {
          UrlLauncher(context, link).openMatrixToUrl();
        }
      },
    );
  }

  Widget _buildBottomTabs(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setState(() => selectedTab = 0),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.0375,
                  vertical: context.screenHeight * 0.0125),
              // width: context.screenWidth * 0.2,
              decoration: BoxDecoration(
                color: selectedTab == 0
                    ? const Color(0xff1929FF)
                    : const Color(0xff050926).withOpacity(0.5),
                borderRadius:
                    BorderRadius.circular(context.screenWidth * 0.075),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                    vertical: context.screenHeight * 0.005),
                child: Center(
                  child: Text(
                    L10n.of(context).myQR,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: context.screenWidth * 0.01),
          GestureDetector(
            onTap: () => setState(() => selectedTab = 1),
            child: Container(
              // width: context.screenWidth * 0.2,
              //width: context.screenWidth * 0.2,
              decoration: BoxDecoration(
                color: selectedTab == 1
                    ? const Color(0xff1929FF)
                    : const Color(0xff050926).withOpacity(0.5),
                borderRadius:
                    BorderRadius.circular(context.screenWidth * 0.075),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth * 0.05,
                    vertical: context.screenHeight * 0.005),
                child: Center(
                  child: Text(
                    L10n.of(context).scanQR,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QrScannerModal extends StatefulWidget {
  final void Function(String) onScan;
  final QrCodeType qrType;
  const QrScannerModal({
    required this.onScan,
    this.qrType = QrCodeType.chat,
    super.key,
  });

  @override
  QrScannerModalState createState() => QrScannerModalState();
}

class QrScannerModalState extends State<QrScannerModal> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isFlashOn = false;
  bool _isProcessingGallery = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Future<void> _toggleFlash() async {
    if (controller != null) {
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
      await controller!.toggleFlash();
    }
  }

  /// Pick a single image from gallery
  Future<File?> _pickImageFromGallery() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (file == null) return null;
    return File(file.path);
  }

  /// Decode QR code from image
  Future<String?> _scanQrFromImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) return null;
      
      // Use QRViewController to scan from file
      // Since qr_code_scanner_plus doesn't support image scanning,
      // we'll return null and show appropriate error
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Handle gallery button tap
  Future<void> _handleGalleryTap() async {
    if (_isProcessingGallery) return;

    setState(() {
      _isProcessingGallery = true;
    });

    try {
      final file = await _pickImageFromGallery();
      if (file == null) {
        setState(() {
          _isProcessingGallery = false;
        });
        return;
      }

      final qrData = await _scanQrFromImage(file);

      if (!mounted) return;

      setState(() {
        _isProcessingGallery = false;
      });

      if (qrData == null) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: '${L10n.of(context).notAValidQrCode}',
          type: SnackbarType.error,
        );

        return;
      }

      // Same flow as camera scan
      widget.onScan(qrData);
    } catch (e) {
      if (mounted) {
        setState(() {
          _isProcessingGallery = false;
        });
        CustomSnackbar.show(
          context,
          title: L10n.of(context).error,
          message: '${L10n.of(context).errorScanningImage}',
          type: SnackbarType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            borderRadius: context.screenWidth * 0.025,
            borderLength: context.screenWidth * 0.075,
            borderWidth: context.screenWidth * 0.02,
          ),
        ),
        Positioned(
          left: context.screenWidth * 0.03,
          top: context.screenHeight * 0.05,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              ImageAssets.arrowLeft,
              width: context.screenWidth * 0.1,
              height: context.screenWidth * 0.1,
            ),
          ),
        ),
        Positioned(
          left: context.screenWidth * 0.05,
          bottom: context.screenHeight * 0.075,
          child: GestureDetector(
            onTap: _toggleFlash,
            child: Image.asset(
              ImageAssets.flashIcon,
              width: context.screenWidth * 0.1625,
              height: context.screenWidth * 0.1625,
            ),
          ),
        ),
        // Positioned(
        //   left: context.screenWidth * 0.2,
        //   bottom: context.screenHeight * 0.075,
        //   child: GestureDetector(
        //     onTap: _handleGalleryTap,
        //     child: Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         Image.asset(
        //           ImageAssets.galleryIcon,
        //           width: context.screenWidth * 0.1625,
        //           height: context.screenWidth * 0.1625,
        //         ),
        //         if (_isProcessingGallery)
        //           SizedBox(
        //             width: context.screenWidth * 0.08,
        //             height: context.screenWidth * 0.08,
        //             child: const CircularProgressIndicator(
        //               strokeWidth: 2,
        //               valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //             ),
        //           ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
    late StreamSubscription sub;
    sub = controller.scannedDataStream.listen((scanData) {
      sub.cancel();
      final data = scanData.code;
      if (data != null) widget.onScan(data);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
