import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'custom_paint_bike.dart';

class BottomMinhasMetasRow extends StatelessWidget {

  final double percent;
  final String total;
  final String prazo;
  final String valorAtual;
  final Image image;

  const BottomMinhasMetasRow({
    Key? key,
    required this.percent,
    required this.total,
    required this.prazo,
    required this.valorAtual,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 40;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 8),
              child: image,
            ),
            Expanded(
              child: SizedBox(
                height: 44,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                          width: 1, color: AppColors.darkBlue)),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: RoundedProgressBar(
                      height: 30,
                      style: RoundedProgressBarStyle(
                          borderWidth: 0,
                          colorProgress: AppColors.darkBlue,
                          backgroundProgress: AppColors.gasteiBackground,
                          widthShadow: 0),
                      borderRadius: BorderRadius.circular(25),
                      percent: percent > 15 ? percent : 15,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      total,
                      style: TextStyles.textSmall11MontserratGreySemiBold,
                    ),
                  ),
                  Text(
                    prazo,
                    style: TextStyles.paragraphSmall9darkGrey,
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, top: 4),
          child: Text(
            valorAtual,
            style: TextStyles.textSelfieSmall9MontserratDarkBlueMedium,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Divider(
            thickness: 1,
            color: AppColors.textLightGray,
          ),
        )
      ],
    );
  }
}