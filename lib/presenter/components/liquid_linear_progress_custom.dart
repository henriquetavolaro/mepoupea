import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class LiquidLinearProgressCustom extends StatelessWidget {
  const LiquidLinearProgressCustom({
    Key? key,
    required this.animationController,
    required this.color,
    required this.percentage,
  }) : super(key: key);

  final AnimationController animationController;
  final Color color;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LiquidLinearProgressIndicator(
      value: animationController.value * percentage,
      valueColor: AlwaysStoppedAnimation(color),
      direction: Axis.vertical,
      backgroundColor: AppColors.white,
      borderColor: Colors.transparent,
      borderWidth: 0,
      borderRadius: 20,
    );
  }
}
