import 'package:flutter/material.dart';

class CustomButtonStroke extends StatefulWidget {
  final VoidCallback onClick;
  final String text;
  final Color color;
  final Color textColor;
  final TextStyle style;
  final BorderSide borderSide;
  VisualDensity? visualDensity;

  CustomButtonStroke(
      {Key? key,
      this.visualDensity = VisualDensity.standard,
      required this.onClick,
      required this.text,
      required this.color,
      required this.textColor,
      required this.style,
      required this.borderSide})
      : super(key: key);

  @override
  _CustomButtonStrokeState createState() => _CustomButtonStrokeState();
}

class _CustomButtonStrokeState extends State<CustomButtonStroke> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick,
      child: Text(
        widget.text,
        maxLines: 1,
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
       visualDensity: widget.visualDensity,
        side: widget.borderSide,
        primary: widget.color,
        onPrimary: widget.textColor,
        textStyle: widget.style,
      ),
    );
  }
}
