import 'package:blinking_text/blinking_text.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/app_bar_blue.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AtualizandoSelfie extends StatefulWidget {
  const AtualizandoSelfie({Key? key}) : super(key: key);

  @override
  _AtualizandoSelfieState createState() => _AtualizandoSelfieState();
}

class _AtualizandoSelfieState extends State<AtualizandoSelfie> {

  @override
  void initState() {
    navigateAfterAnimation();
    super.initState();
  }

  void navigateAfterAnimation() async {
    Future.delayed(Duration(milliseconds: 6500), () {
      Navigator.pushNamed(context, '/selfie_financeira_1');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBlue(appBar: AppBar(),),
      body: SafeArea(
        child: BackgroundBlueGradientContainer(
          child: Column(
            children: [
              Text(
                'Atualizando Selfie da riqueza',
                style: TextStyles.headerTextWhiteSemiBold,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [

                        Center(
                          child: ShowUpAnimation(
                              animationDuration: Duration(seconds: 3),
                              curve: Curves.ease,
                              offset: -100,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50.0),
                                child: Image.asset('assets/coin.png'),
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
                                child: Image.asset('assets/coin.png'),
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
                                child: Image.asset('assets/coin.png'),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/wallet_left.png'),
                            Image.asset('assets/wallet_right.png'),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 42),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: BlinkText(
                              'Somando total de ganhos',
                              style: TextStyles.textWhite14Light,
                              beginColor: AppColors.white,
                              endColor: AppColors.secondaryBlue,
                              times: 3,
                              duration: Duration(seconds: 1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: DelayedDisplay(
                              delay: Duration(seconds: 3),
                              child: BlinkText(
                                'Separando gastos por categorias…',
                                style: TextStyles.textWhite14Light,
                                beginColor: AppColors.white,
                                endColor: AppColors.secondaryBlue,
                                times: 3,
                                duration: Duration(seconds: 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: DelayedDisplay(
                              delay: Duration(seconds: 5),
                              child: BlinkText(
                                'Calculando rentabilidade…',
                                style: TextStyles.textWhite14Light,
                                beginColor: AppColors.white,
                                endColor: AppColors.secondaryBlue,
                                times: 3,
                                duration: Duration(seconds: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
