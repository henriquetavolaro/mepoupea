import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PreSelfieExemplo1 extends StatefulWidget {
  const PreSelfieExemplo1({Key? key}) : super(key: key);

  @override
  _PreSelfieExemplo1State createState() => _PreSelfieExemplo1State();
}

class _PreSelfieExemplo1State extends State<PreSelfieExemplo1> {
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
                          text: '\n90 curtidas!',
                          style:
                          TextStyles.paragraphSmall12BlackSemiBold),
                    ],
                  ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 8.0),
                    child: Text(
                      'Tudo que eu ganhei',
                      style: TextStyles.paragraphSmall12BlackMedium,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: RichText(
                        text: TextSpan(
                          text:
                          'R\$',
                          style: TextStyles.textCardR$Ganhei,
                          children: <TextSpan>[
                            TextSpan(
                                text: ' 1.000,00',
                                style:
                                TextStyles.textCardValorGanhei),
                          ],
                        ),
                      ),
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12, left: 8.0),
                            child: Text(
                              'Gastei',
                              style: TextStyles.paragraphSmall12BlackMedium,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 28),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                  'R\$',
                                  style: TextStyles.textCardR$Gastei,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' 700,00',
                                        style:
                                        TextStyles.textCardValorGastei),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12, left: 8.0),
                            child: Text(
                              'Investi',
                              style: TextStyles.paragraphSmall12BlackMedium,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 28),
                              child: RichText(
                                text: TextSpan(
                                  text:
                                  'R\$',
                                  style: TextStyles.textCardR$Investi,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' 300,00',
                                        style:
                                        TextStyles.textCardValorInvest),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 24),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.4,
          child: Column(
              children: [
          Container(
          padding: const EdgeInsets.only(
              left: 60, right: 60, top: 36),
          width: MediaQuery
              .of(context)
              .size
              .width,
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
          onClick: () async =>
          await Navigator.pushNamed(
              context, '/pre_selfie_exemplo_1'),
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
