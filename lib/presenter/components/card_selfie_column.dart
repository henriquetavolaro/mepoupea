import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/selfie_financeira_1.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CardSelfieColumn extends StatelessWidget {
  final double elevation;
  final Color backgroundColor;
  final String sozinhoOuComNath;
  final String numeroDeCurtidas;
  final String dinheiroQueFiz;
  final String gastei;
  final String gasteiComDividas;
  final String investi;
  final String totalDeRiqueza;
  final TextStyle dinheiroQueFizR$Style;
  final TextStyle dinheiroQueFizValorStyle;
  bool heartIconVisibility;

  CardSelfieColumn(
    {
    Key? key,
    this.heartIconVisibility = true,
    required this.elevation,
    required this.backgroundColor,
    required this.sozinhoOuComNath,
    required this.numeroDeCurtidas,
    required this.dinheiroQueFiz,
    required this.gastei,
    required this.gasteiComDividas,
    required this.investi,
    required this.totalDeRiqueza,
    required this.dinheiroQueFizR$Style,
    required this.dinheiroQueFizValorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: elevation,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: backgroundColor),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    sozinhoOuComNath,
                    style: TextStyles.paragraphSmall13lightBlack,
                  ),
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: heartIconVisibility,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomPaint(
                              size: Size(24, (24 * 0.880482791796038).toDouble()),
                              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                              painter: HeartIcon(),
                            ),
                            Text(
                              numeroDeCurtidas,
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
                padding: const EdgeInsets.only(top: 24, bottom: 8),
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
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'R\$ ',
                        style: dinheiroQueFizR$Style,
                        children: <TextSpan>[
                          TextSpan(
                              text: dinheiroQueFiz,
                              style: dinheiroQueFizValorStyle),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
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
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 16, left: 8, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '- R\$ ',
                            style: TextStyles.paragraphSmall9MontserratRed,
                            children: <TextSpan>[
                              TextSpan(
                                  text: gastei,
                                  style: TextStyles
                                      .textSelfieSmall13MontserratLightRedSemiBold),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    '---------',
                                    style: TextStyles.paragraphGreySmall11light,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-6, 0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: '_ _   R\$ ',
                                      style: TextStyles
                                          .textValueSmall7MontserratLightBlack,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: gasteiComDividas,
                                            style: TextStyles
                                                .textValueSmall9MontserratLightBlack),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'com dívidas',
                              style: TextStyles.textValueSmall7LightBlack,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
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
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 16, left: 8, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '+ R\$ ',
                            style: TextStyles.paragraphSmall9MontserratGreen,
                            children: <TextSpan>[
                              TextSpan(
                                  text: investi,
                                  style: TextStyles
                                      .textSelfieSmall13MontserratGreenSemiBold),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    '------',
                                    style: TextStyles.paragraphGreySmall11light,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-6, 0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: '_ _ R\$ ',
                                      style: TextStyles
                                          .textValueSmall7MontserratLightBlack,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: totalDeRiqueza,
                                            style: TextStyles
                                                .textValueSmall9MontserratLightBlack),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              'Total de riqueza',
                              style: TextStyles.textValueSmall7LightBlack,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
