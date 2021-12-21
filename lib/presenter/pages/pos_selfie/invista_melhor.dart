import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/rectangular_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class InvistaMelhor extends StatefulWidget {
  final VoidCallback showMeusEnvelopes;
  final VoidCallback showMinhasMetas;

  const InvistaMelhor({Key? key, required this.showMeusEnvelopes, required this.showMinhasMetas})
      : super(key: key);

  @override
  _InvistaMelhorState createState() => _InvistaMelhorState();
}

class _InvistaMelhorState extends State<InvistaMelhor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              'Olha o que eu achei pra você!',
              style: TextStyles.paragraphMedium16BlackBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 16),
                          child: Text(
                            'Nível: iniciante',
                            style: TextStyles.paragraphSmall12DarkerGreyMedium,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 12),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Sinto cheiro de riqueza! Ganhe ',
                                        style: TextStyles
                                            .paragraphSmall12DarkerGreyMedium,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'o dobro ',
                                              style: TextStyles
                                                  .paragraphSmall12DarkerGreySemiBold),
                                          TextSpan(
                                              text:
                                                  'de dinheiro turbinando seu valor investido!',
                                              style: TextStyles
                                                  .paragraphSmall12DarkerGreyMedium),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CustomButton(
                                onClick: () {},
                                text: 'Turbinar investimentos',
                                color: AppColors.darkOrange,
                                textColor: AppColors.white,
                                style: TextStyles.buttonTextMedium,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 16),
                          child: Text(
                            'Invista',
                            style: TextStyles.paragraphSmall12DarkerGreyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'R\$ ',
                              style: TextStyles
                                  .textSelfieMedium16MontserratDarkOrangeSemiBold,
                              children: <TextSpan>[
                                TextSpan(
                                    text: '490 ',
                                    style: TextStyles
                                        .textSelfieBig24MontserratDarkOrangeSemiBold),
                                TextSpan(
                                    text: '/ mês',
                                    style: TextStyles
                                        .textSelfieMedium16MontserratDarkOrangeSemiBold),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.8,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 12),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Eu ouvi ADEUS, DÍVIDA CRUEL?\n',
                                        style: TextStyles
                                            .paragraphSmall12DarkerGreySemiBold,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  'Reduza sua parcela e invista R\$490 todos os meses, sem sair de casa.',
                                              style: TextStyles
                                                  .paragraphSmall12DarkerGreyMedium),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: CustomButton(
                                onClick: () {},
                                text: 'Me ajuda, Na.th!',
                                color: AppColors.darkOrange,
                                textColor: AppColors.white,
                                style: TextStyles.buttonTextMedium,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: RectangularButton(
                      text: 'Minhas metas',
                      onClick: () => widget.showMinhasMetas(),
                      textColor: AppColors.textLightBlack,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: RectangularButton(
                      text: 'Meus envelopes',
                      onClick: () => widget.showMeusEnvelopes(),
                      textColor: AppColors.textLightBlack,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
