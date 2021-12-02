import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class SocialLoginButton extends StatefulWidget {
  final double paddingLeft;
  final double paddingRight;
  final Widget icon;
  final String text;
  final Color color;
  final Color textColor;

  const SocialLoginButton(
      {Key? key, required this.paddingLeft, required this.paddingRight, required this.icon, required this.text,
        required this.color,
        required this.textColor})
      : super(key: key);

  @override
  _SocialLoginButtonState createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: widget.paddingLeft, right: widget.paddingRight),
        child: SizedBox(
          height: 46,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: widget.icon,
            label: Text(
                widget.text,
            maxLines: 1,),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              primary: widget.color,
              onPrimary: widget.textColor,
              textStyle: TextStyles.buttonTextWhiteMedium,),
          ),
        ),
      ),
    );
  }
}
