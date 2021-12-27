import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'custom_button.dart';
import 'me_poupe_baloon_exclamation.dart';

class CardGastoCategoryExclamation extends StatelessWidget {
  final VoidCallback onClick;

  const CardGastoCategoryExclamation({
    Key? key, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            color: AppColors.cardLightOrange,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 12, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Transporte',
                        style: TextStyles.paragraphMedium15Black,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.directions_car_filled_rounded,
                          color: AppColors.orange,
                          size: 32,),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 16, right: 70, bottom: 20),
                    child: Text(
                      'Você gasta cerca de \$37,20 por dia com Uber para ir ao trabalho.',
                      style:
                      TextStyles.paragraphSmall12BlackMedium,
                    ),
                  ),
                  CustomButton(
                    onClick: onClick,
                    text: 'Checar melhor isso aí!',
                    color: AppColors.white,
                    textColor: AppColors.darkBlue,
                    style: TextStyles.buttonTextMedium,
                  )
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          right: 24,
          top: 24,
          child: MePoupeBaloonExclamation(),
        )

      ],
    );
  }
}