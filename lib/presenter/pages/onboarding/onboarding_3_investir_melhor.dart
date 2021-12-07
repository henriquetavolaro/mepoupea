import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding3InvestirMelhor extends StatelessWidget {
  const Onboarding3InvestirMelhor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
          automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.orange),
      ),
      body: SafeArea(
        child: BackgroundBlueGradientContainer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 42, left: 22, right: 22),
                child: Column(
                  children: [
                    Text(
                      'Amei! Vou te ajudar a investir melhor, muito rápido!',
                      style: TextStyles.headerTextWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Text(
                        'Mas minha inteligência é limitada e por enquanto só consigo fazer você ganhar mais dinheiro, se você também fizer um esforcinho. \n\nQuer continuar mesmo assim?',
                        style: TextStyles.paragraphMedium14White,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 78, right: 78, bottom: 30),
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: CustomButton(
                    onClick: () async => await Navigator.pushNamed(context, '/login_1'),
                    text: 'Claro, Na.th!',
                    color: AppColors.white,
                    textColor: AppColors.darkBlue,
                    style: TextStyles.buttonTextSemiBold,
                  ),
                ),
              ),
              InkWell(
                onTap: () async => await Navigator.pushNamed(context, '/onboarding_4_hojenao'),
                child: Text(
                  'Hoje não, Na.th',
                  style: TextStyles.textUnderlineWhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
