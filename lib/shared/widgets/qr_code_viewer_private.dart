import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

Future<void> showQrCodeViewer(
  BuildContext context,
  String content, {
  String? name,
  String? subtitle,
  dynamic room,
}) =>
    showDialog(
      context: context,
      builder: (context) => QrCodeViewer(content: content),
    );

class QrCodeViewer extends StatelessWidget {
  final String content;

  const QrCodeViewer({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final inviteLink = 'https://be-mindpower.net/#/$content';
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1C30),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrettyQrView.data(
              data: inviteLink,
              decoration: PrettyQrDecoration(
                shape: PrettyQrSmoothSymbol(
                  roundFactor: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
