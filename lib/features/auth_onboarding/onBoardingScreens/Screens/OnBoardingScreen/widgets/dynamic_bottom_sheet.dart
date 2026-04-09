import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/circular_icon_widget.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/circular_icon_widget_no_shadow.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/common_bottom_sheet.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/contact_content.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/favorite_content.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/files_content.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/gallery_content.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/location_content.dart';
// send_content removed

import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/features/chat/chat/contact_selection_screen.dart';
import 'package:bmp/features/chat/chat/custom_camera_screen.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:image_picker/image_picker.dart';

class DynamicBottomSheet extends StatefulWidget {
  final String initialType;
  final ChatController controller;
  final Room room;

  const DynamicBottomSheet({
    super.key,
    required this.initialType,
    required this.controller,
    required this.room,
  });

  @override
  State<DynamicBottomSheet> createState() => _DynamicBottomSheetState();
}

class _DynamicBottomSheetState extends State<DynamicBottomSheet> {
  late String currentType;
  String? previousType;
  final ScrollController _scrollController = ScrollController();
  final List<String> _typeOrder = ['camera', 'gallery', 'files', 'location', 'contact', 'favorite'];
  int _currentPage = 0;
  final int _itemsPerPage = 3;

  @override
  void initState() {
    super.initState();
    currentType = widget.initialType;
    final itemIndex = _typeOrder.indexOf(currentType);
    _currentPage = itemIndex ~/ _itemsPerPage;
    
    _scrollController.addListener(_onScroll);
    
    // Center the selected icon after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerActiveIcon(currentType);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final itemWidth = context.screenWidth * 0.25;
      final scrollOffset = _scrollController.offset;
      final pageWidth = itemWidth * _itemsPerPage;
      final newPage = (scrollOffset / pageWidth).round().clamp(0, (_typeOrder.length / _itemsPerPage).ceil() - 1);
      
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    }
  }

  void _switchContent(String newType) {
    if (mounted && newType != currentType) {
      setState(() {
        previousType = currentType;
        currentType = newType;
        final itemIndex = _typeOrder.indexOf(newType);
        _currentPage = itemIndex ~/ _itemsPerPage;
      });
      
      _centerActiveIcon(newType);
    }
  }
  
  void _centerActiveIcon(String type) {
    final activeIndex = _typeOrder.indexOf(type);
    if (activeIndex != -1 && _scrollController.hasClients) {
      final itemWidth = context.screenWidth * 0.25;
      final screenWidth = MediaQuery.of(context).size.width;
      final totalWidth = _typeOrder.length * itemWidth;
      
      // Calculate offset to center the active icon
      final targetOffset = (activeIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);
      final maxOffset = (totalWidth - screenWidth + context.screenWidth * 0.1).clamp(0.0, double.infinity);
      
      _scrollController.animateTo(
        targetOffset.clamp(0.0, maxOffset),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildContent() {
    switch (currentType) {
      case 'gallery':
        return GalleryContent(
          controller: widget.controller,
          room: widget.room,
          onImageSelected: (selectedImages) async {
            Navigator.of(context).pop();
            final files = <XFile>[];
            for (final asset in selectedImages) {
              final file = await asset.file;
              if (file != null) {
                files.add(XFile(file.path));
              }
            }
            if (files.isNotEmpty) {
              widget.controller.sendFileAction(type: FileSelectorType.images, preSelectedFiles: files);
            }
          },
        );
      case 'files':
        return FilesContent(
          room: widget.room,
          onFileSelected: () {
            Navigator.of(context).pop();
            widget.controller.sendFileAction();
          },
        );
      case 'location':
        return LocationContent(
          room: widget.room,
          onLocationSelected: () {
            Navigator.of(context).pop();
          },
        );
      case 'contact':
        return ContactContent(
          room: widget.room,
          onContactSelected: () {
            Navigator.of(context).pop();
          },
        );
      case 'send':
        return Container(); // Disabled finance feature
      case 'favorite':
        return FavoriteContent(
          onFavoriteSelected: () {
            Navigator.of(context).pop();
          },
        );
      default:
        return const SizedBox();
    }
  }

  List<Widget> _buildAttachmentIcons() {
    final icons = [
      {'type': 'camera', 'image': 'assets/icons/camera.png', 'label': L10n.of(context).camera, 'color': const Color(0xFF841CBF)},
      {'type': 'gallery', 'image': 'assets/icons/gallery.png', 'label': L10n.of(context).gallery, 'color': const Color(0xFF7E24F9)},
      {'type': 'files', 'image': 'assets/icons/document.png', 'label': L10n.of(context).document, 'color': const Color(0xFFA912BF)},
      {'type': 'location', 'image': 'assets/icons/location.png', 'label': L10n.of(context).location, 'color': const Color(0xFFF63D3D)},
      {'type': 'contact', 'image': 'assets/icons/contact.png', 'label': L10n.of(context).contact, 'color': const Color(0xFF17A219)},
// send icon removed

      {'type': 'favorite', 'image': 'assets/icons/favorite.png', 'label': L10n.of(context).favorite, 'color': const Color(0xFFFFCC00)},
    ];

    return icons.map((icon) {
      final isSelected = icon['type'] == currentType;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(right: context.screenWidth * 0.08),
        child: GestureDetector(
          onTap: () {
            if (icon['type'] == 'camera') {
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
            } else {
              _switchContent(icon['type']! as String);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth*0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: isSelected 
                    ? CircularIconWidget(
                        key: ValueKey('selected_${icon['type']}'),
                        color: icon['color'] as Color,
                        size: 70,
                        icon: Image.asset(
                          icon['image']! as String,
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      )
                    : CircularIconWidgetNoShadow(
                        key: ValueKey('unselected_${icon['type']}'),
                        color: const Color(0x33858188),
                        size: 70,
                        icon: Image.asset(
                          icon['image']! as String,
                          width: 35,
                          height: 35,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                ),
                SizedBox(height: context.screenHeight * 0.0075),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 500),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isSelected ? context.screenWidth * 0.0325 : context.screenWidth * 0.025,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  ),
                  child: Text(icon['label']! as String),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (_typeOrder.length / _itemsPerPage).ceil();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: CommonBottomSheet(
      scrollController: _scrollController,
      currentPage: _currentPage,
      totalPages: totalPages,
      content: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Determine slide direction based on type order
            var slideBegin = const Offset(0, 1); // Default: bottom to top
            
            if (previousType != null) {
              final currentIndex = _typeOrder.indexOf(currentType);
              final previousIndex = _typeOrder.indexOf(previousType!);
              
              if (currentIndex > previousIndex) {
                // Moving forward: slide from bottom
                slideBegin = const Offset(0, 1);
              } else {
                // Moving backward: slide from top
                slideBegin = const Offset(0, -1);
              }
            }
            
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: slideBegin,
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),),
                child: child,
              ),
            );
          },
          child: Container(
            key: ValueKey(currentType),
            child: _buildContent(),
          ),
        ),
        attachmentIcons: _buildAttachmentIcons(),
      ),
    );
  }
}