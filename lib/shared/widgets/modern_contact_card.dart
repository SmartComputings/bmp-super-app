import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ModernContactCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String? avatarUrl;
  final VoidCallback? onTap;
  final VoidCallback? onMessage;
  final bool isSelected;

  const ModernContactCard({
    required this.name,
    required this.phoneNumber,
    this.avatarUrl,
    this.onTap,
    this.onMessage,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected 
                ? theme.colorScheme.primaryContainer.withAlpha(100)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isSelected 
                ? Border.all(
                    color: theme.colorScheme.primary.withAlpha(150), 
                    width: 1.5
                  )
                : null,
          ),
          child: Row(
            children: [
              // Avatar with ripple effect
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow.withAlpha(50),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: isDark 
                          ? const Color(0xFF3E3E40) 
                          : const Color(0xFFE8E8ED),
                      backgroundImage: avatarUrl != null 
                          ? NetworkImage(avatarUrl!) 
                          : null,
                      child: avatarUrl == null
                          ? Icon(
                              Icons.person_rounded,
                              color: isDark 
                                  ? const Color(0xFF8E8E93) 
                                  : const Color(0xFF6D6D70),
                              size: 32,
                            )
                          : null,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.surface,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 12,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(width: 16),
              
              // Contact info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isDark 
                            ? const Color(0xFFFFFFFF) 
                            : const Color(0xFF1C1C1E),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatPhoneNumber(phoneNumber),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: isDark 
                            ? const Color(0xFF8E8E93) 
                            : const Color(0xFF6D6D70),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Action button
              if (onMessage != null)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onMessage,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer.withAlpha(150),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.chat_bubble_rounded,
                          size: 20,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPhoneNumber(String phone) {
    // Basic phone number formatting
    if (phone.length >= 10) {
      final cleaned = phone.replaceAll(RegExp(r'\D'), '');
      if (cleaned.length == 11 && cleaned.startsWith('1')) {
        return '+${cleaned.substring(0, 1)} (${cleaned.substring(1, 4)}) ${cleaned.substring(4, 7)}-${cleaned.substring(7)}';
      } else if (cleaned.length == 10) {
        return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
      }
    }
    return phone;
  }

  void _launchPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}