import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/card_selfie_column.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/selfie_financeira_1.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Hoje extends StatelessWidget {
  final String sozinho;
  final String numeroDeCurtidasSozinho;
  final String dinheiroQueFizSozinho;
  final String gasteiSozinho;
  final String gasteiComDividasSozinho;
  final String investiSozinho;
  final String totalDeRiquezaSozinho;
  final Color backgroundColorSozinho;
  final double elevationSozinho;
  final TextStyle dinheiroQueFizR$StyleSozinho;
  final TextStyle dinheiroQueFizValorStyleSozinho;

  const Hoje({
    Key? key,
    required this.sozinho,
    required this.numeroDeCurtidasSozinho,
    required this.dinheiroQueFizSozinho,
    required this.gasteiSozinho,
    required this.gasteiComDividasSozinho,
    required this.investiSozinho,
    required this.totalDeRiquezaSozinho,
    required this.backgroundColorSozinho,
    required this.elevationSozinho,
    required this.dinheiroQueFizR$StyleSozinho,
    required this.dinheiroQueFizValorStyleSozinho,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 16, bottom: 32),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardSelfieColumn(
                    elevation: elevationSozinho,
                    backgroundColor: backgroundColorSozinho,
                    sozinhoOuComNath: sozinho,
                    numeroDeCurtidas: numeroDeCurtidasSozinho,
                    dinheiroQueFiz: dinheiroQueFizSozinho,
                    gastei: gasteiSozinho,
                    gasteiComDividas: gasteiComDividasSozinho,
                    investi: investiSozinho,
                    totalDeRiqueza: totalDeRiquezaSozinho,
                    dinheiroQueFizR$Style: dinheiroQueFizR$StyleSozinho,
                    dinheiroQueFizValorStyle: dinheiroQueFizValorStyleSozinho,
                    heartIconVisibility: false,
                  ),
                  Expanded(
                    flex: 1,
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      elevation: 4,
                      child: Container(

                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: AppColors.loginBackground),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  'Com Na.th',
                                  style: TextStyles.paragraphSmall13lightBlack,
                                ),
                                Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: false,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 24.0),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CustomPaint(
                                            size: Size(
                                                24,
                                                (24 * 0.880482791796038)
                                                    .toDouble()),
                                            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                            painter: HeartIcon(),
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyles
                                                .textSelfieSmall9MontserratWhiteSemiBold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 8),
                              child: Text(
                                'Dinheiro que fiz',
                                style: TextStyles.textTermosLightBlack11,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Material(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'R\$ ',
                                            style: TextStyles
                                                .textSelfieCardMedium14MontserratGreySemiBold,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '7.568,65',
                                                style: TextStyles
                                                    .textSelfieCardBig20MontserratGreySemiBold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CustomButtonStroke(
                                        visualDensity: VisualDensity.compact,
                                        onClick: () {},
                                        text: 'Quero ganhar mais',
                                        color: AppColors.white,
                                        textColor: AppColors.darkBlue,
                                        style:
                                            TextStyles.paragraphSmall9darkBlue,
                                        borderSide: const BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 4),
                              child: Text(
                                'Gastei',
                                style: TextStyles.paragraphSmall12BlackMedium,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Material(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '- R\$ ',
                                          style: TextStyles
                                              .textSelfieSmall9MontserratGreySemiBold,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '6.795,93',
                                                style: TextStyles
                                                    .textSelfieSmall13MontserratGreySemiBold),
                                          ],
                                        ),
                                      ),
                                      CustomButtonStroke(
                                        visualDensity: VisualDensity.compact,
                                        onClick: () {},
                                        text: 'Quero gastar menos',
                                        color: AppColors.white,
                                        textColor: AppColors.darkBlue,
                                        style:
                                            TextStyles.paragraphSmall9darkBlue,
                                        borderSide: const BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 4),
                              child: Text(
                                'Investi',
                                style: TextStyles.paragraphSmall12BlackMedium,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Material(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: '+ R\$ ',
                                          style: TextStyles
                                              .textSelfieSmall9MontserratGreySemiBold,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '398,42',
                                                style: TextStyles
                                                    .textSelfieSmall13MontserratGreySemiBold),
                                          ],
                                        ),
                                      ),
                                      CustomButtonStroke(
                                        visualDensity: VisualDensity.compact,
                                        onClick: () {},
                                        text: 'Quero investir melhor',
                                        color: AppColors.white,
                                        textColor: AppColors.darkBlue,
                                        style:
                                            TextStyles.paragraphSmall9darkBlue,
                                        borderSide: const BorderSide(
                                            color: AppColors.darkBlue,
                                            width: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'E daqui a 1 mês?',
              style: TextStyles.textUnderlinedDarkBlue,
            ),
          )
        ],
      ),
    );
  }
}
