import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/card_ganhei.dart';
import 'package:mepoupeapp/presenter/components/card_gastei_investi.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PreSelfieExemplo2 extends StatefulWidget {
  const PreSelfieExemplo2({Key? key}) : super(key: key);

  @override
  _PreSelfieExemplo2State createState() => _PreSelfieExemplo2State();
}

class _PreSelfieExemplo2State extends State<PreSelfieExemplo2>
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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false),
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
                            'Alguém que também ganha mil, mas gasta 900, precisa de uns ajustes e recebe ',
                        style: TextStyles.paragraphSmall12BlackMedium,
                        children: <TextSpan>[
                          TextSpan(
                              text: '60 curtidas.',
                              style: TextStyles.paragraphSmall12BlackSemiBold),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CardGanhei(
                    animationController: animationController,
                  textAlignment: Alignment.bottomCenter,
                  text: '1.000,00',),
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
                          value: ' 900,00',
                          liquidColor: AppColors.gasteiBackground,
                          text: 'Gastei',
                          valueStyle: TextStyles.textCardValorGastei,
                          animationController: animationController,
                          moneyStyle: TextStyles.textCardR$Gastei,
                          liquidPercentage: 0.72,
                          textAlignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: CardGasteiInvesti(
                          value: ' 100,00',
                          liquidColor: AppColors.investiBackground,
                          text: 'Investi',
                          valueStyle: TextStyles.textCardValorInvest,
                          animationController: animationController,
                          moneyStyle: TextStyles.textCardR$Investi,
                          liquidPercentage: 0.008,
                          textAlignment: Alignment.bottomCenter,
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
                        onClick: () async => await Navigator.pushNamed(context, '/como_prefere_conectar'),
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
                            context, '/pre_selfie_exemplo_3'),
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
