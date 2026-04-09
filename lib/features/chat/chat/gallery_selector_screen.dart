import 'dart:io';
import 'dart:typed_data';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../core/localization/l10n.dart';

class GallerySelectorScreen extends StatefulWidget {
  final List<String> preSelectedImages;
  
  const GallerySelectorScreen({
    super.key,
    required this.preSelectedImages,
  });

  @override
  State<GallerySelectorScreen> createState() => _GallerySelectorScreenState();
}

class _GallerySelectorScreenState extends State<GallerySelectorScreen> {
  List<AssetEntity> _mediaList = [];
  List<String> _selectedImagePaths = [];
  bool _hasPermission = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _selectedImagePaths = List.from(widget.preSelectedImages);
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    setState(() {
      _hasPermission = ps.isAuth;
    });
    if (_hasPermission) {
      _loadGalleryImages();
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadGalleryImages() async {
    setState(() => _isLoading = true);
    try {
      final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
        type: RequestType.common,
      );
      if (paths.isNotEmpty) {
        final List<AssetEntity> media = await paths[0].getAssetListPaged(
          page: 0,
          size: 200,
        );
        setState(() {
          _mediaList = media;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleImageSelection(AssetEntity asset) async {
    final file = await asset.file;
    if (file != null) {
      setState(() {
        if (_selectedImagePaths.contains(file.path)) {
          _selectedImagePaths.remove(file.path);
        } else {
          _selectedImagePaths.add(file.path);
        }
      });
    }
  }

  Future<bool> _isImageSelected(AssetEntity asset) async {
    final file = await asset.file;
    return file != null && _selectedImagePaths.contains(file.path);
  }

  String _getSelectPhotosText(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'es') {
      return 'Seleccionar Fotos (${_selectedImagePaths.length})';
    }
    return 'Select Photos (${_selectedImagePaths.length})';
  }

  String _getGalleryAccessText(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'es') {
      return 'Acceso a Galería Requerido';
    }
    return 'Gallery Access Required';
  }

  String _getGrantPermissionText(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'es') {
      return 'Conceder Permiso';
    }
    return 'Grant Permission';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1C30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1C30),
        title: Text(
          _getSelectPhotosText(context),
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_selectedImagePaths.isNotEmpty)
            TextButton(
              onPressed: () => Navigator.pop(context, _selectedImagePaths),
              child: Text(
                L10n.of(context).done,
                style: const TextStyle(color: Color(0xFF7E24F9), fontSize: 16),
              ),
            ),
        ],
      ),
      body: !_hasPermission
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.photo_library, size: 64, color: Colors.white54),
                  const SizedBox(height: 16),
                  Text(
                    _getGalleryAccessText(context),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _checkPermission,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7E24F9),
                    ),
                    child: Text(_getGrantPermissionText(context)),
                  ),
                ],
              ),
            )
          : _isLoading
              ? AppLoadingWidget()
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: _mediaList.length,
                  itemBuilder: (context, index) {
                    final asset = _mediaList[index];
                    
                    return FutureBuilder<bool>(
                      future: _isImageSelected(asset),
                      builder: (context, snapshot) {
                        final isSelected = snapshot.data ?? false;
                        
                        return GestureDetector(
                          onTap: () => _toggleImageSelection(asset),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: isSelected 
                                  ? Border.all(color: const Color(0xFF7E24F9), width: 3)
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: AssetEntityImage(
                                    asset,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (asset.type == AssetType.video)
                                  Positioned(
                                    bottom: 4,
                                    right: 4,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          Text(
                                            '${asset.duration}s',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (isSelected)
                                  Positioned(
                                    top: 4,
                                    right: 4,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF7E24F9),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}

class AssetEntityImage extends StatelessWidget {
  final AssetEntity asset;
  final BoxFit fit;
  
  const AssetEntityImage(
    this.asset, {
    super.key,
    this.fit = BoxFit.cover,
  });
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Image.memory(
            snapshot.data!,
            fit: fit,
            width: double.infinity,
            height: double.infinity,
          );
        }
        return Container(
          color: Colors.grey[800],
          child: const Icon(Icons.image, color: Colors.grey),
        );
      },
    );
  }
}