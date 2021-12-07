import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/ja_tem_uma_conta_bottom.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding4HojeNao extends StatefulWidget {
  const Onboarding4HojeNao({Key? key}) : super(key: key);

  @override
  State<Onboarding4HojeNao> createState() => _Onboarding4HojeNaoState();
}

class _Onboarding4HojeNaoState extends State<Onboarding4HojeNao> {
  List<String> answers = [
    'Com minha gestão financeira',
    'Com dicas de produtos',
    'Informações sobre descontos',
    'Tava brincando, mudei de ideia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.orange),
      ),
      body: SafeArea(
        child: BackgroundBlueGradientContainer(
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 42, left: 22, right: 22),
                  child: Column(
                    children: [
                      Text(
                        'Que pena! Se você mudar de ideia, será uma jornada incrível. ',
                        style: TextStyles.headerTextWhite,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Text(
                          'Como você acha que eu poderia te ajudar melhor?',
                          style: TextStyles.headerParagraphWhite,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: answers.length,
                      itemBuilder: (context, index) {
                        final item = answers[index];
                        if (index != answers.length - 1) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 48, right: 48, bottom: 12),
                            child: CustomButton(
                              onClick: () {},
                              text: item,
                              color: AppColors.white,
                              textColor: AppColors.darkBlue,
                              style: TextStyles.buttonTextMedium,
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 48, right: 48, bottom: 12),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(color: AppColors.white, width: 1),
                                  ),
                                  primary: AppColors.white),
                              onPressed: () {},
                              child: Text(
                                item,
                                style: TextStyles.buttonTextMedium,
                              ),
                            ),
                          );
                        }
                      }),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: JaTemUmaContaBottom(
                      style: TextStyles.textWhite,
                      styleUnderline: TextStyles.textUnderlineWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
