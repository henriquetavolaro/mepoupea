
import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'liquid_linear_progress_custom.dart';

class CardGanhei extends StatelessWidget {
  const CardGanhei({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LiquidLinearProgressCustom(
              animationController: animationController,
              percentage: 0.8,
              color: AppColors.loginBackground,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 8.0),
            child: Text(
              'Tudo que eu ganhei',
              style: TextStyles.paragraphSmall12BlackMedium,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: RichText(
                text: TextSpan(
                  text: 'R\$',
                  style: TextStyles.textCardR$Ganhei,
                  children: <TextSpan>[
                    TextSpan(
                        text: ' 1.000,00',
                        style: TextStyles.textCardValorGanhei),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

