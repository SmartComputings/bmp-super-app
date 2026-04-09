import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/date_time_extension.dart';
import 'package:bmp/shared/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class StateMessage extends StatelessWidget {
  final Event event;
  const StateMessage(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    // Determine contextual styling based on event type
    final bool isEncryption = event.type == EventTypes.Encryption;
    final bool isMember = event.type == EventTypes.RoomMember;

    final Color accentColor;
    final IconData icon;

    if (isEncryption) {
      accentColor = const Color(0xFFFFD700); // gold
      icon = Icons.lock_outline_rounded;
    } else if (isMember) {
      accentColor = const Color(0xFF4CAF50); // green
      icon = Icons.person_outline_rounded;
    } else {
      accentColor = const Color(0xFF64B5F6); // soft blue
      icon = Icons.info_outline_rounded;
    }

    final messageText = event.calcLocalizedBodyFallback(
      MatrixLocals(L10n.of(context)),
    );

    final timeString = event.originServerTs.localizedTimeShort(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 320),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.06),
                Colors.white.withOpacity(0.02),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: accentColor.withOpacity(0.2),
              width: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contextual icon
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 10,
                  color: accentColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 6),
              // Message text
              Flexible(
                child: Text(
                  messageText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9.5 * AppConfig.fontSizeFactor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    letterSpacing: 0.1,
                    color: Colors.white.withOpacity(0.6),
                    decoration:
                        event.redacted ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // Timestamp
              Text(
                timeString,
                style: TextStyle(
                  fontSize: 8 * AppConfig.fontSizeFactor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
