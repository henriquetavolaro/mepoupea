import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class BackgroundBlueGradientContainer extends StatefulWidget {
  final Widget child;

  const BackgroundBlueGradientContainer({Key? key, required this.child}) : super(key: key);

  @override
  _BackgroundBlueGradientContainerState createState() => _BackgroundBlueGradientContainerState();
}

class _BackgroundBlueGradientContainerState extends State<BackgroundBlueGradientContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(25)),
          gradient: LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      child: widget.child,
    );
  }
}
