import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class EscolhaDosBancos extends StatefulWidget {
  const EscolhaDosBancos({Key? key}) : super(key: key);

  @override
  _EscolhaDosBancosState createState() => _EscolhaDosBancosState();
}

class _EscolhaDosBancosState extends State<EscolhaDosBancos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: -300,
                left: -170,
                child: Image.asset('assets/elipse_background.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 46),
              child: Column(
                children: [
                  Text(
                    'Conta pra Na.th: Onde está o seu dinheiro?',
                    style: TextStyles.headerTextDarkBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'Cadastrando bancos, corretoras, cartões e financeiras, eu poderei ',
                        style: TextStyles.paragraphGreySmall11light,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'apenas visualizar ',
                              style: TextStyles.paragraphGreySmall11Medium),
                          TextSpan(
                              text: 'seus extratos e faturas.',
                              style: TextStyles.paragraphGreySmall11light),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Meu poder será só o de SUPER VISÃO! Transferências, saques, investimentos, pagamentos, pix e tudo mais estão NO SEU CONTROLE.',
                    style: TextStyles.paragraphGreySmall11light,
                  ),
                  const Expanded(
                    child: Text('Bradesco'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 106, right: 106, top: 60, bottom: 14),
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      onClick: () async => await Navigator.pushNamed(context, '/termos'),
                      text: 'Próximo',
                      color: AppColors.darkBlue,
                      textColor: AppColors.white,
                      style: TextStyles.buttonTextMedium,
                    ),
                  ),
                  Text(
                    'Conectar depois',
                    style: TextStyles.textUnderlineDarkBlueSmall9,
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
