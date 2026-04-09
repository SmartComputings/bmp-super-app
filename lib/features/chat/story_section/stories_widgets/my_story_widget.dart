import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../auth_onboarding/onBoardingScreens/Screens/coming_soon_screen.dart';

class MyStoryWidget extends StatelessWidget {
  final UserStories? userStories;
  final double height;

  const MyStoryWidget({
    super.key,
    this.userStories,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final hasStories = userStories?.activeStories.isNotEmpty ?? false;

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: height,
          width: context.screenWidth * 0.23,
          decoration: BoxDecoration(
            color:const Color(0xFF5F18BF).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFF5F18BF), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Center the Stack so it wraps tightly around the avatar.
                // This ensures the "+" Positioned button is relative to the
                // avatar bounds, not the full container width.
                Flexible(
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Main avatar - clickable to view stories
                        GestureDetector(
                          onTap: () => _onAvatarTap(context),
                          child: Container(
                            alignment: Alignment.center,
                            width: context.screenWidth * 0.14,
                            height: context.screenWidth * 0.14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: hasStories
                                  ? Border.all(
                                      color: const Color(0xFFC67EF0),
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: Avatar(
                              client: client,
                              mxContent: userStories?.avatarUrl,
                              name: userStories?.displayName ?? 'Me',
                              size: context.screenWidth * 0.12,
                            ),
                          ),
                        ),
                        // + button — anchored to bottom-right of the avatar
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _onPlusButtonTap(context),
                            child: Container(
                              width: context.screenWidth * 0.055,
                              height: context.screenWidth * 0.055,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3976F8),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF232C37),
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: context.screenWidth * 0.03,
                                weight: 700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.004),
                Text(
                  L10n.of(context).myStory,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.screenWidth * 0.025,
                    fontFamily: 'Work Sans',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
           ),
        ),
      ),
    );
  }

  void _onAvatarTap(BuildContext context) {
    final hasStories = userStories?.activeStories.isNotEmpty ?? false;

    if (hasStories) {
      debugPrint('🔄 Navigating to MY story viewer');
      debugPrint('🔄 My stories being passed: ${userStories!.stories.length}');
      for (final story in userStories!.stories) {
        debugPrint(
          '🔄 My Story ${story.id}: ${story.views.length} views, viewers: ${story.views.map((v) => v.userId).toList()}',
        );
      }

      // View my stories when clicking on avatar
      // context.push(
      //   '/story/viewer',
      //   extra: {
      //     'userStories': userStories,
      //     'isOwn': true,
      //   },
      // );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ComingSoonScreen(),
        ),
      );
    }
  }

  void _onPlusButtonTap(BuildContext context) {
    // Always create new story when clicking + button
    // context.push('/story/create');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ComingSoonScreen(),
      ),
    );
  }
}