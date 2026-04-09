import 'package:flutter/material.dart';

class MessageActionDialog extends StatelessWidget {
  final List<ActionButton> actionButtons;

  const MessageActionDialog({
    super.key,
    required this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 144,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: ShapeDecoration(
          color: const Color(0xFF170328),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: actionButtons.map((button) {
            return Column(
              children: [
                GestureDetector(
                  onTap: button.onTap,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      children: [
                        Icon(button.icon, color: const Color(0xFFF3F3F3), size: 18),
                        const SizedBox(width: 10),
                        Text(
                          button.label,
                          style: TextStyle(
                            color: const Color(0xFFF3F3F3),
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (actionButtons.last != button) const SizedBox(height: 4),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ActionButton {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}