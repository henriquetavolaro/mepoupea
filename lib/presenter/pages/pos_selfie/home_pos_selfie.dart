import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexagon/hexagon.dart';
import 'package:mepoupeapp/presenter/components/avatar_pre_selfie.dart';
import 'package:mepoupeapp/presenter/components/bottom_dialog_meus_envelopes.dart';
import 'package:mepoupeapp/presenter/components/bottom_dialog_meus_envelopes_row.dart';
import 'package:mepoupeapp/presenter/components/bottom_dialog_minhas_metas.dart';
import 'package:mepoupeapp/presenter/components/bottom_minhas_metas_row.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/ganhe_mais.dart';
import 'package:mepoupeapp/presenter/pages/pos_selfie/invista_melhor.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'gaste_menos.dart';

class HomePosSelfie extends StatefulWidget {
  const HomePosSelfie({Key? key}) : super(key: key);

  @override
  _HomePosSelfieState createState() => _HomePosSelfieState();
}

class _HomePosSelfieState extends State<HomePosSelfie>   with SingleTickerProviderStateMixin {
  late final TabController tabController;

  var listBottomMeusEnvelopesRow = [ const BottomMeusEnvelopesRow(
    title: 'Reserva de emergência',
    percent: 22500/30000*100,
    total: 'R\$ 30.000',
    prazo: 'mar/2022',
    valorAtual: 'R\$ 22.500',
  ),
    const BottomMeusEnvelopesRow(
      title: 'Independência financeira',
      percent: 80613/1000000*100,
      total: 'R\$ 1.000.000',
      prazo: 'set/2036',
      valorAtual: 'R\$ 80.613',
    ),
  ];

  var listBottomMinhasMetasRow = [ BottomMinhasMetasRow(
    percent: 200/700*100,
    total: 'R\$ 700',
    prazo: 'dez 2022',
    valorAtual: 'R\$ 22.500',
    image: Image.asset('assets/bicycle.png'),
  ),
    BottomMinhasMetasRow(
      percent: 80613/1000000*100,
      total: 'R\$ 200.000',
      prazo: 'set 2036',
      valorAtual: 'R\$ 10.000',
      image: Image.asset('assets/house.png'),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tabController.index == 0
          ? AppColors.loginBackground
          : tabController.index == 1
            ? AppColors.backgroundLightYellow
            : AppColors.backgroundLightGreen,
      appBar: AppBar(
        backgroundColor: tabController.index == 0
            ? AppColors.loginBackground
            : tabController.index == 1
            ? AppColors.backgroundLightYellow
            : AppColors.backgroundLightGreen,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.white),
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, bottom: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SizedBox(
                                  height: 24,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(6),
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.0, right: 2),
                                      child: RoundedProgressBar(
                                        height: 20,
                                        childCenter: Text(
                                          'R\$ 7.200 / 10.000',
                                          style: TextStyles.paragraphSmall10White,
                                        ),
                                        style: RoundedProgressBarStyle(
                                            borderWidth: 0,
                                            colorProgress: AppColors.orange,
                                            backgroundProgress: AppColors.white,
                                            widthShadow: 0),
                                        borderRadius: BorderRadius.circular(6),
                                        percent: 7200 / 10000 * 100,
                                        // margin: EdgeInsets.symmetric(vertical: 5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              HexagonWidget.pointy(
                                width: 30,
                                color: Colors.purple,
                                child: Text('2',
                                    style: TextStyles.paragraphSmall11WhiteBold),
                              ),
                            ],
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
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 28),
                                        child: Row(
                                          children: [
                                            Text(
                                              'R\$',
                                              style: TextStyles
                                                  .textValueSmall7MontserratDarkBlue,
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24, right: 16, bottom: 50, left: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const AvatarPreSelfie(),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Joaquina',
                              style: TextStyles.textBlack14Medium,
                            ),
                          )
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('Outubro'),
                        icon: const FaIcon(
                          FontAwesomeIcons.angleDown,
                          size: 16,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          side: const BorderSide(
                              width: 1, color: AppColors.darkBlue),
                          primary: AppColors.white,
                          onPrimary: AppColors.darkBlue,
                          textStyle: TextStyles.textDarkBlueSmall11Medium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color:  tabController.index == 0
                    ? AppColors.loginBackground
                    : tabController.index == 1
                    ? AppColors.backgroundLightYellow
                    : AppColors.backgroundLightGreen,
                child: Transform.translate(
                  offset: Offset(0, -24),
                  child: Material(
                    color: AppColors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(25),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Saldo atual',
                            style: TextStyles.paragraphSmall13lightBlack,),
                          Row(
                            children: [
                              Text(
                                'R\$ 2.253,83',
                                style: TextStyles.textSelfieSmall12MontserratLightBlackSemiBold,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 16.0),
                                child: FaIcon(
                                  FontAwesomeIcons.angleDown,
                                  size: 24,
                                  color: AppColors.textLightGray,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              controller: tabController,
              unselectedLabelColor: AppColors.textGray,
              labelColor: AppColors.textLightBlack,
              indicatorColor: AppColors.orange,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelStyle: TextStyles.paragraphSmall11DarkBlue,
              labelStyle: TextStyles.paragraphSmall13lightBlack,
              onTap: (int) => setState(() {
              }),
              tabs: const [
                Tab(text: 'Gaste menos'),
                Tab(text: 'Ganhe mais'),
                Tab(text: 'Invista melhor'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  GasteMenos(showMeusEnvelopes: () => showMeusEnvelopes(context), showMinhasMetas: () => showMinhasMetas(context),),
                  GanheMais(showMeusEnvelopes: () => showMeusEnvelopes(context), showMinhasMetas: () => showMinhasMetas(context),),
                  InvistaMelhor(showMeusEnvelopes: () => showMeusEnvelopes(context),showMinhasMetas: () => showMinhasMetas(context),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMeusEnvelopes(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        context: context,
        builder: (BuildContext context) {
          return BottomDialogMeusEnvelopes(list: listBottomMeusEnvelopesRow,);
        });
  }

  void showMinhasMetas(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        context: context,
        builder: (BuildContext context) {
          return BottomDialogMinhasMetas(list: listBottomMinhasMetasRow,);
        });
  }
}
