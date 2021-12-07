import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PrefiroAppPior extends StatelessWidget {
  const PrefiroAppPior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.orange
    ));
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
                  'Aqui estão as Inteligências Artificiais menos inteligentes que eu. \n\nBoa sorte. Você vai precisar.',
                  style: TextStyles.headerTextWhite,
                ),
              ],
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
            padding: EdgeInsets.symmetric(horizontal: 46),
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
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 66.0, top: 16),
                  child: InkWell(
                    onTap: () async =>
                        await Navigator.pushNamed(context, '/login_1'),
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
                        textAlign: TextAlign.center),
                  )),
            ),
          ),
        ],
    ),
        ),
      ),
    );
  }
}
