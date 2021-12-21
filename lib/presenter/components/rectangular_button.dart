import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class RectangularButton extends StatefulWidget {
  final Color textColor;
  final Color color;
  final String text;
  final VoidCallback onClick;

  const RectangularButton({
    Key? key,
    required this.textColor,
    required this.color,
    required this.text,
    required this.onClick,})
      : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<RectangularButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick,
      child: Text(
        widget.text,
        maxLines: 1,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        side: const BorderSide(
            width: 1,
            color: AppColors.orange
        ),
        primary: widget.color,
        onPrimary: widget.textColor,
        textStyle: TextStyles.paragraphMedium16BlackBold,
      ),
    );
  }
}
