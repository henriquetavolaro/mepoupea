import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class IconPasswordVisibility extends StatefulWidget {
  final VoidCallback passwordVisible;
  final IconData icon;

  const IconPasswordVisibility({Key? key, required this.passwordVisible, required this.icon}) : super(key: key);

  @override
  State<IconPasswordVisibility> createState() => _IconPasswordVisibilityState();
}

class _IconPasswordVisibilityState extends State<IconPasswordVisibility> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
        onPressed: widget.passwordVisible,
        icon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Icon(
            widget.icon,
            color: AppColors.textGray,),
        ), );
  }
}
