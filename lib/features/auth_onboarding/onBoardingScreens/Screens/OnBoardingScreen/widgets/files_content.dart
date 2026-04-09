import 'dart:io';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/app_loading_widget.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart' hide RequestType;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// A widget that displays the user's files directly inside the app.
/// 
/// ## Platform Behavior:
/// 
/// ### Android:
/// - Scans Downloads and Documents folders using scoped storage
/// - Files are referenced, NOT copied (zero storage growth)
/// - Uses permission_handler for storage permissions
/// 
/// ### iOS:
/// - **iOS does NOT allow direct file system browsing**
/// - All apps are sandboxed - no access to other app files
/// - Must use UIDocumentPicker (file_picker) to let user choose files
/// - This is an OS limitation, NOT a bug
/// 
/// The widget follows the same selection → send pattern as GalleryContent.
class FilesContent extends StatefulWidget {
  final Function() onFileSelected;
  final Room? room;

  const FilesContent({super.key, required this.onFileSelected, this.room});

  @override
  State<FilesContent> createState() => _FilesContentState();
}

class _FilesContentState extends State<FilesContent> with WidgetsBindingObserver {
  /// Files loaded from device storage (Android) or picked (iOS)
  List<FileItem> _files = [];
  List<FileItem> _filteredFiles = [];
  
  /// Selected files for sending (max 5)
  final Set<String> _selectedFiles = {};
  
  /// Loading states
  bool _isLoading = true;
  bool _isSending = false;
  bool _hasPermission = false;
  
  /// Current filter/folder
  String _currentFilter = 'all';
  
  /// Waiting for return from settings
  bool _waitingForPermissionFromSettings = false;
  
  /// Controllers
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  /// Max files allowed to select
  static const int _maxFilesAllowed = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _searchController.addListener(_filterFiles);
    _initializeFiles();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _waitingForPermissionFromSettings) {
      _waitingForPermissionFromSettings = false;
      _initializeFiles();
    }
  }

  /// Initialize file loading based on platform
  Future<void> _initializeFiles() async {
    setState(() => _isLoading = true);

    if (Platform.isAndroid) {
      // Try to load files first - some devices allow access to public directories
      // without explicit permission through scoped storage
      await _loadAndroidFiles();
      
      // If no files loaded and we haven't tried permission yet, request it
      if (_files.isEmpty && !_hasPermission) {
        final hasPermission = await _requestStoragePermission();
        if (hasPermission) {
          // Try loading files again after permission granted
          await _loadAndroidFiles();
        }
      }
      
      // Set final state
      if (mounted) {
        setState(() {
          _hasPermission = _files.isNotEmpty || _hasPermission;
          _isLoading = false;
        });
      }
    } else if (Platform.isIOS) {
      // iOS: No direct file system access - show UI with picker option
      setState(() {
        _hasPermission = true;
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  /// Request storage permission - required for Android 11+ to access Downloads
  /// 
  /// Note: On Android 11+ (API 30+), MANAGE_EXTERNAL_STORAGE requires user to 
  /// go to a special settings page - it cannot be granted via normal dialog.
  Future<bool> _requestStoragePermission() async {
    try {
      // Check if we already have MANAGE_EXTERNAL_STORAGE (Android 11+)
      if (await Permission.manageExternalStorage.isGranted) {
        debugPrint('✓ MANAGE_EXTERNAL_STORAGE already granted');
        return true;
      }
      
      // Check if we already have basic storage permission (Android 10 and below)
      if (await Permission.storage.isGranted) {
        debugPrint('✓ Storage permission already granted');
        return true;
      }
      
      // Request MANAGE_EXTERNAL_STORAGE first (Android 11+)
      // This will open a settings page, not a dialog
      var status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        debugPrint('✓ MANAGE_EXTERNAL_STORAGE granted');
        return true;
      }
      
      // Fallback: Request regular storage permission (Android 10 and below)
      status = await Permission.storage.request();
      if (status.isGranted) {
        debugPrint('✓ Storage permission granted');
        return true;
      }
      
      // If permission is permanently denied, we'll show our own UI
      if (status.isPermanentlyDenied) {
        debugPrint('Storage permission permanently denied');
        return false;
      }
      
      debugPrint('Storage permission denied');
      return false;
    } catch (e) {
      debugPrint('Permission error: $e');
      // Even if permission check fails, try to access files anyway
      // Some devices might work without explicit permission
      return true;
    }
  }

  /// Load files from Android Downloads and Documents folders
  Future<void> _loadAndroidFiles() async {
    if (!Platform.isAndroid) return;

    try {
      final List<FileItem> allFiles = [];
      final List<Directory> directoriesToScan = [];
      
      // Download folder paths to try
      final downloadPaths = [
        '/storage/emulated/0/Download',
        '/storage/emulated/0/Downloads',
        '/sdcard/Download',
        '/sdcard/Downloads',
      ];
      
      // Document folder paths to try
      final documentPaths = [
        '/storage/emulated/0/Documents',
        '/sdcard/Documents',
      ];
      
      // Try to find and add Download directories
      for (final path in downloadPaths) {
        try {
          final dir = Directory(path);
          if (await dir.exists()) {
            // Try to list to verify we have permission (don't fail if empty)
            try {
              await dir.list().toList().timeout(const Duration(seconds: 2));
              directoriesToScan.add(dir);
              debugPrint('✓ Can access download dir: $path');
              break;
            } catch (e) {
              debugPrint('✗ Cannot list $path: $e');
            }
          }
        } catch (e) {
          debugPrint('✗ Cannot access $path: $e');
        }
      }
      
      // Try to find and add Documents directories
      for (final path in documentPaths) {
        try {
          final dir = Directory(path);
          if (await dir.exists()) {
            directoriesToScan.add(dir);
            debugPrint('✓ Found documents dir: $path');
            break;
          }
        } catch (e) {
          debugPrint('✗ Cannot access $path: $e');
        }
      }
      
      // Fallback: Use path_provider to find directories
      if (directoriesToScan.isEmpty) {
        debugPrint('No direct paths found, trying path_provider...');
        try {
          final externalDirs = await getExternalStorageDirectories();
          if (externalDirs != null && externalDirs.isNotEmpty) {
            for (final dir in externalDirs) {
              final parts = dir.path.split('/');
              final androidIndex = parts.indexOf('Android');
              if (androidIndex > 0) {
                final basePath = parts.sublist(0, androidIndex).join('/');
                final downloadDir = Directory('$basePath/Download');
                try {
                  if (await downloadDir.exists()) {
                    directoriesToScan.add(downloadDir);
                    debugPrint('✓ Found via path_provider: ${downloadDir.path}');
                  }
                } catch (_) {}
              }
            }
          }
        } catch (e) {
          debugPrint('path_provider error: $e');
        }
      }

      debugPrint('Directories to scan: ${directoriesToScan.length}');

      // Scan each directory for files
      for (final directory in directoriesToScan) {
        final folderName = directory.path.toLowerCase().contains('document') 
            ? 'Documents' 
            : 'Downloads';
        
        debugPrint('Scanning: ${directory.path}');
        
        try {
          final entities = await directory.list(recursive: false, followLinks: false).toList();
          debugPrint('Found ${entities.length} entities in ${directory.path}');
          
          for (final entity in entities) {
            if (entity is File) {
              try {
                final stat = await entity.stat();
                final fileName = entity.path.split('/').last;
                
                // Skip hidden files and temp files
                if (fileName.startsWith('.')) continue;
                if (fileName.endsWith('.tmp')) continue;
                if (fileName.endsWith('.crdownload')) continue;
                
                allFiles.add(FileItem(
                  name: fileName,
                  path: entity.path,
                  size: stat.size,
                  modified: stat.modified,
                  folder: folderName,
                ));
              } catch (e) {
                debugPrint('Error reading file: $e');
              }
            }
          }
        } catch (e) {
          debugPrint('Error scanning ${directory.path}: $e');
        }
      }

      // Sort by modification date (newest first)
      allFiles.sort((a, b) => b.modified.compareTo(a.modified));

      debugPrint('✓ Loaded ${allFiles.length} files total');

      if (mounted) {
        setState(() {
          _files = allFiles;
          _filteredFiles = allFiles;
          // Mark as having permission if we successfully accessed directories
          if (directoriesToScan.isNotEmpty) {
            _hasPermission = true;
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading Android files: $e');
      // Don't set any state on error - let caller handle it
    }
  }

  /// Open system settings for permission
  Future<void> _openSettings() async {
    _waitingForPermissionFromSettings = true;
    await openAppSettings();
  }

  /// Use file picker to add files (for iOS and as fallback for Android)
  Future<void> _pickFilesWithPicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
        withData: false,
        withReadStream: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final newFiles = result.files
            .where((f) => f.path != null)
            .map((f) => FileItem(
                  name: f.name,
                  path: f.path!,
                  size: f.size,
                  modified: DateTime.now(),
                  folder: 'Selected',
                ))
            .toList();

        setState(() {
          // Add new files, avoiding duplicates
          for (final file in newFiles) {
            if (!_files.any((f) => f.path == file.path)) {
              _files.insert(0, file); // Add at beginning
            }
          }
          _filterFiles();
        });
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
      if (mounted) {
        CustomSnackbar.show(
          context,
          message: 'Error picking files',
          type: SnackbarType.error,
        );
      }
    }
  }

  /// Filter files based on search and category
  void _filterFiles() {
    final query = _searchController.text.toLowerCase();
    
    setState(() {
      _filteredFiles = _files.where((file) {
        // Search filter
        final matchesSearch = file.name.toLowerCase().contains(query);
        
        // Category filter
        final matchesCategory = _currentFilter == 'all' || 
            _matchesFileCategory(file.name, _currentFilter);
        
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  /// Check if file matches category filter
  bool _matchesFileCategory(String fileName, String category) {
    final ext = fileName.split('.').last.toLowerCase();
    
    switch (category) {
      case 'pdf':
        return ext == 'pdf';
      case 'documents':
        return ['doc', 'docx', 'txt', 'rtf', 'odt', 'pages', 'md'].contains(ext);
      case 'spreadsheets':
        return ['xls', 'xlsx', 'csv', 'ods', 'numbers'].contains(ext);
      case 'audio':
        return ['mp3', 'wav', 'aac', 'flac', 'm4a', 'ogg', 'wma', 'opus'].contains(ext);
      case 'archives':
        return ['zip', 'rar', '7z', 'tar', 'gz'].contains(ext);
      default:
        return true;
    }
  }

  /// Toggle file selection
  void _toggleFileSelection(FileItem file) {
    setState(() {
      if (_selectedFiles.contains(file.path)) {
        _selectedFiles.remove(file.path);
      } else {
        // Validation: Max 5 files
        if (_selectedFiles.length >= _maxFilesAllowed) {
          CustomSnackbar.show(
            context,
            message: 'Maximum $_maxFilesAllowed files allowed',
            type: SnackbarType.warning,
          );
          return;
        }
        _selectedFiles.add(file.path);
      }
    });
  }

  /// Send selected files
  Future<void> _sendSelectedFiles() async {
    if (widget.room == null || _selectedFiles.isEmpty) return;

    setState(() => _isSending = true);

    try {
      final selectedFileObjects = _filteredFiles
          .where((file) => _selectedFiles.contains(file.path))
          .toList();

      for (final fileItem in selectedFileObjects) {
        final file = File(fileItem.path);
        if (await file.exists()) {
          final bytes = await file.readAsBytes();
          await widget.room!.sendFileEvent(
            MatrixFile(
              bytes: bytes,
              name: fileItem.name,
            ),
          );
        }
      }

      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        CustomSnackbar.show(
          context,
          message: 'Error sending files: $e',
          type: SnackbarType.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  /// Get file size string
  String _getFileSize(int bytes) {
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  }

  /// Get file icon based on extension
  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
      case 'odt':
      case 'rtf':
      case 'pages':
        return Icons.description;
      case 'txt':
      case 'md':
      case 'rst':
        return Icons.text_snippet;
      case 'xls':
      case 'xlsx':
      case 'xlsm':
      case 'xlsb':
      case 'ods':
      case 'csv':
      case 'tsv':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
      case 'pptm':
      case 'odp':
      case 'key':
        return Icons.slideshow;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'webp':
      case 'svg':
      case 'tiff':
      case 'tif':
      case 'ico':
      case 'heic':
      case 'heif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mov':
      case 'mkv':
      case '3gp':
      case 'webm':
      case 'flv':
      case 'wmv':
      case 'm4v':
      case 'mpg':
      case 'mpeg':
        return Icons.video_file;
      case 'mp3':
      case 'wav':
      case 'aac':
      case 'flac':
      case 'm4a':
      case 'ogg':
      case 'wma':
      case 'opus':
      case 'amr':
        return Icons.audio_file;
      case 'zip':
      case 'rar':
      case '7z':
      case 'tar':
      case 'gz':
      case 'bz2':
      case 'xz':
      case 'cab':
      case 'iso':
        return Icons.archive;
      case 'apk':
        return Icons.android;
      default:
        return Icons.insert_drive_file;
    }
  }

  /// Get file color based on extension
  Color _getFileColor(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
      case 'odt':
      case 'rtf':
      case 'pages':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
      case 'xlsm':
      case 'xlsb':
      case 'ods':
      case 'csv':
      case 'tsv':
        return Colors.green;
      case 'ppt':
      case 'pptx':
      case 'pptm':
      case 'odp':
      case 'key':
        return Colors.orange;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'webp':
      case 'svg':
      case 'tiff':
      case 'tif':
      case 'ico':
      case 'heic':
      case 'heif':
        return Colors.pink;
      case 'mp4':
      case 'avi':
      case 'mov':
      case 'mkv':
      case '3gp':
      case 'webm':
      case 'flv':
      case 'wmv':
      case 'm4v':
      case 'mpg':
      case 'mpeg':
        return Colors.purple;
      case 'mp3':
      case 'wav':
      case 'aac':
      case 'flac':
      case 'm4a':
      case 'ogg':
      case 'wma':
      case 'opus':
      case 'amr':
        return Colors.deepOrange;
      case 'apk':
        return Colors.lightGreen;
      default:
        return const Color(0xFF7E24F9);
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
                if (!_hasPermission && Platform.isAndroid) ...[
                  _buildPermissionUI(),
                ] else if (_isLoading) ...[
                  const Expanded(child: AppLoadingWidget()),
                ] else ...[
                  // Filter chips
                  _buildFilterChips(),
                  
                  // Search bar
                  _buildSearchBar(),
                  
                  // iOS explanation banner (only when no files yet)
                  if (Platform.isIOS && _files.isEmpty)
                    _buildiOSExplanation(),
                  
                  // Files list or empty state
                  Expanded(
                    child: _files.isEmpty
                        ? _buildEmptyState()
                        : _filteredFiles.isEmpty
                            ? _buildNoResultsState()
                            : _buildFilesList(),
                  ),
                  
                  // Selection bar when files selected
                  if (_selectedFiles.isNotEmpty)
                    _buildSelectionBar(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Permission request UI for Android
  Widget _buildPermissionUI() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_off,
              size: context.screenWidth * 0.16,
              color: Colors.white54,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'Storage access required',
              style: TextStyle(
                color: Colors.white,
                fontSize: context.screenWidth * 0.04,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Text(
              'Allow access to view your files',
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
              ),
              label: Text(L10n.of(context).grantPermission),
            ),
            SizedBox(height: context.screenHeight * 0.015),
            TextButton(
              onPressed: _pickFilesWithPicker,
              child: Text(
                'Or browse files manually',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.screenWidth * 0.032,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Filter chips for file categories
  Widget _buildFilterChips() {
    final filters = [
      ('all', L10n.of(context).allFiles, Icons.folder),
      ('pdf', L10n.of(context).pdf, Icons.picture_as_pdf),
      ('documents', L10n.of(context).documents, Icons.description),
      ('spreadsheets', L10n.of(context).spreadsheets, Icons.table_chart),
      ('audio', L10n.of(context).audioFile, Icons.audio_file),
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        itemCount: filters.length + 1, // +1 for "Add Files" button
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == filters.length) {
            // "Add Files" button at the end
            return _buildAddFilesButton();
          }
          
          final filter = filters[index];
          final isSelected = _currentFilter == filter.$1;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentFilter = filter.$1;
                _filterFiles();
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected 
                    ? const Color(0xFF7E24F9)
                    : const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected 
                      ? const Color(0xFF7E24F9)
                      : Colors.white24,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(filter.$3, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    filter.$2,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Add files button (uses picker)
  Widget _buildAddFilesButton() {
    return GestureDetector(
      onTap: _pickFilesWithPicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.green, width: 1),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 14, color: Colors.green),
            SizedBox(width: 4),
            Text(
              'Add Files',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// Search bar
  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(context.screenWidth * 0.02),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: L10n.of(context).searchFiles,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white54),
          filled: true,
          fillColor: const Color(0xFF1F1F1F),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  /// iOS limitation explanation
  Widget _buildiOSExplanation() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue, size: 20),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'iOS File Access',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'iOS doesn\'t allow apps to browse files directly. '
            'Tap "Add Files" above to select files from iCloud, '
            'your device, or other apps.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _pickFilesWithPicker,
              icon: const Icon(Icons.folder_open, size: 18),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E24F9),
                foregroundColor: Colors.white,
              ),
              label: const Text('Browse Files'),
            ),
          ),
        ],
      ),
    );
  }

  /// Empty state when no files (shows picker button)
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_open,
            size: context.screenWidth * 0.12,
            color: Colors.white54,
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Text(
            Platform.isIOS 
                ? 'Tap "Add Files" to select documents'
                : 'No files found in Downloads',
            style: TextStyle(
              color: Colors.white54,
              fontSize: context.screenWidth * 0.035,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.screenHeight * 0.02),
          ElevatedButton.icon(
            onPressed: _pickFilesWithPicker,
            icon: const Icon(Icons.add, size: 18),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7E24F9),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            label: const Text('Browse Files'),
          ),
          if (Platform.isAndroid) ...[
            SizedBox(height: context.screenHeight * 0.01),
            TextButton(
              onPressed: _initializeFiles,
              child: const Text(
                'Refresh',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// No results after filtering
  Widget _buildNoResultsState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: context.screenWidth * 0.12,
            color: Colors.white54,
          ),
          SizedBox(height: context.screenHeight * 0.015),
          Text(
            'No files match your filter',
            style: TextStyle(
              color: Colors.white54,
              fontSize: context.screenWidth * 0.035,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.01),
          TextButton(
            onPressed: () {
              setState(() {
                _currentFilter = 'all';
                _searchController.clear();
                _filterFiles();
              });
            },
            child: const Text(
              'Clear filters',
              style: TextStyle(color: Color(0xFF7E24F9)),
            ),
          ),
        ],
      ),
    );
  }

  /// Files list view
  Widget _buildFilesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      itemCount: _filteredFiles.length,
      itemBuilder: (context, index) {
        final file = _filteredFiles[index];
        final isSelected = _selectedFiles.contains(file.path);
        final fileColor = _getFileColor(file.name);

        return GestureDetector(
          onTap: () => _toggleFileSelection(file),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF7E24F9).withOpacity(0.3)
                  : const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(color: const Color(0xFF7E24F9), width: 1.5)
                  : null,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              leading: Stack(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: fileColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getFileIcon(file.name),
                      color: fileColor,
                      size: 24,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: -2,
                      bottom: -2,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7E24F9),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              title: Text(
                file.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_getFileSize(file.size)} • ${file.folder}',
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check_circle, color: Color(0xFF7E24F9), size: 24)
                  : null,
            ),
          ),
        );
      },
    );
  }

  /// Selection bar with send button
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
          // Clear selection button
          IconButton(
            onPressed: () {
              setState(() => _selectedFiles.clear());
            },
            icon: const Icon(Icons.clear, color: Colors.white54),
            tooltip: 'Clear selection',
          ),
          
          // Selected count
          Expanded(
            child: Text(
              '${_selectedFiles.length}/$_maxFilesAllowed file${_selectedFiles.length > 1 ? 's' : ''} selected',
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Send button
          _isSending
              ? const SizedBox(
                  width: 48,
                  height: 48,
                  child: AppLoadingWidget(),
                )
              : IconButton(
                  onPressed: _sendSelectedFiles,
                  icon: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7E24F9),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
        ],
      ),
    );
  }
}

/// Model class for file items
class FileItem {
  final String name;
  final String path;
  final int size;
  final DateTime modified;
  final String folder;

  FileItem({
    required this.name,
    required this.path,
    required this.size,
    required this.modified,
    required this.folder,
  });
}
