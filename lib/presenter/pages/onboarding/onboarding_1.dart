import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
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
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
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
                padding: const EdgeInsets.only(bottom: 42, left: 22, right: 42),
                child: Column(
                  children: [
                    Text(
                      'Na.th',
                      style: TextStyles.titleNath,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 36.0),
                      child: Text(
                        'Você está prestes a fazer as melhores escolhas com o seu dinheiro.',
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
              padding: const EdgeInsets.only(top: 80, left: 88, right: 88, bottom: 36),
              width: MediaQuery.of(context).size.width,

              child: CustomButton(
                  onClick: () => Navigator.pushNamed(context, '/onboarding_2'),
                  text: 'Me ajuda, Na.th!',
                  color: AppColors.orange,
                  textColor: AppColors.white,
                  ),
            ),
            InkWell(
              onTap: () async => await Navigator.pushNamed(context, '/login_1'),
              child: Text(
                  'Já tenho cadastro',
                  style: TextStyles.textBlue,),
            )
          ],
        ),
      ),
    );
  }
}
