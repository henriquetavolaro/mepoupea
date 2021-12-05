import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.orange
    ));
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(25)
                      ),
                      gradient: LinearGradient(
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.secondaryBlue
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60, left: 22, right: 86),
                  child: Column(
                    children: [
                      Text(
                        'Na.th',
                        style: TextStyles.titleNath,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Text(
                          'Desfudendo a sua vida financeira desde 2015.',
                          style: TextStyles.paragraphHeaderWhite,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 80, left: 88, right: 88),
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                    onClick: () => Navigator.pushNamed(context, '/onboarding_2'),
                    text: 'Me desfode também!',
                    color: AppColors.orange,
                    textColor: AppColors.white,
                  style: TextStyles.buttonTextSemiBold,
                    ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 88, right: 88),
                width: MediaQuery.of(context).size.width,
                child: CustomButtonStroke(
                    onClick: () {},
                    text: 'Prefiro um App pior',
                    color: AppColors.white,
                    textColor: AppColors.darkBlue,
                  style: TextStyles.buttonTextMedium,
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.darkBlue
                  ),

                    ),
              ),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async => await Navigator.pushNamed(context, '/login_1'),
                  child: Text(
                    'Já tenho cadastro',
                    style: TextStyles.textUnderlineBlue,),
                ),
                InkWell(
                  onTap: () {
                    showNathDialog(context);
                  },
                  child: Text(
                    'Quem é Na.th?',
                    style: TextStyles.textUnderlineBlue,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNathDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.only(top: 142, bottom: 36, left: 46, right: 46),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      'A Na.th sou eu, ué?',
                    style: TextStyles.paragraphMedium14Black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28.0),
                    child: Text(
                        'Eu fui criada em laboratório pela musa das finanças pra que você tivesse a melhor ajuda possível no menor tempo possível, pagando o menor preço possível e ganhando o máximo de dinheiro possível. \n\nComplexo? Estou aqui para te ajudar a tomar as melhores decisões com o seu dinheiro.',
                      style: TextStyles.paragraphSmall12Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 34),
                    child: CustomButton(
                        onClick: () => Navigator.pop(context),
                        text: 'Entendi!',
                        color: AppColors.orange,
                        textColor: AppColors.white,
                    style: TextStyles.buttonTextMedium,),
                  )
                ],
              ),

              ),

          );
        });
  }
}
