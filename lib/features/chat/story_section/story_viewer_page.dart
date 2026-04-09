import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/features/chat/story_section/providers/chat/story_service.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/keyboard_dismissible_popscope.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/core/localization/l10n.dart';

class StoryViewerPage extends StatefulWidget {
  final UserStories userStories;
  final bool isOwn;

  const StoryViewerPage({
    super.key,
    required this.userStories,
    required this.isOwn,
  });

  @override
  State<StoryViewerPage> createState() => _StoryViewerPageState();
}

class _StoryViewerPageState extends State<StoryViewerPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _progressController;
  final FocusNode _replyFocusNode = FocusNode();
  int _currentIndex = 0;
  bool _isPaused = false;
  bool _showingViewers = false;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _startStoryTimer();
    _markAsViewed();
  }

  void _startStoryTimer() {
    if (!_isPaused && !_showingViewers && !_isTyping) {
      _progressController.forward().then((_) {
        if (!_isPaused && !_showingViewers && !_isTyping && mounted) {
          _nextStory();
        }
      });
    }
  }

  void _markAsViewed() {
    if (!widget.isOwn && widget.userStories.activeStories.isNotEmpty) {
      final currentStory = widget.userStories.activeStories[_currentIndex];
      debugPrint('📖 Marking story as viewed: ${currentStory.id} by viewer (not owner)');
      Provider.of<StoryService>(context, listen: false)
          .viewStory(currentStory.id, currentStory.userId);
    } else if (widget.isOwn) {
      debugPrint('📖 Skipping view recording - this is own story');
    }
  }

  void _nextStory() {
    if (_currentIndex < widget.userStories.activeStories.length - 1) {
      setState(() {
        _currentIndex++;
        _progressController.reset();
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startStoryTimer();
      _markAsViewed();
    } else {
      context.pop();
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _progressController.reset();
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startStoryTimer();
    }
  }

  void _pauseStory() {
    setState(() {
      _isPaused = true;
      _progressController.stop();
    });
  }

  void _resumeStory() {
    setState(() {
      _isPaused = false;
      _progressController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stories = widget.userStories.activeStories;
    if (stories.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            L10n.of(context).noStoriesAvailable,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return KeyboardDismissiblePopScope(
      focusNodes: [_replyFocusNode],
      child: Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) {
          final screenWidth = context.screenWidth;
          if (details.globalPosition.dx < screenWidth / 2) {
            _previousStory();
          } else {
            _nextStory();
          }
        },
        onLongPressStart: (_) => _pauseStory(),
        onLongPressEnd: (_) => _resumeStory(),
        child: Stack(
          children: [
            // Story Content
            PageView.builder(
              controller: _pageController,
              itemCount: stories.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _progressController.reset();
                });
                _startStoryTimer();
                _markAsViewed();
              },
              itemBuilder: (context, index) {
                return _buildStoryContent(stories[index]);
              },
            ),

            // Progress Indicators
            Positioned(
              top: context.screenHeight * 0.06,
              left: 8,
              right: 8,
              child: Row(
                children: List.generate(
                  stories.length,
                  (index) => Expanded(
                    child: Container(
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      child: LinearProgressIndicator(
                        value: index < _currentIndex
                            ? 1.0
                            : index == _currentIndex
                                ? _progressController.value
                                : 0.0,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Header
            Positioned(
              top: context.screenHeight * 0.08,
              left: 16,
              right: 16,
              child: _buildHeader(stories[_currentIndex]),
            ),

            // Reply Input (for others' stories)
            if (!widget.isOwn)
              Positioned(
                bottom: context.screenHeight * 0.05,
                left: 16,
                right: 16,
                child: _buildReplyInput(),
              ),

            // Story Actions (for own stories)
            if (widget.isOwn)
              Positioned(
                bottom: context.screenHeight * 0.05,
                right: 16,
                child: _buildStoryActions(stories[_currentIndex]),
              ),
          ],
        ),
      ),
    ),);
  }

  Widget _buildStoryContent(Story story) {
    debugPrint('Building story content: ${story.content.type}, mediaUrl: ${story.content.mediaUrl}');
    switch (story.content.type) {
      case StoryType.text:
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(int.parse(
              story.content.backgroundColor!.substring(1),
              radix: 16,) + 0xFF000000,),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(context.screenWidth * 0.08),
              child: Text(
                story.content.text!,
                style: TextStyle(
                  color: Color(int.parse(
                      story.content.textColor!.substring(1),
                      radix: 16,) + 0xFF000000,),
                  fontSize: context.screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      case StoryType.image:
        return Container(
          color: Colors.grey[900],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info, color: Colors.white, size: 50),
                const SizedBox(height: 10),
                Text(L10n.of(context).mediaUploadIssue, style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 10),
                if (story.content.mediaUrl != null)
                  Text('MXC: ${story.content.mediaUrl.toString()}', style: const TextStyle(color: Colors.white54, fontSize: 10)),
                const SizedBox(height: 5),
                Text(L10n.of(context).checkSynapseMediaConfiguration, style: const TextStyle(color: Colors.white54, fontSize: 10)),
              ],
            ),
          ),
        );
      case StoryType.video:
        return Container(
          color: Colors.grey[900],
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
                  L10n.of(context).videoStory,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildHeader(Story story) {
    final displayName = widget.userStories.displayName ?? 
        widget.userStories.userId.split(':').first;
    
    debugPrint('👁️ Header for story ${story.id}: viewCount=${story.viewCount}, isOwn=${widget.isOwn}');
    debugPrint('👁️ Story views: ${story.views.map((v) => v.userId).toList()}');
    
    return Row(
      children: [
        Avatar(
          mxContent: widget.userStories.avatarUrl,
          name: displayName,
          size: context.screenWidth * 0.1,
        ),
        SizedBox(width: context.screenWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _formatTime(story.timestamp),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: context.screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ),
        if (widget.isOwn)
          GestureDetector(
            onTap: () => _showViewersList(),
            child: Container(
              padding: EdgeInsets.all(context.screenWidth * 0.02),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.visibility,
                    color: Colors.white,
                    size: context.screenWidth * 0.04,
                  ),
                  SizedBox(width: context.screenWidth * 0.01),
                  Text(
                    '${story.viewCount}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ),
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildReplyInput() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _replyFocusNode,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: L10n.of(context).replyToStory,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: context.screenWidth * 0.035,
                ),
                border: InputBorder.none,
              ),
              onTap: () => _pauseForTyping(),
              onSubmitted: (text) => _replyToStory(text),
            ),
          ),
          Icon(
            Icons.send,
            color: Colors.white.withOpacity(0.7),
            size: context.screenWidth * 0.05,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryActions(Story story) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'delete',
          mini: true,
          backgroundColor: Colors.red,
          onPressed: () => _deleteStory(story),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ],
    );
  }

  void _showStoryDetails(Story story) {
    context.push('/story/details', extra: story);
  }

  void _pauseForTyping() {
    setState(() {
      _isTyping = true;
    });
    _progressController.stop();
  }

  void _resumeFromTyping() {
    setState(() {
      _isTyping = false;
    });
    _startStoryTimer();
  }

  void _showViewersList() async {
    final story = widget.userStories.activeStories[_currentIndex];
    debugPrint('👁️ Showing viewers for story ${story.id}');
    debugPrint('👁️ Story has ${story.views.length} views BEFORE refresh');
    
    // Fetch fresh view data for owner
    if (widget.isOwn) {
      debugPrint('👁️ Fetching fresh view data for owner story');
      final storyService = Provider.of<StoryService>(context, listen: false);
      final freshViews = await storyService.getStoryViewers(story.id);
      
      debugPrint('👁️ Fresh views fetched: ${freshViews.length}');
      debugPrint('👁️ Fresh viewers: ${freshViews.map((v) => v.userId).toList()}');
      
      // Update the story with fresh views
      story.views.clear();
      story.views.addAll(freshViews);
    }
    
    debugPrint('👁️ Story has ${story.views.length} views AFTER refresh');
    debugPrint('👁️ Viewers: ${story.views.map((v) => v.userId).toList()}');
    
    setState(() {
      _showingViewers = true;
    });
    _progressController.stop();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF282130),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _buildViewersBottomSheet(),
    ).then((_) {
      setState(() {
        _showingViewers = false;
      });
      _startStoryTimer();
    });
  }

  Widget _buildViewersBottomSheet() {
    final story = widget.userStories.activeStories[_currentIndex];
    debugPrint('👁️ Building viewers sheet with ${story.views.length} views');
    
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.visibility, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                L10n.of(context).viewedBy(story.viewCount),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          story.views.isEmpty 
            ? Text(
                L10n.of(context).noViewsYet,
                style: const TextStyle(color: Colors.white70),
              )
            : Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: story.views.length,
                  itemBuilder: (context, index) {
                    final view = story.views[index];
                    debugPrint('👁️ Showing viewer: ${view.userId}');
                    return ListTile(
                      leading: Avatar(
                        mxContent: view.avatarUrl,
                        name: view.displayName ?? view.userId,
                        size: 40,
                      ),
                      title: Text(
                        view.displayName ?? view.userId.split(':').first,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        _formatTime(view.timestamp),
                        style: const TextStyle(color: Colors.white70),
                      ),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  void _replyToStory(String message) {
    if (message.trim().isNotEmpty) {
      Provider.of<StoryService>(context, listen: false)
          .replyToStory(
            widget.userStories.activeStories[_currentIndex].id,
            widget.userStories.userId,
            message.trim(),
          );
     CustomSnackbar.show(
  context,
  title: L10n.of(context).success,
  message: L10n.of(context).replySent,
  type: SnackbarType.success,
);

      context.pop(); // Close story viewer after sending reply
    }
    _resumeFromTyping();
  }

  void _deleteStory(Story story) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF282130),
        title: Text(L10n.of(context).deleteStory, style: const TextStyle(color: Colors.white)),
        content: Text(
          L10n.of(context).areYouSureDeleteStory,
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(L10n.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Provider.of<StoryService>(context, listen: false)
                  .deleteStory(story.id);
              Navigator.pop(context);
              context.pop();
            },
            child: Text(L10n.of(context).delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressController.dispose();
    _replyFocusNode.dispose();
    super.dispose();
  }
}