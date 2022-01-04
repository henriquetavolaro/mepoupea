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

  final banks = [
    BankCheckBox(name: 'Bradesco', image: Image.asset('assets/bradesco.png')),
    BankCheckBox(name: 'Itaú', image: Image.asset('assets/itau.png')),
    BankCheckBox(name: 'Santander', image: Image.asset('assets/santander.png')),
    BankCheckBox(name: 'Caixa', image: Image.asset('assets/caixa.png')),
    BankCheckBox(name: 'Nubank', image: Image.asset('assets/nubank.png')),
    BankCheckBox(name: 'Banco do Brasil', image: Image.asset('assets/bb.png')),
    BankCheckBox(name: 'Banco Inter', image: Image.asset('assets/inter.png')),
  ];

  Map<String, bool> List = {
    'Egges': false,
    'Chocolates': false,
    'Flour': false,
    'Fllower': false,
    'Fruits': false,
  };

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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...banks.map(buildCheckboxListTile).toList()
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 106, right: 106, top: 60, bottom: 14),
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      onClick: () async =>
                          await Navigator.pushNamed(context, '/termos'),
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

  Card buildCheckboxListTile(BankCheckBox bankCheckBox) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 4,
      child: Theme(
        data: ThemeData(
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: bankCheckBox.value,
          title: Row(
            children: [
              bankCheckBox.image,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(bankCheckBox.name),
              ),
            ],
          ),
          onChanged: (bool? value) => setState(
                () {
              bankCheckBox.value = value!;
            },
          ),
        ),
      ),
    );
  }
}

class BankCheckBox {
  final String name;
  final Image image;
  bool value;

  BankCheckBox({required this.name, required this.image, this.value = false});
}
