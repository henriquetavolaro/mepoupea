import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'custom_button.dart';

class RecommendationCardGanheMais extends StatelessWidget {
  final String ganhe;
  final String valor;
  final String descricao;

  const RecommendationCardGanheMais({
    Key? key,
    required this.ganhe,
    required this.valor,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16),
            child: Text(
              'Nível: iniciante',
              style: TextStyles.paragraphSmall12DarkerGreyMedium,),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 12),
                child: Image.asset('assets/card_recommendation.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      ganhe,
                      style: TextStyles.paragraphSmall12DarkerGreyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'R\$ ',
                        style: TextStyles
                            .textSelfieMedium16MontserratDarkBlueSemiBold,
                        children: <TextSpan>[
                          TextSpan(
                              text: '$valor ',
                              style: TextStyles
                                  .textSelfieBig24MontserratDarkBlueSemiBold),
                          TextSpan(
                              text: '(- R\$ 30,83/mês)',
                              style: TextStyles
                                  .textSelfieSmall9MontserratWhiteMedium)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: CustomButton(
                  onClick: () {},
                  text: 'Mostrar desafio!',
                  color: AppColors.redGastei,
                  textColor: AppColors.white,
                  style: TextStyles.buttonTextMedium,
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}

