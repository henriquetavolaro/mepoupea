import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/em_10_anos.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/em_1_ano.dart';
import 'package:mepoupeapp/presenter/pages/selfie_financeira/em_1_mes.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'hoje.dart';

class SelfieFinanceira2 extends StatefulWidget {
  SelfieFinanceira2({Key? key}) : super(key: key);

  @override
  _SelfieFinanceira2State createState() => _SelfieFinanceira2State();
}

class _SelfieFinanceira2State extends State<SelfieFinanceira2>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, initialIndex: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 200),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false,
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 8, right:  8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text('por mês'),
                          icon: const FaIcon(
                            FontAwesomeIcons.angleDown,
                            size: 16,
                          ),
                          style: ElevatedButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            side: const BorderSide(width: 1, color: AppColors.darkBlue),
                            primary: AppColors.white,
                            onPrimary: AppColors.darkBlue,
                            textStyle: TextStyles.textDarkBlueSmall11Medium,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            thickness: 1,
                            color: AppColors.textGray,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Últimas 24h',
                                  style: TextStyles.paragraphSmall9darkBlue,
                                ),
                                Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 28),
                                        child: Row(
                                          children: [
                                            Text(
                                              'R\$',
                                              style:
                                              TextStyles.textValueSmall7MontserratDarkBlue,
                                            ),
                                            Text(' 3,00',
                                                style: TextStyles
                                                    .textValueSmall12MontserratDarkBle)
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      right: 8,
                                      child: Icon(
                                        Icons.add_circle_outlined,
                                        color: AppColors.purple,
                                        size: 18,
                                      ),
                                    ),
                                    Transform.translate(
                                        offset: Offset(-2, -4),
                                        child: Image.asset('assets/selfie_coin.png'))
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Icon(
                                  Icons.menu,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 32),
                child: Text(
                  'Sua selfie financeira',
                  style: TextStyles.textMedium16LightBlackBold,
                ),
              ),
              TabBar(
                controller: tabController,
                unselectedLabelColor: AppColors.textLightBlack,
                labelColor: AppColors.darkBlue,
                indicatorColor: AppColors.darkBlue,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelStyle: TextStyles.paragraphSmall9lightBlack,
                labelStyle: TextStyles.paragraphSmall11DarkBlue,
                tabs: const [
                  Tab(text: 'Hoje'),
                  Tab(text: 'Em 1 mês'),
                  Tab(text: 'Em 1 ano'),
                  Tab(text: 'Em 10 anos'),
                ],
              ),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  Hoje(
                    sozinho: 'Sozinho',
                    numeroDeCurtidasSozinho: '67',
                    dinheiroQueFizSozinho: '7.606,49',
                    gasteiSozinho: '6.805,64',
                    gasteiComDividasSozinho: '3.228,38',
                    investiSozinho: '800,86',
                    totalDeRiquezaSozinho: '800,86',
                    backgroundColorSozinho: AppColors.white,
                    elevationSozinho: 0,
                    dinheiroQueFizValorStyleSozinho:
                        TextStyles.textSelfieCardBig20MontserratBlackSemiBold,
                    dinheiroQueFizR$StyleSozinho:
                        TextStyles.textSelfieCardMedium14MontserratBlackSemiBold,
                  ),
                  Em1Mes(
                    sozinho: 'Sozinho',
                    numeroDeCurtidasSozinho: '67',
                    dinheiroQueFizSozinho: '7.606,49',
                    gasteiSozinho: '6.805,64',
                    gasteiComDividasSozinho: '3.228,38',
                    investiSozinho: '800,86',
                    totalDeRiquezaSozinho: '800,86',
                    backgroundColorSozinho: AppColors.white,
                    elevationSozinho: 0,
                    comNath: 'Com Na.th',
                    numeroDeCurtidasComNath: '75',
                    dinheiroQueFizComNath: '8.389,85',
                    gasteiComNath: '5.872,90',
                    gasteiComDividasComNath: '3.228,38',
                    investiComNath: '2.516,95',
                    totalDeRiquezaComNath: '2.516,95',
                    backgroundColorComNath: AppColors.loginBackground,
                    elevationComNath: 4,
                    dinheiroQueFizValorStyleSozinho:
                        TextStyles.textSelfieCardBig20MontserratBlackSemiBold,
                    dinheiroQueFizR$StyleComNath:
                        TextStyles.textSelfieCardMedium15MontserratDarkBlueSemiBold,
                    dinheiroQueFizValorStyleComNath:
                        TextStyles.textSelfieCardBig21MontserratDarkBlueSemiBold,
                    dinheiroQueFizR$StyleSozinho:
                        TextStyles.textSelfieCardMedium14MontserratBlackSemiBold,
                  ),
                  Em1Ano(
                    sozinho: 'Sozinho',
                    numeroDeCurtidasSozinho: '67',
                    dinheiroQueFizSozinho: '8.035,47',
                    gasteiSozinho: '6,918,38',
                    gasteiComDividasSozinho: '3.139,38',
                    investiSozinho: '1.117,09',
                    totalDeRiquezaSozinho: '11.561,21',
                    backgroundColorSozinho: AppColors.white,
                    elevationSozinho: 0,
                    comNath: 'Com Na.th',
                    numeroDeCurtidasComNath: '90',
                    dinheiroQueFizComNath: '9.208,50',
                    gasteiComNath: '6.445,95',
                    gasteiComDividasComNath: '3.81,12',
                    investiComNath: '2.762,55',
                    totalDeRiquezaComNath: '32.732,62',
                    backgroundColorComNath: AppColors.cardLightOrange,
                    elevationComNath: 4,
                    dinheiroQueFizValorStyleSozinho:
                        TextStyles.textSelfieCardBig20MontserratBlackSemiBold,
                    dinheiroQueFizR$StyleComNath:
                        TextStyles.textSelfieCardMedium15MontserratDarkBlueSemiBold,
                    dinheiroQueFizValorStyleComNath:
                        TextStyles.textSelfieCardBig21MontserratDarkBlueSemiBold,
                    dinheiroQueFizR$StyleSozinho:
                        TextStyles.textSelfieCardMedium14MontserratBlackSemiBold,
                  ),
                  Em10Anos(
                    sozinho: 'Sozinho',
                    numeroDeCurtidasSozinho: '67',
                    dinheiroQueFizSozinho: '13.770,38',
                    gasteiSozinho: '8.741,60',
                    gasteiComDividasSozinho: '2.265,53',
                    investiSozinho: '5.028,78',
                    totalDeRiquezaSozinho: '416.873,91',
                    backgroundColorSozinho: AppColors.white,
                    elevationSozinho: 0,
                    comNath: 'Com Na.th',
                    numeroDeCurtidasComNath: '90',
                    dinheiroQueFizComNath: '22.917,35',
                    gasteiComNath: '7.859,03',
                    gasteiComDividasComNath: '1.382,96',
                    investiComNath: '14.812,32',
                    totalDeRiquezaComNath: '1.450.488,05',
                    backgroundColorComNath: AppColors.cardLightYellow,
                    elevationComNath: 4,
                    dinheiroQueFizValorStyleSozinho:
                        TextStyles.textSelfieCardBig20MontserratBlackSemiBold,
                    dinheiroQueFizR$StyleComNath:
                        TextStyles.textSelfieCardMedium15MontserratDarkBlueSemiBold,
                    dinheiroQueFizValorStyleComNath:
                        TextStyles.textSelfieCardBig21MontserratDarkBlueSemiBold,
                    dinheiroQueFizR$StyleSozinho:
                        TextStyles.textSelfieCardMedium14MontserratBlackSemiBold,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
