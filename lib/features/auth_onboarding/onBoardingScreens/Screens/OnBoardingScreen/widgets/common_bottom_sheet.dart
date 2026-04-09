import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class CommonBottomSheet extends StatelessWidget {
  final Widget content;
  final List<Widget> attachmentIcons;
  final ScrollController? scrollController;
  final int? currentPage;
  final int? totalPages;

  const CommonBottomSheet({
    super.key,
    required this.content,
    required this.attachmentIcons,
    this.scrollController,
    this.currentPage,
    this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: context.screenHeight * 0.9),
      child: Container(
        width: context.screenWidth * 0.95,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.015,
          right: MediaQuery.of(context).size.width * 0.015,
          bottom: MediaQuery.of(context).size.height * 0.045,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x805F18BF).withValues(alpha: 0.5), // #5F18BF with 50% opacity
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF5F18BF),
            ),
            borderRadius: BorderRadius.circular(context.screenWidth * 0.075),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0xFF1B1C30),
              blurRadius: 18,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
            // BoxShadow(
            //   color: Color(0x4C8A92A0),
            //   blurRadius: 26.50,
            //   offset: Offset(-4.97, -3.31),
            //   spreadRadius: 0,
            // ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Handle
            Container(
              width: context.screenWidth * 0.1,
              height: context.screenHeight * 0.0075,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Content area
            Flexible(child: content),

            const SizedBox(height: 5),

            // Attachment icons row
            Container(
              width: double.infinity,
              height: context.screenHeight * 0.122,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: attachmentIcons,
                ),
              ),
            ),
            const SizedBox(height: 6),

            // Page indicator dots
            if (currentPage != null && totalPages != null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(totalPages!, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01),
                      width: context.screenWidth * 0.02,
                      height: context.screenWidth * 0.02,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? const Color(0xFF3976F8)
                            : Colors.transparent,
                        border: Border.all(
                          color: currentPage == index ? const Color(0xFF3976F8) : Colors.white,
                          width: 2,
                        ),
                      ),
                    );
                  }),
                ),
              ),

            // Bottom buttons (Emoji, Stickers) - COMMENTED OUT
            /*
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.025),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: ShapeDecoration(
                          color: const Color(0x66131016),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        child:  Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              L10n.of(context).emoji,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'All Round Gothic',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: context.screenWidth * 0.015),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: ShapeDecoration(
                          color: const Color(0x66131016),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000),
                          ),
                        ),
                        child:  Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              L10n.of(context).stickers,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'All Round Gothic',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: context.screenWidth * 0.06, height: context.screenWidth * 0.06),
                ],
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
