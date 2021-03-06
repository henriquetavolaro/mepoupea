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
  final String title;
  bool editable;
  bool rocketVisibility;
  bool checkValue;

  BottomMinhasMetasRow({
    Key? key,
    this.editable = false,
    this.rocketVisibility = false,
    this.checkValue = false,
    required this.percent,
    required this.total,
    required this.prazo,
    required this.valorAtual,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 70.0, bottom: 8),
          child: Text(
            title,
            style: TextStyles.paragraphSmall11DarkBlue,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 8),
              child: image,
            ),
            Expanded(
              child: SizedBox(
                height: 44,
                child: Stack(
                  children: [
                    Card(
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
                          childRight: rocketVisibility
                              ? Image.asset('assets/rocket.png')
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset('assets/rocket.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                constraints: const BoxConstraints(minWidth: 65),
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
            ),
            Visibility(
              maintainSize: false,
              maintainAnimation: false,
              maintainState: true,
              visible: editable ? true : false,
              child: const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.edit_outlined,
                  size: 16,
                ),
              ),
            )
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
