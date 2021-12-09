import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onClick;
  final String text;
  final Color color;
  final Color textColor;
  final TextStyle style;
  final VisualDensity? visualDensity;

  const CustomButton({
    Key? key,
    required this.onClick,
    required this.text,
    required this.color,
    required this.textColor,
    required this.style,
    this.visualDensity,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick,
      child: Text(
        widget.text,
        maxLines: 1,
      ),
      style: ElevatedButton.styleFrom(
        visualDensity: widget.visualDensity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        primary: widget.color,
        onPrimary: widget.textColor,
        textStyle: widget.style,
      ),
    );
  }
}
