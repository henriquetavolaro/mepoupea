import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CustomButtonIcon extends StatefulWidget {
  final VoidCallback onClick;
  final String text;
  final Color color;
  final Color textColor;
  final Icon icon;

  const CustomButtonIcon(
      {Key? key,
      required this.onClick,
      required this.text,
      required this.color,
      required this.textColor,
      required this.icon})
      : super(key: key);

  @override
  _CustomButtonIconState createState() => _CustomButtonIconState();
}

class _CustomButtonIconState extends State<CustomButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: widget.icon,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  widget.text,
                  maxLines: 1,
                ),
              ),
            ),
          ],
      ),
      onPressed: widget.onClick,

      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        primary: widget.color,
        onPrimary: widget.textColor,
        textStyle: TextStyles.buttonTextMedium,

      ),

    );
  }
}
