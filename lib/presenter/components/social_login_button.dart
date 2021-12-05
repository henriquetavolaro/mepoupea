import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class SocialLoginButton extends StatefulWidget {
  final double paddingRight;
  final double paddingLeft;
  final double iconPaddingRight;
  final Widget icon;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onClick;

  const SocialLoginButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.textColor,
      required this.onClick,
      required this.iconPaddingRight,
      required this.paddingRight,
      required this.paddingLeft})
      : super(key: key);

  @override
  _SocialLoginButtonState createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight),
        child: ElevatedButton.icon(
          onPressed: widget.onClick,
          icon: Padding(
            padding: EdgeInsets.only(
                top: 12.0, bottom: 12, right: widget.iconPaddingRight),
            child: widget.icon,
          ),
          label: Text(
            widget.text,
            maxLines: 1,
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            primary: widget.color,
            onPrimary: widget.textColor,
            textStyle: TextStyles.buttonTextMedium,
          ),
        ),
      ),
    );
  }
}
