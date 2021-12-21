import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'custom_button.dart';

class RecommendationCardGasteMenos extends StatelessWidget {
  final String elimineEconomize;
  final String valor;
  final String valorMes;
  final String descricao;

  const RecommendationCardGasteMenos({
    Key? key,
    required this.elimineEconomize,
    required this.valor,
    required this.valorMes,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, right: 12),
                child: Image.asset('assets/card_recommendation.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      elimineEconomize,
                      style: TextStyles.paragraphSmall12DarkerGreyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'R\$ ',
                        style: TextStyles
                            .textSelfieMedium16MontserratDarkOrangeSemiBold,
                        children: <TextSpan>[
                          TextSpan(
                              text: '$valor ',
                              style: TextStyles
                                  .textSelfieBig24MontserratDarkOrangeSemiBold),
                          TextSpan(
                              text: '(- R\$ $valorMes/mês)',
                              style: TextStyles
                                  .textSelfieSmall9MontserratGreyMedium),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: Text(
                      descricao,
                      softWrap: true,
                      style: TextStyles.paragraphSmall12DarkerGreyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: CustomButton(
              onClick: () {},
              text: 'Eu quero!',
              color: AppColors.orange,
              textColor: AppColors.white,
              style: TextStyles.buttonTextMedium,
            ),
          )
        ],
      ),
    );
  }
}