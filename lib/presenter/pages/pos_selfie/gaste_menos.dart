import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/recommendation_card_gaste_menos.dart';
import 'package:mepoupeapp/presenter/components/rectangular_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class GasteMenos extends StatefulWidget {
  final VoidCallback showMeusEnvelopes;
  final VoidCallback showMinhasMetas;

  const GasteMenos({Key? key, required this.showMeusEnvelopes, required this.showMinhasMetas}) : super(key: key);

  @override
  _GasteMenosState createState() => _GasteMenosState();
}

class _GasteMenosState extends State<GasteMenos> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 20),
            child: Text(
              'Olha o que eu achei pra você!',
              style: TextStyles.paragraphMedium16BlackBold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    RecommendationCardGasteMenos(
                      elimineEconomize: 'Elimine',
                      valor: '490',
                      valorMes: '40,83',
                      descricao: 'Zerando a anuidade do seu cartão de crédito',
                    ),
                    RecommendationCardGasteMenos(
                      elimineEconomize: 'Economize',
                      valor: '300',
                      valorMes: '30,00',
                      descricao: 'Eliminando as tarifas bancárias',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: RectangularButton(
                      text: 'Minhas metas',
                      onClick: () => widget.showMinhasMetas(),
                      textColor: AppColors.textLightBlack,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: RectangularButton(
                      text: 'Meus envelopes',
                      onClick: () => widget.showMeusEnvelopes(),
                      textColor: AppColors.textLightBlack,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
