import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:bmp/shared/widgets/attachment_bottom_sheet.dart';

class ReactionBottomSheet extends StatefulWidget {
  final Event event;
  final Timeline timeline;

  const ReactionBottomSheet({
    super.key,
    required this.event,
    required this.timeline,
  });

  @override
  State<ReactionBottomSheet> createState() => _ReactionBottomSheetState();
}

class _ReactionBottomSheetState extends State<ReactionBottomSheet> {
  String selectedFilter = 'All';
  
  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final allReactionEvents = widget.event.aggregatedEvents(widget.timeline, RelationshipTypes.reaction);
    final reactionMap = <String, List<User>>{};
    final userReactions = <String, Event>{};
    
    // Group reactions by user
    for (final e in allReactionEvents) {
      final key = e.content.tryGetMap<String, dynamic>('m.relates_to')?.tryGet<String>('key');
      if (key != null) {
        final existing = userReactions[e.senderId];
        if (existing == null || e.originServerTs.isAfter(existing.originServerTs)) {
          userReactions[e.senderId] = e;
        }
      }
    }
    
    // Build reaction map
    for (final e in userReactions.values) {
      final key = e.content.tryGetMap<String, dynamic>('m.relates_to')?.tryGet<String>('key');
      if (key != null) {
        reactionMap.putIfAbsent(key, () => []);
        reactionMap[key]!.add(e.senderFromMemoryOrFallback);
      }
    }
    
    final allUsers = userReactions.values.map((e) => e.senderFromMemoryOrFallback).toList();
    final totalCount = allUsers.length;

    return AttachmentBottomSheet(
      maxHeight: 379,
      borderRadius: 24,
      child: Column(
        children: [
          // Filter tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                _buildFilterChip('All', totalCount, selectedFilter == 'All'),
                const SizedBox(width: 6),
                ...reactionMap.entries.map((entry) => 
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _buildFilterChip(entry.key, entry.value.length, selectedFilter == entry.key),
                  )
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // User list
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0x7F1F252D),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            height: 245,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: allUsers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemBuilder: (context, index) {
                  final user = allUsers[index];
                  final userReaction = _getUserReaction(user, reactionMap);
                  final isCurrentUser = user.id == client.userID;
                  
                  return Container(
                    decoration: ShapeDecoration(
                      color: isCurrentUser ? const Color(0x7F050926) : const Color(0x7F050926),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Avatar(
                          mxContent: user.avatarUrl,
                          name: user.displayName ?? user.id,
                          size: 48,
                          client: client,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isCurrentUser ? 'You' : (user.displayName ?? user.id),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isCurrentUser ? 'Online' : 'Active now',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          userReaction,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFilterChip(String label, int count, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF1929FF) : const Color(0xFF1F252D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
          shadows: isSelected ? [
            const BoxShadow(
              color: Color(0xFF1929FF),
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: -1,
            )
          ] : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '($count)',
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF6F8DA1),
                fontSize: 14,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String _getUserReaction(User user, Map<String, List<User>> reactionMap) {
    for (final entry in reactionMap.entries) {
      if (entry.value.any((u) => u.id == user.id)) {
        return entry.key;
      }
    }
    return '🔥';
  }
}

void showReactionBottomSheet(BuildContext context, Event event, Timeline timeline) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => ReactionBottomSheet(
      event: event,
      timeline: timeline,
    ),
  );
}