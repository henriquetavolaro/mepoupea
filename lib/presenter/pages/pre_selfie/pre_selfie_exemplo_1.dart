import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mepoupeapp/presenter/components/card_ganhei.dart';
import 'package:mepoupeapp/presenter/components/card_gastei_investi.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/presenter/components/liquid_linear_progress_custom.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PreSelfieExemplo1 extends StatefulWidget {
  const PreSelfieExemplo1({Key? key}) : super(key: key);

  @override
  _PreSelfieExemplo1State createState() => _PreSelfieExemplo1State();
}

class _PreSelfieExemplo1State extends State<PreSelfieExemplo1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.loginBackground));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                height: 104,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text:
                            'Alguém que ganha mil reais por mês e investe 300, tem uma Selfie Financeira MUITO BOA e merece ',
                        style: TextStyles.paragraphSmall12BlackMedium,
                        children: <TextSpan>[
                          TextSpan(
                              text: '90 curtidas!',
                              style: TextStyles.paragraphSmall12BlackSemiBold),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CardGanhei(animationController: animationController),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: CardGasteiInvesti(
                          value: ' 700,00',
                          liquidColor: AppColors.gasteiBackground,
                          text: 'Gastei',
                          valueStyle: TextStyles.textCardValorGastei,
                          animationController: animationController,
                          moneyStyle: TextStyles.textCardR$Gastei,
                          liquidPercentage: 0.56,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: CardGasteiInvesti(
                            value: ' 300,00',
                            liquidColor: AppColors.investiBackground,
                            text: 'Investi',
                            valueStyle: TextStyles.textCardValorInvest,
                            animationController: animationController,
                            moneyStyle: TextStyles.textCardR$Investi,
                            liquidPercentage: 0.24,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 24),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 60, right: 60, top: 36),
                      width: MediaQuery.of(context).size.width,
                      child: CustomButton(
                        onClick: () {},
                        text: 'Quantas curtidas mereço?',
                        color: AppColors.darkBlue,
                        textColor: AppColors.white,
                        style: TextStyles.buttonTextSemiBold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      width: MediaQuery.of(context).size.width,
                      child: CustomButtonStroke(
                        text: 'Me dá outro exemplo...',
                        onClick: () async => await Navigator.pushNamed(
                            context, '/pre_selfie_exemplo_2'),
                        style: TextStyles.buttonTextMedium,
                        textColor: AppColors.darkBlue,
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.darkBlue),
                        color: AppColors.white,
                      ),
                    )
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
