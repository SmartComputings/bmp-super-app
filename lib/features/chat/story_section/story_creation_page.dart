import 'dart:io';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/features/chat/story_section/providers/chat/story_service.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/future_loading_dialog.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class StoryCreationPage extends StatefulWidget {
  const StoryCreationPage({super.key});

  @override
  State<StoryCreationPage> createState() => _StoryCreationPageState();
}

class _StoryCreationPageState extends State<StoryCreationPage> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _captionFocusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();
  
  StoryType _selectedType = StoryType.text;
  String _backgroundColor = '#6B46C1';
  final String _textColor = '#FFFFFF';
  File? _selectedMedia;
  
  final List<String> _backgroundColors = [
    '#6B46C1', '#DC2626', '#059669', '#D97706',
    '#7C3AED', '#DB2777', '#0891B2', '#65A30D',
  ];

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissiblePopScope(
      focusNodes: [_captionFocusNode],
      child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          L10n.of(context).createStory,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: _createStory,
            child: Text(
              L10n.of(context).share,
              style: const TextStyle(
                color: Color(0xFFC67EF0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Story Type Selector
          Container(
            height: context.screenHeight * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTypeButton(L10n.of(context).text, StoryType.text, Icons.text_fields),
                SizedBox(width: context.screenWidth * 0.04),
                _buildTypeButton(L10n.of(context).photo, StoryType.image, Icons.photo),
                SizedBox(width: context.screenWidth * 0.04),
                _buildTypeButton(L10n.of(context).video, StoryType.video, Icons.videocam),
              ],
            ),
          ),
          
          // Story Preview
          Expanded(
            child: Container(
              margin: EdgeInsets.all(context.screenWidth * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _selectedType == StoryType.text 
                    ? Color(int.parse(_backgroundColor.substring(1), radix: 16) + 0xFF000000)
                    : Colors.grey[900],
              ),
              child: _buildStoryPreview(),
            ),
          ),
          
          // Controls
          Container(
            height: context.screenHeight * 0.15,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: _buildControls(),
            ),
          ),
        ],
      ),
    ),);
  }

  Widget _buildTypeButton(String label, StoryType type, IconData icon) {
    final isSelected = _selectedType == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = type),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.04,
          vertical: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC67EF0) : Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: context.screenWidth * 0.05),
            SizedBox(width: context.screenWidth * 0.02),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryPreview() {
    switch (_selectedType) {
      case StoryType.text:
        return Center(
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.06),
            child: TextField(
              controller: _textController,
              focusNode: _captionFocusNode,
              style: TextStyle(
                color: Color(int.parse(_textColor.substring(1), radix: 16) + 0xFF000000),
                fontSize: context.screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: L10n.of(context).typeYourStory,
                hintStyle: const TextStyle(color: Colors.white54),
              ),
            ),
          ),
        );
      case StoryType.image:
      case StoryType.video:
        return _selectedMedia != null
            ? _selectedType == StoryType.image
                ? Image.file(_selectedMedia!, fit: BoxFit.cover)
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: context.screenWidth * 0.2,
                            color: Colors.white,
                          ),
                          SizedBox(height: context.screenHeight * 0.02),
                          Text(
                            L10n.of(context).videoSelected,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.screenWidth * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _selectedType == StoryType.image ? Icons.photo : Icons.videocam,
                      size: context.screenWidth * 0.2,
                      color: Colors.white54,
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    Text(
                      _selectedType == StoryType.image ? L10n.of(context).tapToSelectPhoto : L10n.of(context).tapToSelectVideo,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: context.screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
              );
    }
  }

  Widget _buildControls() {
    if (_selectedType == StoryType.text) {
      return Column(
        children: [
          // Background Colors
          SizedBox(
            height: context.screenHeight * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _backgroundColors.length,
              itemBuilder: (context, index) {
                final color = _backgroundColors[index];
                final isSelected = _backgroundColor == color;
                return GestureDetector(
                  onTap: () => setState(() => _backgroundColor = color),
                  child: Container(
                    width: context.screenWidth * 0.12,
                    height: context.screenWidth * 0.12,
                    margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: Color(int.parse(color.substring(1), radix: 16) + 0xFF000000),
                      shape: BoxShape.circle,
                      border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMediaButton(
            L10n.of(context).gallery,
            Icons.photo_library,
            () => _pickMedia(ImageSource.gallery),
          ),
          _buildMediaButton(
            L10n.of(context).camera,
            Icons.camera_alt,
            () => _pickMedia(ImageSource.camera),
          ),
        ],
      );
    }
  }

  Widget _buildMediaButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.06,
          vertical: context.screenHeight * 0.015,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFC67EF0),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: context.screenWidth * 0.05),
            SizedBox(width: context.screenWidth * 0.02),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickMedia(ImageSource source) async {
    try {
      final file = _selectedType == StoryType.image
          ? await _picker.pickImage(source: source)
          : await _picker.pickVideo(source: source);
      
      if (file != null) {
        setState(() {
          _selectedMedia = File(file.path);
        });
      }
    } catch (e) {
     CustomSnackbar.show(
  context,
  title: L10n.of(context).error,
  message: '${L10n.of(context).error} ${L10n.of(context).errorPickingMedia(e.toString())}',
  type: SnackbarType.error,
);

    }
  }

  Future<void> _createStory() async {
    final storyService = Provider.of<StoryService>(context, listen: false);
    
    try {
      await showFutureLoadingDialog(
        context: context,
        future: () async {
          if (_selectedType == StoryType.text) {
            if (_textController.text.trim().isEmpty) {
              throw Exception(L10n.of(context).pleaseEnterSomeText);
            }
            await storyService.createTextStory(
              text: _textController.text.trim(),
              backgroundColor: _backgroundColor,
              textColor: _textColor,
            );
          } else {
            if (_selectedMedia == null) {
              throw Exception(_selectedType == StoryType.image ? L10n.of(context).pleaseSelectAPhoto : L10n.of(context).pleaseSelectAVideo);
            }
            await storyService.createMediaStory(
              mediaFile: _selectedMedia!,
              type: _selectedType,
              caption: _textController.text.trim().isNotEmpty ? _textController.text.trim() : null,
            );
          }
        },
      );
      
     if (mounted) {
  context.pop();
  CustomSnackbar.show(
    context,
    title: L10n.of(context).success,
    message: L10n.of(context).storyCreatedSuccessfully,
    type: SnackbarType.success,
  );
}

   } catch (e) {
  if (mounted) {
    CustomSnackbar.show(
      context,
      title: L10n.of(context).error,
      message: '${L10n.of(context).error} ${L10n.of(context).errorCreatingStory(e.toString())}',
      type: SnackbarType.error,
    );
  }
}

  }

  @override
  void dispose() {
    _textController.dispose();
    _captionFocusNode.dispose();
    super.dispose();
  }
}