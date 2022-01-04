import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/selfie_financeira_1.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class AvatarPreSelfie extends StatelessWidget {
  final Border? border;
  final XFile? imageFile;

  const AvatarPreSelfie({
    Key? key,
    this.border,
    this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        imageFile == null
            ? Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    border: border,
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.purple),
                child: Center(
                  child: Text(
                    'B',
                    style: TextStyles.initialLetterSelfie,
                  ),
                ),
              )
            : ClipRRect(

                borderRadius: BorderRadius.circular(22),
                child: Image.file(
                  File(imageFile!.path),
                  fit: BoxFit.fill,
                  height: 46,
                  width: 46,
                ),
              ),
        Image.asset('assets/subtract.png'),
        Positioned(
          bottom: 2,
          right: 2,
          child: CustomPaint(
            size: Size(24, (24 * 0.880482791796038).toDouble()),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: HeartIcon(),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 8,
          child: Text(
            '67',
            style: TextStyles.paragraphSmall9white,
          ),
        )
      ],
    );
  }
}
