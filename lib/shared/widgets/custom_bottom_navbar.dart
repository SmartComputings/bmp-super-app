import 'package:flutter/material.dart';
import 'package:bmp/core/localization/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      width: 382,
      height: 112,
      padding: EdgeInsets.only(bottom: bottomPadding > 0 ? bottomPadding : 0),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Main navigation bar container
          Positioned(
            bottom: 24,
            child: Container(
              width: 382,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFF202267),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Chats navigation item
                  _buildNavItem(
                    context: context,
                    icon: Icons.chat_bubble_rounded,
                    text: L10n.of(context)!.chats,
                    badgeCount: 1,
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),
                  // Placeholder for FAB space
                  const SizedBox(width: 60),
                  // Calls navigation item
                  _buildNavItem(
                    context: context,
                    icon: Icons.call,
                    text: L10n.of(context)!.calls,
                    badgeCount: 1,
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                ],
              ),
            ),
          ),
          // Floating Action Button
          Positioned(
            top: 4,
            child: GestureDetector(
              onTap: () => onItemTapped(2), // FAB action
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF4754FF),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1F267E).withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4754FF).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icons/add-square.png',
                      width: 28,
                      height: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required int badgeCount,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const Color activeColor = Color(0xFF4754FF);
    const Color inactiveColor = Color(0xFFF3F7F8);
    final Color itemColor = isSelected ? activeColor : inactiveColor;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Icon and Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: itemColor, size: 18),
                const SizedBox(width: 6),
                Text(
                  text,
                  style: TextStyle(
                    color: itemColor,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                  ),
                ),
              ],
            ),
            // Custom Notification Badge
            if (badgeCount > 0)
              Positioned(
                top: -24,
                child: _NotificationBadge(count: badgeCount),
              ),
          ],
        ),
      ),
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  final int count;

  const _NotificationBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Badge tail
        CustomPaint(
          size: const Size(28, 28),
          painter: _BadgeTailPainter(color: const Color(0xFF4754FF)),
        ),
        // Badge circle
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Color(0xFF4754FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BadgeTailPainter extends CustomPainter {
  final Color color;
  
  _BadgeTailPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    
    // Draw triangular tail
    path.moveTo(size.width * 0.5, size.height);
    path.lineTo(size.width * 0.35, size.height * 0.7);
    path.lineTo(size.width * 0.65, size.height * 0.7);
    path.close();
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}