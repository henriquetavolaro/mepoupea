import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding3NaoSei extends StatefulWidget {
  const Onboarding3NaoSei({Key? key}) : super(key: key);

  @override
  State<Onboarding3NaoSei> createState() => _Onboarding3NaoSeiState();
}

class _Onboarding3NaoSeiState extends State<Onboarding3NaoSei> {
  List<String> answers = [
    'Com minha gestão financeira',
    'Com dicas de produtos',
    'Informações sobre descontos'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: BackgroundBlueGradientContainer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 42, left: 22, right: 22),
                child: Column(
                  children: [
                    Text(
                      'Não tem problema, muita gente não sabe!',
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
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 48, right: 48, bottom: 12),
                        child: CustomButton(
                          onClick: () {},
                          text: item,
                          color: AppColors.white,
                          textColor: AppColors.darkBlue,
                          style: TextStyles.buttonTextSemiBold,
                        ),
                      );
                    }),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 66.0, top: 16),
                      child: InkWell(
                        onTap: () async => await Navigator.pushNamed(context, '/login_1'),
                        child: RichText(
                            text: TextSpan(
                              text: 'Já tem uma conta? ',
                              style: TextStyles.textWhite,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Entrar',
                                    style: TextStyles.textUnderlineWhite)
                              ],
                            ),
                            textAlign: TextAlign.center
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}