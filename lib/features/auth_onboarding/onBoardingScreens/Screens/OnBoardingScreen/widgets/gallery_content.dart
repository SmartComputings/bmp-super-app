import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';
import 'package:bmp/features/chat/chat/gallery_media_preview.dart';
import 'package:matrix/matrix.dart' hide RequestType;
import 'package:bmp/features/chat/chat/chat.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:cross_file/cross_file.dart';

/// A widget that displays the device's full gallery (images + videos) directly 
/// inside the app using OS references. No files are copied or imported.
/// 
/// Key Features:
/// - Uses PhotoManager to access MediaStore (Android) / PhotoKit (iOS)
/// - Loads only thumbnails in the grid (no storage growth)
/// - Full resolution only on user tap
/// - Pagination support for large galleries
/// - Proper permission handling with auto-refresh
class GalleryContent extends StatefulWidget {
  final Function(List<AssetEntity> selectedImages) onImageSelected;
  final ChatController? controller;
  final Room? room;
  
  const GalleryContent({super.key, required this.onImageSelected, this.controller, this.room});

  @override
  State<GalleryContent> createState() => _GalleryContentState();
}

class _GalleryContentState extends State<GalleryContent> with WidgetsBindingObserver {
  /// List of media assets from the device gallery
  List<AssetEntity> _mediaList = [];
  
  /// Currently selected media for sending
  final List<AssetEntity> _selectedMedia = [];
  
  /// Permission status
  bool _hasPermission = false;
  bool _isLimitedAccess = false;
  
  /// Loading states
  bool _isLoading = true;
  bool _isSending = false;
  bool _isLoadingMore = false;
  
  /// Pagination
  int _currentPage = 0;
  static const int _pageSize = 80;
  bool _hasMoreToLoad = true;
  AssetPathEntity? _allAssetsPath;
  
  /// Scroll controller for pagination
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  
  /// Track if we're coming back from settings
  bool _waitingForPermissionFromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);
    _checkAndRequestPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  /// Detects when app resumes from background (e.g., returning from settings)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _waitingForPermissionFromSettings) {
      _waitingForPermissionFromSettings = false;
      _checkAndRequestPermission();
    }
  }

  /// Handle scroll for infinite pagination
  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreAssets();
    }
  }

  /// Check and request gallery permission properly
  /// 
  /// Why permission dialogs may fail to appear:
  /// 1. Permission already granted - no dialog needed
  /// 2. Permission permanently denied - OS won't show dialog again, must use openAppSettings()
  /// 3. On Android 13+, READ_MEDIA_IMAGES and READ_MEDIA_VIDEO are required instead of READ_EXTERNAL_STORAGE
  /// 4. On iOS 14+, user can grant "limited" access - must handle PHAuthorizationStatus.limited
  Future<void> _checkAndRequestPermission() async {
    setState(() => _isLoading = true);
    
    // Use PhotoManager's built-in permission handling which works correctly across platforms
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    
    if (!mounted) return;
    
    setState(() {
      _hasPermission = ps.isAuth || ps == PermissionState.limited;
      _isLimitedAccess = ps == PermissionState.limited;
    });
    
    if (_hasPermission) {
      await _loadGalleryAssets();
    } else {
      setState(() => _isLoading = false);
    }
  }

  /// Open system settings when permission is permanently denied
  Future<void> _openSettings() async {
    _waitingForPermissionFromSettings = true;
    
    // Try PhotoManager's built-in settings opener first
    await PhotoManager.openSetting();
  }

  /// Load the initial batch of gallery assets
  Future<void> _loadGalleryAssets() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _currentPage = 0;
      _mediaList = [];
      _hasMoreToLoad = true;
    });
    
    try {
      // Get all asset paths (albums) from the device
      // RequestType.common includes both images and videos
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        type: RequestType.common,
        hasAll: true,
        onlyAll: true, // Get only the "All" album which contains everything
      );
      
      if (paths.isEmpty) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _hasMoreToLoad = false;
          });
        }
        return;
      }
      
      // Cache the path for pagination
      _allAssetsPath = paths.first;
      
      // Get total count to know if pagination is needed
      final int totalCount = await _allAssetsPath!.assetCountAsync;
      
      // Load first page of assets
      final List<AssetEntity> assets = await _allAssetsPath!.getAssetListPaged(
        page: 0,
        size: _pageSize,
      );
      
      if (mounted) {
        setState(() {
          _mediaList = assets;
          _currentPage = 1;
          _hasMoreToLoad = assets.length < totalCount;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading gallery: $e');
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  /// Load more assets for infinite scroll pagination
  Future<void> _loadMoreAssets() async {
    if (_isLoadingMore || !_hasMoreToLoad || _allAssetsPath == null) return;
    
    setState(() => _isLoadingMore = true);
    
    try {
      final List<AssetEntity> moreAssets = await _allAssetsPath!.getAssetListPaged(
        page: _currentPage,
        size: _pageSize,
      );
      
      if (mounted) {
        setState(() {
          if (moreAssets.isEmpty) {
            _hasMoreToLoad = false;
          } else {
            _mediaList.addAll(moreAssets);
            _currentPage++;
          }
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading more assets: $e');
      if (mounted) {
        setState(() => _isLoadingMore = false);
      }
    }
  }

  /// Toggle selection of a media asset with validation
  void _toggleMediaSelection(AssetEntity asset) {
    setState(() {
      if (_selectedMedia.contains(asset)) {
        _selectedMedia.remove(asset);
      } else {
        final selectedImages = _selectedMedia.where((a) => a.type == AssetType.image).length;
        final selectedVideos = _selectedMedia.where((a) => a.type == AssetType.video).length;
        
        // Validation: Max 8 images
        if (asset.type == AssetType.image && selectedImages >= 8) {
          CustomSnackbar.show(
            context,
            message: L10n.of(context).maxEightImages,
            type: SnackbarType.warning,
          );
          return;
        }
        
        // Validation: Max 2 videos
        if (asset.type == AssetType.video && selectedVideos >= 2) {
          CustomSnackbar.show(
            context,
            message: L10n.of(context).maxTwoVideos,
            type: SnackbarType.warning,
          );
          return;
        }
        
        _selectedMedia.add(asset);
      }
    });
  }

  /// Open preview screen for selected media
  void _openPreview() async {
    final selectedPaths = <String>[];
    for (final asset in _selectedMedia) {
      final file = await asset.file;
      if (file != null) {
        selectedPaths.add(file.path);
      }
    }
    
    if (selectedPaths.isNotEmpty && widget.controller != null && widget.room != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryMediaPreview(
            mediaPaths: selectedPaths,
            controller: widget.controller!,
            room: widget.room!,
          ),
        ),
      );
      
      setState(() {
        _selectedMedia.clear();
        _messageController.clear();
      });
    }
  }

  /// Send selected media to chat
  void _sendSelectedMedia() async {
    if (_isSending || _selectedMedia.isEmpty || widget.controller == null || widget.room == null) return;
    
    setState(() => _isSending = true);
    
    try {
      final hasImages = _selectedMedia.any((asset) => asset.type == AssetType.image);
      final hasVideos = _selectedMedia.any((asset) => asset.type == AssetType.video);
      
      if (hasImages && hasVideos) {
        // Mixed media - send directly without preview
        final caption = _messageController.text.trim();
        
        for (final asset in _selectedMedia) {
          final file = await asset.file;
          if (file != null) {
            final xFile = XFile(file.path);
            final matrixFile = MatrixFile(
              bytes: await xFile.readAsBytes(),
              name: xFile.name,
              mimeType: xFile.mimeType,
            ).detectFileType;

            await widget.room!.sendFileEvent(
              matrixFile,
              shrinkImageMaxDimension: 1600,
            );
          }
        }
        
        if (caption.isNotEmpty) {
          await widget.room!.sendTextEvent(caption);
        }
        
        setState(() {
          _selectedMedia.clear();
          _messageController.clear();
        });
        
        Navigator.of(context).pop();
        return;
      }
      
      final caption = _messageController.text.trim();
      
      if (_selectedMedia.length == 1 && caption.isNotEmpty) {
        // Single media with caption
        final asset = _selectedMedia.first;
        final file = await asset.file;
        if (file != null) {
          final xFile = XFile(file.path);
          final matrixFile = MatrixFile(
            bytes: await xFile.readAsBytes(),
            name: xFile.name,
            mimeType: xFile.mimeType,
          ).detectFileType;

          await widget.room!.sendFileEvent(
            matrixFile,
            shrinkImageMaxDimension: 1600,
            extraContent: {'body': caption},
          );
        }
      } else {
        // Multiple media or single without caption
        for (final asset in _selectedMedia) {
          final file = await asset.file;
          if (file != null) {
            final xFile = XFile(file.path);
            final matrixFile = MatrixFile(
              bytes: await xFile.readAsBytes(),
              name: xFile.name,
              mimeType: xFile.mimeType,
            ).detectFileType;

            await widget.room!.sendFileEvent(
              matrixFile,
              shrinkImageMaxDimension: 1600,
            );
          }
        }
        
        if (caption.isNotEmpty) {
          await widget.room!.sendTextEvent(caption);
        }
      }
      
      setState(() {
        _selectedMedia.clear();
        _messageController.clear();
      });
      
      Navigator.of(context).pop();
    } catch (e) {
      CustomSnackbar.show(
        context,
        message: 'Error: $e',
        type: SnackbarType.error,
      );
    } finally {
      setState(() => _isSending = false);
    }
  }

  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final minutes = duration.inMinutes;
    final remainingSeconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  String _getMediaTypeText() {
    if (_selectedMedia.isEmpty) return '';
    
    final hasImages = _selectedMedia.any((asset) => asset.type == AssetType.image);
    final hasVideos = _selectedMedia.any((asset) => asset.type == AssetType.video);
    
    if (hasImages && hasVideos) {
      return _selectedMedia.length > 1 ? 'Items' : 'Item';
    } else if (hasVideos) {
      return _selectedMedia.length > 1 ? 'Videos' : 'Video';
    } else {
      return _selectedMedia.length > 1 ? 'Photos' : 'Photo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: context.screenHeight * 0.4275,
            padding: EdgeInsets.all(context.screenWidth * 0.015),
            decoration: ShapeDecoration(
              color: const Color(0xFF282130),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.screenWidth * 0.045),
              ),
            ),
            child: Column(
              children: [
                if (!_hasPermission) ...[
                  _buildPermissionUI(),
                ] else if (_isLoading) ...[
                  const Expanded(
                    child: AppLoadingWidget(),
                  ),
                ] else if (_mediaList.isEmpty) ...[
                  _buildEmptyGalleryUI(),
                ] else ...[
                  // Limited access banner
                  if (_isLimitedAccess)
                    _buildLimitedAccessBanner(),
                  
                  // Gallery grid with real device media
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(6),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 6,
                        mainAxisSpacing: 6,
                      ),
                      itemCount: _mediaList.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        // Loading indicator at the bottom
                        if (index >= _mediaList.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            ),
                          );
                        }
                        
                        final asset = _mediaList[index];
                        final isSelected = _selectedMedia.contains(asset);
                        
                        return _MediaThumbnailTile(
                          asset: asset,
                          isSelected: isSelected,
                          onTap: () => _toggleMediaSelection(asset),
                          formatDuration: _formatDuration,
                        );
                      },
                    ),
                  ),
                  
                  // Selection bar with send button
                  if (_selectedMedia.isNotEmpty)
                    _buildSelectionBar(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Permission request UI
  Widget _buildPermissionUI() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library,
              size: context.screenWidth * 0.16,
              color: Colors.white54,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              L10n.of(context).galleryAccessRequired,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.screenWidth * 0.04,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Text(
              'Allow access to view your photos and videos',
              style: TextStyle(
                color: Colors.white60,
                fontSize: context.screenWidth * 0.032,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            ElevatedButton.icon(
              onPressed: _openSettings,
              icon: const Icon(Icons.settings, size: 18),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E24F9),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              label: Text(L10n.of(context).grantPermission),
            ),
          ],
        ),
      ),
    );
  }

  /// Empty gallery UI
  Widget _buildEmptyGalleryUI() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: context.screenWidth * 0.16,
              color: Colors.white54,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'No photos or videos found',
              style: TextStyle(
                color: Colors.white,
                fontSize: context.screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Limited access banner for iOS
  Widget _buildLimitedAccessBanner() {
    return GestureDetector(
      onTap: _openSettings,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF7E24F9).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF7E24F9).withOpacity(0.5)),
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Color(0xFF7E24F9), size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Limited access. Tap to allow full access.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.screenWidth * 0.028,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 12),
          ],
        ),
      ),
    );
  }

  /// Selection bar with caption and send button
  Widget _buildSelectionBar() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color(0xFF1F252D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          // Edit/Preview button
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xff262845),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => _openPreview(),
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Caption input
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF282130),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: L10n.of(context).addCaption,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  isDense: true,
                ),
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Send button with badge
          Stack(
            children: [
              SizedBox(
                width: 58,
                height: 58,
                child: _isSending
                    ? const AppLoadingWidget()
                    : IconButton(
                        onPressed: _sendSelectedMedia,
                        icon: Image.asset(
                          'assets/icons/Send-video-image.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${_selectedMedia.length}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Efficient thumbnail tile widget that loads thumbnails on demand
/// Uses AssetEntity.thumbnailDataWithSize for memory-efficient loading
class _MediaThumbnailTile extends StatelessWidget {
  final AssetEntity asset;
  final bool isSelected;
  final VoidCallback onTap;
  final String Function(int) formatDuration;

  const _MediaThumbnailTile({
    required this.asset,
    required this.isSelected,
    required this.onTap,
    required this.formatDuration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(color: const Color(0xFF7E24F9), width: 3)
              : null,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Thumbnail image - uses memory-efficient thumbnailDataWithSize
              _AssetThumbnail(asset: asset),
              
              // Video play icon overlay
              if (asset.type == AssetType.video)
                const Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 32,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              
              // Video duration badge
              if (asset.type == AssetType.video)
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      formatDuration(asset.duration),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              
              // Selection indicator
              if (isSelected)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7E24F9),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Optimized thumbnail loader using FutureBuilder
/// Only loads thumbnail data, never the full file
class _AssetThumbnail extends StatefulWidget {
  final AssetEntity asset;

  const _AssetThumbnail({required this.asset});

  @override
  State<_AssetThumbnail> createState() => _AssetThumbnailState();
}

class _AssetThumbnailState extends State<_AssetThumbnail> {
  Uint8List? _thumbnailData;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadThumbnail();
  }

  @override
  void didUpdateWidget(_AssetThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.asset.id != widget.asset.id) {
      _loadThumbnail();
    }
  }

  Future<void> _loadThumbnail() async {
    if (!mounted) return;
    
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      // Use thumbnailDataWithSize for efficient memory usage
      // 150x150 is sufficient for grid thumbnails and keeps memory low
      final data = await widget.asset.thumbnailDataWithSize(
        const ThumbnailSize(150, 150),
        quality: 80,
      );
      
      if (mounted) {
        setState(() {
          _thumbnailData = data;
          _isLoading = false;
          _hasError = data == null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.grey[800],
        child: const Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white54),
            ),
          ),
        ),
      );
    }

    if (_hasError || _thumbnailData == null) {
      return Container(
        color: Colors.grey[800],
        child: const Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: 24,
        ),
      );
    }

    return Image.memory(
      _thumbnailData!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      // Crucial for performance: cache the decoded image
      gaplessPlayback: true,
      cacheWidth: 150,
      cacheHeight: 150,
    );
  }
}