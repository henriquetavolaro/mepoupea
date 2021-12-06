import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding5 extends StatefulWidget {
  const Onboarding5({Key? key}) : super(key: key);

  @override
  State<Onboarding5> createState() => _Onboarding5();
}

class _Onboarding5 extends State<Onboarding5> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          elevation: 0,
            automaticallyImplyLeading: false,
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
                      'Anotado! E se eu te disser que te ajudo com isso e mais um pouco aqui no app?',
                      style: TextStyles.headerTextWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        'Mas preciso da sua ajuda também. Posso contar com você se esforçando um pouquinho para chegar mais longe, mais depressa?',
                        style: TextStyles.paragraphMedium14White,
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
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 78.0),
               child: SizedBox(
                   width: MediaQuery.of(context).size.width,
                 child: CustomButton(
                              onClick: () async => await Navigator.pushNamed(context, '/login_1'),
                              text: 'Bora, Na.th!',
                              color: AppColors.white,
                              textColor: AppColors.darkBlue,
                   style: TextStyles.buttonTextMedium,
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