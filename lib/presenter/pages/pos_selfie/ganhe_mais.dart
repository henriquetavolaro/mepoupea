import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/recommendation_card_ganhe_mais.dart';
import 'package:mepoupeapp/presenter/components/rectangular_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class GanheMais extends StatefulWidget {
  final VoidCallback showMeusEnvelopes;
  final VoidCallback showMinhasMetas;

  const GanheMais({Key? key, required this.showMeusEnvelopes, required this.showMinhasMetas}) : super(key: key);

  @override
  _GanheMaisState createState() => _GanheMaisState();
}

class _GanheMaisState extends State<GanheMais> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    RecommendationCardGanheMais(
                      ganhe: 'Ganhe',
                      valor: '400',
                      descricao: 'Desapegue do que não te faz falta! Tem uma renda extra te esperando aqui',
                    ),
                    RecommendationCardGanheMais(
                      ganhe: 'Ganhe até',
                      valor: '100',
                      descricao: 'Você sempre deu opinião de graça, agora vai ganhar por ela! GANHE dinheiro respondendo pesquisas sem sair de casa :D',
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
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
      ),
    );
  }
}
