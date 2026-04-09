import 'package:flutter/material.dart';

class DocumentTabWidget extends StatelessWidget {
  const DocumentTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildDocumentTab();
  }

  Widget _buildDocumentTab() {
    final documents = [
      {'name': 'Design Brief', 'size': '1 MB', 'type': 'PDF'},
      {'name': 'Profile Picture', 'size': '500KB', 'type': 'JPG'},
      {'name': 'Documentation', 'size': '3MB', 'type': 'PDF'},
      {'name': 'Color Style', 'size': '1MB', 'type': 'JPG'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6, top: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff1F252D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(6),
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final doc = documents[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                top: 12,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff050926),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff050926),
                    blurRadius: 10,
                    spreadRadius: -1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/document.png",
                    width: 28,
                    height: 28,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doc['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${doc['size']} · ${doc['type']}',
                          style: const TextStyle(
                            color: Color(0xff6F8DA1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
