import 'package:bmp/core/constant/app_colors.dart';
import 'package:bmp/shared/widgets/avatar.dart';
import 'package:bmp/shared/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

Widget buildContactItem(BuildContext context, Room room, bool isSelected,
    VoidCallback toggleContact,) {
  final displayName = room.getLocalizedDisplayname();
  final avatarUrl = room.avatar;
  final client = Matrix.of(context).client;

  return GestureDetector(
    onTap: toggleContact,
    child: Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFF3976F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: ShapeDecoration(
          color:
              // isEven ? const Color(0xFF1F2166) :
              const Color(0xF2252844),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Avatar(
              mxContent: avatarUrl,
              name: displayName,
              size: 48,
              client: client,
              isGroup: !room.isDirectChat,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  // const Text(
                  //   'Busy',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 12,
                  //     fontFamily: 'Work Sans',
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.checkBoxColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.checkBoxColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 15,
                    )
                  : null,
            ),
          ],
        ),
      ),
    ),
  );
}
