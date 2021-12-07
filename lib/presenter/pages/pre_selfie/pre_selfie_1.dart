import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PreSelfie1 extends StatefulWidget {
  const PreSelfie1({Key? key}) : super(key: key);

  @override
  _PreSelfie1State createState() => _PreSelfie1State();
}

class _PreSelfie1State extends State<PreSelfie1> {
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
                padding: const EdgeInsets.only(bottom: 24),
                height: 104,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, Joaquina!',
                      style: TextStyles.headerTextBlue,
                    ),
                    Text(
                      'Para recomendar as melhores maneiras de aumentar sua renda, preciso saber…',
                      style: TextStyles.paragraphSmall12BlackMedium,
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
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                          text: 'Tudo que você ',
                          style: TextStyles.paragraphSmall12BlackMedium,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'GANHA',
                                style:
                                    TextStyles.paragraphSmall12BlackSemiBold),
                            TextSpan(text: ' no mês...')
                          ],
                        ),
                        textAlign: TextAlign.center),
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
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                                  text: 'Tudo que você ',
                                  style: TextStyles.paragraphSmall12BlackMedium,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '\nGASTA',
                                        style: TextStyles
                                            .paragraphSmall12BlackSemiBold),
                                  ],
                                ),
                                textAlign: TextAlign.center),
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
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                                  text: 'E quanto você ',
                                  style: TextStyles.paragraphSmall12BlackMedium,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '\nINVESTE',
                                        style: TextStyles
                                            .paragraphSmall12BlackSemiBold),
                                  ],
                                ),
                                textAlign: TextAlign.center),
                          ),
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
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(
                            text: 'Vou até dizer quantas curtidas\nsua ',
                            style: TextStyles.paragraphSmall12BlackMedium,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Selfie da Riqueza ',
                                  style:
                                      TextStyles.paragraphSmall12BlackSemiBold),
                              TextSpan(text: 'merece!')
                            ],
                          ),
                          textAlign: TextAlign.center),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 60, right: 60, top: 16),
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            onClick: () {},
                            text: 'Pode ver minhas contas!',
                            color: AppColors.darkBlue,
                            textColor: AppColors.white,
                            style: TextStyles.buttonTextSemiBold,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          width: MediaQuery.of(context).size.width,
                          child: CustomButtonStroke(
                            text: 'Me dá um exemplo...',
                            onClick: () async => await Navigator.pushNamed(
                                context, '/pre_selfie_exemplo_1'),
                            style: TextStyles.buttonTextMedium,
                            textColor: AppColors.darkBlue,
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.darkBlue),
                            color: AppColors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
