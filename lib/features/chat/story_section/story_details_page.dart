import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bmp/core/localization/l10n.dart';

class StoryDetailsPage extends StatelessWidget {
  final Story story;

  const StoryDetailsPage({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          L10n.of(context).storyViews,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.screenWidth * 0.045,
          ),
        ),
      ),
      body: Column(
        children: [
          // Story Preview
          Container(
            height: context.screenHeight * 0.3,
            margin: EdgeInsets.all(context.screenWidth * 0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: story.content.type == StoryType.text 
                  ? Color(int.parse(story.content.backgroundColor!.substring(1), radix: 16) + 0xFF000000)
                  : Colors.grey[900],
            ),
            child: _buildStoryPreview(context),
          ),
          
          // Views Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
            child: Row(
              children: [
                Icon(
                  Icons.visibility,
                  color: Colors.white,
                  size: context.screenWidth * 0.05,
                ),
                SizedBox(width: context.screenWidth * 0.02),
                Text(
                  L10n.of(context).views(story.viewCount),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: context.screenHeight * 0.02),
          
          // Views List
          Expanded(
            child: story.views.isEmpty
                ? Center(
                    child: Text(
                      L10n.of(context).noViewsYet,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: context.screenWidth * 0.04,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: story.views.length,
                    itemBuilder: (context, index) {
                      final view = story.views[index];
                      return ListTile(
                        leading: Avatar(
                          mxContent: view.avatarUrl,
                          name: view.displayName ?? view.userId,
                          size: context.screenWidth * 0.12,
                        ),
                        title: Text(
                          view.displayName ?? view.userId.split(':').first,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.screenWidth * 0.04,
                          ),
                        ),
                        subtitle: Text(
                          _formatTime(view.timestamp,context),
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: context.screenWidth * 0.03,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryPreview(BuildContext context) {
    switch (story.content.type) {
      case StoryType.text:
        return Center(
          child: Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.06),
            child: Text(
              story.content.text!,
              style: TextStyle(
                color: Color(int.parse(
                    story.content.textColor!.substring(1),
                    radix: 16,) + 0xFF000000,),
                fontSize: context.screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      case StoryType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            story.content.mediaUrl.toString(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(Icons.error, color: Colors.white, size: 50),
                ),
              );
            },
          ),
        );
      case StoryType.video:
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_circle_outline,
                  size: context.screenWidth * 0.15,
                  color: Colors.white,
                ),
                SizedBox(height: context.screenHeight * 0.01),
                Text(
                  L10n.of(context).videoStory,
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
  }

  String _formatTime(DateTime timestamp,BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 1) {
      return L10n.of(context).justNow;
    } else if (difference.inHours < 1) {
      return L10n.of(context).minutesAgo(difference.inMinutes);
    } else {
      return L10n.of(context).hoursAgo(difference.inHours);
    }
  }
}