import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/image/assets/image_assets.dart';
import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:flutter/material.dart';

class EmptyCallsWidget extends StatelessWidget {
  const EmptyCallsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Container(
       width:double.infinity,
          height: context.percentHeight * 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.emptyCallImage),
              fit: BoxFit.fill, // optional
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: context.percentWidth * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                L10n.of(context).makeYourFirstCall,
                style: TextStyle(
                  fontSize: context.percentWidth * 7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.percentHeight * 1),
              Text(
                L10n.of(context).checkBackLater,
                style: TextStyle(
                  color: Colors.white.withAlpha(180),
                  fontSize: context.percentWidth * 3.2,
                  fontFamily: 'Open Sans',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.percentHeight * 2),
            ],
          ) ,
        ),


      ],
    );
  }
}
