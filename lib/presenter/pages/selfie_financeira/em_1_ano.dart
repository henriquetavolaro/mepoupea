import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/card_selfie_column.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Em1Ano extends StatelessWidget {

  final String sozinho;
  final String numeroDeCurtidasSozinho;
  final String dinheiroQueFizSozinho;
  final String gasteiSozinho;
  final String gasteiComDividasSozinho;
  final String investiSozinho;
  final String totalDeRiquezaSozinho;
  final Color backgroundColorSozinho;
  final double elevationSozinho;
  final TextStyle dinheiroQueFizR$StyleSozinho;
  final TextStyle dinheiroQueFizValorStyleSozinho;
  final String comNath;
  final String numeroDeCurtidasComNath;
  final String dinheiroQueFizComNath;
  final String gasteiComNath;
  final String gasteiComDividasComNath;
  final String investiComNath;
  final String totalDeRiquezaComNath;
  final Color backgroundColorComNath;
  final double elevationComNath;
  final TextStyle dinheiroQueFizR$StyleComNath;
  final TextStyle dinheiroQueFizValorStyleComNath;

  const Em1Ano({Key? key,
    required this.sozinho,
    required this.numeroDeCurtidasSozinho,
    required this.dinheiroQueFizSozinho,
    required this.gasteiSozinho,
    required this.gasteiComDividasSozinho,
    required this.investiSozinho,
    required this.totalDeRiquezaSozinho,
    required this.backgroundColorSozinho,
    required this.elevationSozinho,

    required this.comNath,
    required this.numeroDeCurtidasComNath,
    required this.dinheiroQueFizComNath,
    required this.gasteiComNath,
    required this.gasteiComDividasComNath,
    required this.investiComNath,
    required this.totalDeRiquezaComNath,
    required this.backgroundColorComNath,
    required this.elevationComNath,
    required this.dinheiroQueFizR$StyleSozinho,
    required this.dinheiroQueFizValorStyleSozinho,
    required this.dinheiroQueFizR$StyleComNath,
    required this.dinheiroQueFizValorStyleComNath,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 16, bottom: 32),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardSelfieColumn(
                    elevation: elevationSozinho,
                    backgroundColor: backgroundColorSozinho,
                    sozinhoOuComNath: sozinho,
                    numeroDeCurtidas: numeroDeCurtidasSozinho,
                    dinheiroQueFiz: dinheiroQueFizSozinho,
                    gastei: gasteiSozinho,
                    gasteiComDividas: gasteiComDividasSozinho,
                    investi: investiSozinho,
                    totalDeRiqueza: totalDeRiquezaSozinho,
                    dinheiroQueFizR$Style: dinheiroQueFizR$StyleSozinho,
                    dinheiroQueFizValorStyle: dinheiroQueFizValorStyleSozinho,
                  ),
                  CardSelfieColumn(
                    elevation: elevationComNath,
                    backgroundColor: backgroundColorComNath,
                    sozinhoOuComNath: comNath,
                    numeroDeCurtidas: numeroDeCurtidasComNath,
                    dinheiroQueFiz: dinheiroQueFizComNath,
                    gastei: gasteiComNath,
                    gasteiComDividas: gasteiComDividasComNath,
                    investi: investiComNath,
                    totalDeRiqueza: totalDeRiquezaComNath,
                    dinheiroQueFizR$Style: dinheiroQueFizR$StyleComNath,
                    dinheiroQueFizValorStyle: dinheiroQueFizValorStyleComNath,),
                ],
              ),
            ),
          ),
          CustomButtonStroke(
            onClick: () async => await Navigator.pushNamed(context, '/home_pos_selfie'),
            text: 'Voltar à realidade',
            color: AppColors.white,
            textColor: AppColors.darkBlue,
            style: TextStyles.buttonTextMedium,
            borderSide: const BorderSide(color: AppColors.darkBlue, width: 1),
          )
        ],
      ),
    );
  }
}
