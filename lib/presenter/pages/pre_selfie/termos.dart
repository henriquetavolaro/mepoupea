import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Termos extends StatefulWidget {
  const Termos({Key? key}) : super(key: key);

  @override
  _TermosState createState() => _TermosState();
}

class _TermosState extends State<Termos> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 58.0, bottom: 112, left: 22, right: 22),
          child: Container(
            color: AppColors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 36, left: 28, right: 38, bottom: 42),
                    child: SingleChildScrollView(
                      child: Text(
                        'Termos de uso \n\nDIREITOS DOS TITULARES DE DADOS PESSOAIS \n\nNossa empresa se compromete a adotar medidas efetivas para a garantia dos direitos dos titulares de dados pessoais controlados, conforme especificados pela Lei Geral de Proteção de Dados Pessoais – LGPD, e demais leis e regulamentos brasileiros aplicáveis à proteção de dados pessoais. Garantimos o direito dos titulares e requisições das autoridades competentes com relação à proteção de dados pessoais dentro dos prazos legais. Para que os titulares de Dados Pessoais possam exercer seus direitos, fazer reclamações e solicitações, bem como enviar sugestões, nossa empresa disponibiliza um canal de contato com o Encarregado pelo Tratamento de Dados Pessoais. Você poderá, a qualquer momento, solicitar a exclusão da sua conta, encerrando seu relacionamento conosco, mas é importante lembrar que podemos ter obrigações legais e/ou regulatórias para mantermos seus dados aqui.',
                        style: TextStyles.textTermosBlack11,
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      activeColor: AppColors.greenInvesti,
                        value: isChecked,
                        shape: CircleBorder(),
                        onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Text(
                        'Concordo com os termos acima',
                        style: TextStyles.textTermosLightBlack11,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 94, right: 94, bottom: 24, top: 24),
                  child: CustomButton(
                    onClick: isChecked
                        ? () async => await Navigator.pushNamed(context, '/atualizando_selfie')
                        : () {},
                    text: 'Próximo',
                    color: isChecked ? AppColors.darkBlue : AppColors.textGray,
                    textColor: AppColors.white,
                    style: TextStyles.buttonTextMedium,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
