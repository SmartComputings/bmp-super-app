import 'package:flutter/material.dart';

import 'package:bmp/core/config/app_config.dart';
import 'package:bmp/core/config/themes.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';

class MaxWidthBody extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final bool withScrolling;
  final EdgeInsets? innerPadding;

  const MaxWidthBody({
    required this.child,
    this.maxWidth ,
    this.withScrolling = true,
    this.innerPadding,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final effectiveMaxWidth = maxWidth ?? context.screenWidth * 1;
    
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final theme = Theme.of(context);

          final body = constraints.maxWidth <= effectiveMaxWidth
              ? child
              : Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(32),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: effectiveMaxWidth,
                    ),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConfig.borderRadius),
                        side: BorderSide(
                          color: theme.dividerColor,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: child,
                      ),
                    ),
                  ),
                );
          if (!withScrolling) return body;

          return SingleChildScrollView(
            padding: innerPadding,
            physics: const ScrollPhysics(),
            child: body,
          );
        },
      ),
    );
  }
}
