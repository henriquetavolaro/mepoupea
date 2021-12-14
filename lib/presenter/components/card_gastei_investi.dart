import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'liquid_linear_progress_custom.dart';

class CardGasteiInvesti extends StatelessWidget {
  const CardGasteiInvesti({
    Key? key,
    required this.animationController,
    required this.text,
    required this.value,
    required this.moneyStyle,
    required this.valueStyle,
    required this.liquidColor,
    required this.liquidPercentage,
    required this.textAlignment,
  }) : super(key: key);

  final AnimationController animationController;
  final String text;
  final String value;
  final TextStyle moneyStyle;
  final TextStyle valueStyle;
  final Color liquidColor;
  final double liquidPercentage;
  final AlignmentGeometry textAlignment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LiquidLinearProgressCustom(
            animationController: animationController,
            percentage: liquidPercentage,
            color: liquidColor,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 12, left: 8),
          child: Text(
            text,
            style: TextStyles.paragraphSmall12BlackMedium,
          ),
        ),
        Align(
          alignment: textAlignment,
          child: Padding(
            padding: EdgeInsets.only(bottom: 28, left: 16),
            child: RichText(
              text: TextSpan(
                text: 'R\$',
                style: moneyStyle,
                children: <TextSpan>[
                  TextSpan(
                      text: value, style: valueStyle),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

}
