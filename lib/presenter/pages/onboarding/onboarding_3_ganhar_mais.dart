import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/app_bar_blue.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/button_claro_nath.dart';
import 'package:mepoupeapp/presenter/components/button_hoje_nao.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding3GanharMais extends StatelessWidget {
  const Onboarding3GanharMais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBlue(appBar: AppBar(),),
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
                        'Amei! Vou te ajudar a ganhar mais, muito rápido!',
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
                ButtonClaroNath(),
                ButtonHojeNao()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



