import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class ButtonHojeNao extends StatelessWidget {
  const ButtonHojeNao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await Navigator.pushNamed(context, '/onboarding_4_hojenao'),
      child: Text(
        'Hoje não, Na.th',
        style: TextStyles.textUnderlineWhite,
      ),
    );
  }
}
