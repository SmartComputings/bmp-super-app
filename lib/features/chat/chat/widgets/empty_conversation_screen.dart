import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class EmptyConversationScreen extends StatelessWidget {
  const EmptyConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Background patron image with color overlay
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/icons/patron 1.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
          const Color(0xFF841DC0).withOpacity(0.4),
            BlendMode.srcIn,
          ),
        ),
      ),
      child: Center(
        child: Container(
          width: context.screenWidth*0.95,
          height: context.screenHeight*0.4,
         
          decoration: BoxDecoration(
           
            image: DecorationImage(
              image: AssetImage('assets/chat_icons/empty-chat-image.png'),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                L10n.of(context).startAConversation,
                style: TextStyle(
                  fontSize: context.screenWidth*0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.1,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                L10n.of(context).sendMessageToGetStarted,
                style: TextStyle(
                  fontSize: context.screenWidth*0.04,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
