import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/bottom_minhas_metas_row.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';
import 'package:show_up_animation/show_up_animation.dart';

class DetalhesCardDistribuirEmMetas extends StatefulWidget {
  const DetalhesCardDistribuirEmMetas({Key? key}) : super(key: key);

  @override
  _DetalhesCardDistribuirEmMetasState createState() =>
      _DetalhesCardDistribuirEmMetasState();
}

class _DetalhesCardDistribuirEmMetasState
    extends State<DetalhesCardDistribuirEmMetas> {
  var list = [
    BottomMinhasMetasRow(
      percent: 80613 / 1000000 * 100,
      total: 'R\$ 2.000',
      prazo: 'fev 2022',
      valorAtual: 'R\$ 0',
      image: Image.asset('assets/umbrella.png'),
      title: 'Férias na praia',
    ),
    BottomMinhasMetasRow(
      percent: 200 / 700 * 100,
      total: 'R\$ 700',
      prazo: 'dez 2022',
      valorAtual: 'R\$ 22.500',
      image: Image.asset('assets/bicycle.png'),
      title: 'Bicicleta South Stark',
    ),
    BottomMinhasMetasRow(
      percent: 80613 / 1000000 * 100,
      total: 'R\$ 200.000',
      prazo: 'set 2036',
      valorAtual: 'R\$ 10.000',
      image: Image.asset('assets/house.png'),
      title: 'Imóvel',
    ),
  ];

  var listOfGoals = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.white),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: AppColors.orange,
                      size: 28,
                    ),
                    Text(
                      'Gaste menos',
                      style: TextStyles.paragraphSmall13lightBlack,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 28, bottom: 32, left: 24, right: 24),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  color: AppColors.loginBackground,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 90, bottom: 24),
                        child: Stack(
                          children: [
                            Center(
                              child: ShowUpAnimation(
                                  animationDuration: Duration(seconds: 3),
                                  curve: Curves.ease,
                                  offset: -100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 50.0),
                                    child: Image.asset(
                                      'assets/coin.png',
                                      width: 40,
                                    ),
                                  )),
                            ),
                            Center(
                              child: ShowUpAnimation(
                                  delayStart: Duration(milliseconds: 300),
                                  animationDuration: Duration(seconds: 3),
                                  curve: Curves.ease,
                                  offset: -100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Image.asset(
                                      'assets/coin.png',
                                      width: 40,
                                    ),
                                  )),
                            ),
                            Center(
                              child: ShowUpAnimation(
                                  delayStart: Duration(milliseconds: 600),
                                  animationDuration: Duration(seconds: 3),
                                  curve: Curves.ease,
                                  offset: -100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 60.0),
                                    child: Image.asset(
                                      'assets/coin.png',
                                      width: 40,
                                    ),
                                  )),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/wallet_left.png',
                                    width: 50,
                                  ),
                                  Image.asset(
                                    'assets/wallet_right.png',
                                    width: 60,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Atualizando riqueza...',
                        style: TextStyles.paragraphMedium16BlackBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: RichText(
                          text: TextSpan(
                            text: '+ R\$ ',
                            style: TextStyles
                                .textSelfieBig24MontserratDarkOrangeLight,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '490',
                                  style: TextStyles
                                      .textSelfieBig35MontserratDarkOrangeMedium),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, bottom: 32),
                        child: Text(
                          'Você cortou seu gasto com anuidade e poupou R\$ 40,89 / mês',
                          style: TextStyles.phoneNumberTextField,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Qual meta você irá turbinar com seu ganho de R\$ 490?',
                    style: TextStyles.paragraphSmall12DarkerGreyMedium,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [...list.map(buildCheckboxListTile).toList()],
                  )

                  // ListView.builder(
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: list.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     final item = list[index];
                  //     return CheckboxListTile(
                  //       value: null,
                  //       onChanged: (bool? value) {  },
                  //       title: BottomMinhasMetasRow(
                  //         percent: item.percent,
                  //         total: item.total,
                  //         valorAtual: item.valorAtual,
                  //         prazo: item.prazo,
                  //         image: item.image,
                  //         title: item.title,
                  //       ),
                  //     );
                  //   },
                  // ),
                  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 42),
                child: CustomButton(
                  onClick: listOfGoals.isEmpty
                      ? (){}
                      : () async => await Navigator.pushNamed(context, '/home_pos_selfie'),
                  text: 'Turbinar!',
                  color: listOfGoals.isEmpty ? AppColors.lightOrange : AppColors.orange,
                  textColor: AppColors.white,
                  style: TextStyles.buttonTextMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildCheckboxListTile(BottomMinhasMetasRow bottomMinhasMetasRow) {
    return CheckboxListTile(
        value: bottomMinhasMetasRow.checkValue,
        onChanged: (bool? value) => setState(
              () {
                bottomMinhasMetasRow.checkValue = value!;
                if (listOfGoals.contains(bottomMinhasMetasRow)) {
                  listOfGoals.remove(bottomMinhasMetasRow);
                } else {
                  listOfGoals.add(bottomMinhasMetasRow);
                }
                
              },
            ),
        title: BottomMinhasMetasRow(
          percent: bottomMinhasMetasRow.percent,
          total: bottomMinhasMetasRow.total,
          valorAtual: bottomMinhasMetasRow.valorAtual,
          prazo: bottomMinhasMetasRow.prazo,
          image: bottomMinhasMetasRow.image,
          title: bottomMinhasMetasRow.title,
        ));
  }
}
