import 'dart:ui';

import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../auth_onboarding/onBoardingScreens/Screens/coming_soon_screen.dart';

class StoryItemWidget extends StatelessWidget {
  final UserStories userStories;
  final double height;

  const StoryItemWidget({
    super.key,
    required this.userStories,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final currentUserId = client.userID ?? '';
    final hasUnviewed = userStories.hasUnviewedStoriesFor(currentUserId);
    final displayName =
        userStories.displayName ?? userStories.userId.split(':').first;

    debugPrint(
        '🟣 Story circle for ${userStories.userId}: hasUnviewed=$hasUnviewed, currentUser=$currentUserId',);
    debugPrint(
        '🟣 Stories count: ${userStories.stories.length}, active: ${userStories.activeStories.length}',);

    // Debug each story's views
    for (final story in userStories.activeStories) {
      final viewerIds = story.views.map((v) => v.userId).toList();
      final hasCurrentUserViewed =
          story.views.any((view) => view.userId == currentUserId);
      debugPrint(
          '🟣 Story ${story.id}: viewers=$viewerIds, currentUserViewed=$hasCurrentUserViewed',);
    }

    return GestureDetector(
      onTap: () => _onStoryTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Card(
          elevation: 5,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                height: height,
                width: context.screenWidth * 0.23,
                decoration: BoxDecoration(
                  color: const Color(0xFF282130).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: context.screenWidth * 0.16,
                      height: context.screenHeight * 0.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: hasUnviewed
                              ? const Color(0xFFC67EF0) // Purple for unviewed
                              : Colors.grey, // Grey for viewed
                          width: 2,
                        ),
                      ),
                      child: Avatar(
                        mxContent: userStories.avatarUrl,
                        name: displayName,
                        size: context.screenWidth * 0.14,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.percentWidth * 2
                      ),
                      child: Text(
                        displayName,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.03,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onStoryTap(BuildContext context) {
    debugPrint('🔄 Navigating to story viewer for ${userStories.userId}');
    debugPrint('🔄 Stories being passed: ${userStories.stories.length}');
    for (final story in userStories.stories) {
      debugPrint('🔄 Story ${story.id}: ${story.views.length} views');
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ComingSoonScreen(),
      ),
    );
    // context.push('/story/viewer', extra: {
    //   'userStories': userStories,
    //   'isOwn': false,
    // },);
  }
}
