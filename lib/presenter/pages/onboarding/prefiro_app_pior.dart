import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/app_bar_blue.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/ja_tem_uma_conta_bottom.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PrefiroAppPior extends StatelessWidget {
  const PrefiroAppPior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.orange));
    return Scaffold(
      appBar: AppBarBlue(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: BackgroundBlueGradientContainer(
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Text(
                    'Aqui estão as Inteligências Artificiais menos inteligentes que eu.',
                    style: TextStyles.headerTextWhite,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 24),
                    child: Text(
                      'Boa sorte. Você vai precisar.',
                      style: TextStyles.headerTextWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '> Guia bolso\n',
                      style: TextStyles.paragraphSmall12White,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '> Olivia\n',
                      style: TextStyles.paragraphSmall12White,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '> Wallet',
                      style: TextStyles.paragraphSmall12White,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 46),
                  child: CustomButton(
                      onClick: () async =>
                          await Navigator.pushNamed(context, '/onboarding_2'),
                      text: 'Mudei de ideia, bora de Na.th!',
                      color: AppColors.white,
                      textColor: AppColors.darkBlue,
                      style: TextStyles.buttonTextSemiBold),
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
