import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/circular_icon_widget.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/dynamic_bottom_sheet.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/coming_soon_screen.dart';
import 'package:bmp/features/chat/chat/custom_camera_screen.dart';
import 'package:bmp/features/chat/main_menu/main_menu_screen.dart';
import 'package:bmp/shared/domain/entities/subscription/feature_types.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import '../../../core/localization/l10n.dart';
import '../../../shared/utils/percentage_size_ext.dart';
import 'chat.dart';

class AttachmentDialog extends StatefulWidget {
  final ChatController controller;
  final Room room;

  const AttachmentDialog({
    required this.controller,
    required this.room,
    super.key,
  });

  @override
  State<AttachmentDialog> createState() => _AttachmentDialogState();
}

class _AttachmentDialogState extends State<AttachmentDialog> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dy > 10) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
        width: context.screenWidth * 0.95,
        height: context.screenHeight * 0.38,
        decoration: ShapeDecoration(
          color: const Color(0xFF2A2F35).withValues(alpha: 0.70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.025),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:12),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // First page - 6 items (3 per row)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            height: context.screenHeight * 0.008,
                            width: context.screenWidth * 0.13,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(1000)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/camera.png',
                                label: L10n.of(context).camera,
                                color: const Color(0xFF841CBF),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CustomCameraScreen(
                                        controller: widget.controller,
                                        room: widget.room,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/gallery.png',
                                label: L10n.of(context).gallery,
                                color: const Color(0xFF7E24F9),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showBottomSheet(context, 'gallery');
                                },
                              ),
                            ),
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/document.png',
                                label: L10n.of(context).document,
                                color: const Color(0xFFA912BF),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showBottomSheet(context, 'files');
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/location.png',
                                label: L10n.of(context).location,
                                color: const Color(0xFFF63D3D),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showBottomSheet(context, 'location');
                                },
                              ),
                            ),
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/contact.png',
                                label: L10n.of(context).contact,
                                color: const Color(0xFF17A219),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _showBottomSheet(context, 'contact');
                                },
                              ),
                            ),
                            Expanded(
                              child: _AttachmentOption(
                                imagePath: 'assets/icons/send.png',
                                label: L10n.of(context).send,
                                color: const Color(0xFF5C1697),
                                onTap: () async {
                                  Navigator.of(context).pop();
                                  _showBottomSheet(context, 'send');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Second page - 4 items
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            height: context.screenHeight * 0.01,
                            width: context.screenWidth * 0.1,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(1000)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _AttachmentOption(
                              imagePath: 'assets/icons/receive.png',
                              label: L10n.of(context).request,
                              color: const Color(0xFFDA771B),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ComingSoonScreen(),
                                  ),
                                );
                              },
                            ),
                            _AttachmentOption(
                              imagePath: 'assets/icons/QR.png',
                              label: L10n.of(context).qr,
                              color: const Color(0xFF841CBF),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ComingSoonScreen(),
                                  ),
                                );
                              },
                            ),
                            _AttachmentOption(
                              imagePath: 'assets/icons/gifts.png',
                              label: L10n.of(context).gift,
                              color: const Color(0xFFA2845E),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ComingSoonScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _AttachmentOption(
                              imagePath: 'assets/icons/favorite.png',
                              label: L10n.of(context).favorite,
                              color: const Color(0xFFFFCC00),
                              onTap: () {
                                Navigator.of(context).pop();
                                _showBottomSheet(context, 'favorite');
                              },
                            ),
                            SizedBox(width: context.screenWidth * 0.225),
                            SizedBox(width: context.screenWidth * 0.175),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Page indicator dots
              Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
                      width: context.screenWidth * 0.02,
                      height: context.screenWidth * 0.02,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff1929FF),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String type) {
    showDialog(
      context: context,
      barrierColor: Colors.black54,
      useRootNavigator: false,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: context.screenWidth * 0.025, right: context.screenWidth * 0.025, bottom: context.screenHeight * 0.037),
            child:  GestureDetector(
            onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          Navigator.of(context).pop();
        }
      },
              child: Material(
                color: Colors.transparent,
                child: DynamicBottomSheet(
                  initialType: type,
                  controller: widget.controller,
                  room: widget.room,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildBottomSheetContent(String type) {
  //   Widget content;
  //   final attachmentIcons = _buildAttachmentIcons(type);

  //   switch (type) {
  //     case 'gallery':
  //       content = GalleryContent(
  //         controller: widget.controller,
  //         room: widget.room,
  //         onImageSelected: (selectedImages) async {
  //           Navigator.of(context).pop();
  //           final files = <XFile>[];
  //           for (final asset in selectedImages) {
  //             final file = await asset.file;
  //             if (file != null) {
  //               files.add(XFile(file.path));
  //             }
  //           }
  //           if (files.isNotEmpty) {
  //             widget.controller.sendFileAction(type: FileSelectorType.images, preSelectedFiles: files);
  //           }
  //         },
  //       );
  //       break;
  //     case 'files':
  //       content = FilesContent(
  //         onFileSelected: () {
  //           Navigator.of(context).pop();
  //           widget.controller.sendFileAction();
  //         },
  //       );
  //       break;
  //     case 'location':
  //       content = LocationContent(
  //         onLocationSelected: () {
  //           Navigator.of(context).pop();
  //           widget.controller.sendLocationAction();
  //         },
  //       );
  //       break;
  //     case 'contact':
  //       content = ContactContent(
  //         onContactSelected: () {
  //           Navigator.of(context).pop();
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) =>
  //                   ModernContactSelectionScreen(room: widget.room),
  //             ),
  //           );
  //         },
  //       );
  //       break;
  //     case 'send':
  //       content = SendContent(
  //         room: widget.room,
  //         onTransferSuccess: (transfer) {
  //           Navigator.of(context).pop();
  //         },
  //       );
  //       break;
  //     case 'favorite':
  //       content = FavoriteContent(
  //         onFavoriteSelected: () {
  //           Navigator.of(context).pop();
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => const FavoritesPage(),
  //             ),
  //           );
  //         },
  //       );
  //       break;
  //     default:
  //       content = const SizedBox();
  //   }

  //   return GestureDetector(
  //     onTap: () {}, // Prevent tap from bubbling up
  //    onPanUpdate: (details) {
  //     if (details.delta.dy > 10) {
  //       Navigator.of(context).pop();
  //     }
  //   },
  //     child: CommonBottomSheet(
  //       content: content,
  //       attachmentIcons: attachmentIcons,
  //     ),
  //   );

  // }

  // List<Widget> _buildAttachmentIcons(String selectedType) {
  //   final icons = [
  //     {'type': 'camera', 'image': 'assets/icons/camera.png', 'label': L10n.of(context)!.attachmentCamera},
  //     {
  //       'type': 'gallery',
  //       'image': 'assets/icons/gallery.png',
  //       'label': L10n.of(context)!.attachmentGallery,
  //     },
  //     {'type': 'files', 'image': 'assets/icons/document.png', 'label': L10n.of(context)!.attachmentDocument},
  //     {
  //       'type': 'location',
  //       'image': 'assets/icons/location.png',
  //       'label': L10n.of(context)!.attachmentLocation,
  //     },
  //     {
  //       'type': 'contact',
  //       'image': 'assets/icons/contact.png',
  //       'label': L10n.of(context)!.attachmentContact,
  //     },
  //     {'type': 'send', 'image': 'assets/icons/send.png', 'label': L10n.of(context)!.attachmentSend},
  //     {
  //       'type': 'favorite',
  //       'image': 'assets/icons/favorite.png',
  //       'label': L10n.of(context)!.favorites,
  //     },
  //   ];

  //   return icons.map((icon) {
  //     final isSelected = icon['type'] == selectedType;
  //     return Container(
  //       margin: const EdgeInsets.only(right: 20),
  //       child: GestureDetector(
  //         onTap: () {
  //           if (icon['type'] == 'camera') {
  //             Navigator.of(context).pop();
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => CustomCameraScreen(
  //                   controller: widget.controller,
  //                   room: widget.room,
  //                 ),
  //               ),
  //             );
  //           } else if (icon['type'] != selectedType) {
  //             Navigator.of(context).pop();
  //             _showBottomSheet(context, icon['type'] as String);
  //           }
  //         },
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             CircularIconWidget(
  //               color: const Color(0xFFA912BF),
  //               size: 70,
  //               icon: Image.asset(
  //                 icon['image'] as String,
  //                 width: 35,
  //                 height: 35,
  //                 fit: BoxFit.contain,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             const SizedBox(height: 6),
  //             Text(
  //               icon['label'] as String,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: isSelected ? 13 : 10,
  //                 fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }).toList();
  // }
}

class _AttachmentOption extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final VoidCallback onTap;
  final double? customSize;
  final double? textPadding;
  final Color? color;

  const _AttachmentOption({
    this.icon,
    this.imagePath,
    required this.label,
    required this.onTap,
    this.customSize,
    this.textPadding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularIconWidget(
            color: color ?? const Color(0xFFA912BF),
            size: context.screenWidth * 0.175,
            icon: imagePath != null
                ? Image.asset(
              imagePath!,
              width: context.screenWidth * 0.07,
              height: context.screenWidth * 0.07,
              fit: BoxFit.contain,
              color: Colors.white,
            )
                : Icon(
              icon!,
              size: context.screenWidth * 0.07,
              color: Colors.white,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.0075),
          Text(
            label,
            style: TextStyle(
              fontSize: context.screenWidth * 0.035,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
