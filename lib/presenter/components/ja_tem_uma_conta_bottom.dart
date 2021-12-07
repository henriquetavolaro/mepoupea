
import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class JaTemUmaContaBottom extends StatelessWidget {
  final TextStyle style;
  final TextStyle styleUnderline;


  const JaTemUmaContaBottom({
    Key? key, required this.style, required this.styleUnderline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 66.0, top: 16),
        child: InkWell(
          onTap: () async =>
          await Navigator.pushNamed(context, '/login_1'),
          child: RichText(
              text: TextSpan(
                text: 'Já tem uma conta? ',
                style: style,
                children: <TextSpan>[
                  TextSpan(
                      text: 'Entrar',
                      style: styleUnderline)
                ],
              ),
              textAlign: TextAlign.center),
        ));
  }
}