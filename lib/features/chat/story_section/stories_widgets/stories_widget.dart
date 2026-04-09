import 'dart:ui';

import 'package:bmp/features/chat/story_section/models/chat/story_model.dart';
import 'package:bmp/features/chat/story_section/providers/chat/story_service.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'my_story_widget.dart';
import 'story_item_widget.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({super.key});

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  @override
  void initState() {
    super.initState();
    // Force reload stories when widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final storyService = Provider.of<StoryService>(context, listen: false);
      storyService.forceReloadStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryService>(
      builder: (context, storyService, child) {
        return StreamBuilder<List<UserStories>>(
          stream: storyService.storiesStream,
          builder: (context, snapshot) {
            final allStories = snapshot.data ?? [];
            final myStories = allStories.where((s) => s.isOwn).firstOrNull;
            final otherStories = allStories.where((s) => !s.isOwn).toList();

            return Container(
              height: context.screenHeight * 0.12,
              width: double.infinity,
           //   margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  // My Story (always visible)
                  MyStoryWidget(
                    userStories: myStories,
                    height: context.screenHeight * 0.11,
                  ),
                  SizedBox(width: context.screenWidth * 0.01),
                  // Other users' stories
                  if (otherStories.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: otherStories.length,
                        itemBuilder: (context, index) {
                          return StoryItemWidget(
                            userStories: otherStories[index],
                            height: context.screenHeight * 0.12,
                          );
                        },
                      ),
                    )
                  else
                    _buildNoStoriesWidget(context),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNoStoriesWidget(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            width: context.screenWidth * 0.7,
            height: context.screenHeight * 0.13,
            decoration: BoxDecoration(
              color: const Color(0xFF5F18BF).withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF5F18BF), width: 1),
            ),
            child: Center(
              child: ListTile(
                leading: Image.asset(
                  ImageAssets.chatDetailsImage,
                  width: context.screenWidth * 0.08,
                  height: context.screenWidth * 0.08,
                ),
                title: Text(
                  L10n.of(context).noStoriesToShow,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.screenWidth * 0.032,
                    fontFamily: 'Montserrat',
                  ),
                ),
                subtitle: Text(
                  L10n.of(context).beTheFirstToShareAMoment,
                  style: TextStyle(
                    color: const Color(0xFFC6D4DB),
                    fontSize: context.screenWidth * 0.025,
                    fontFamily: 'Work Sans',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}