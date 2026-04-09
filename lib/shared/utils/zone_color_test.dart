import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/zone_color_provider.dart';

/// Test widget to verify zone colors are working
class ZoneColorTest extends StatelessWidget {
  const ZoneColorTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zone Color Test')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            height: 80,
            decoration: BoxDecoration(
              color: context.watch<ZoneColorProvider>().getColorForPosition(context),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}