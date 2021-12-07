import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

import 'custom_button.dart';

class ButtonClaroNath extends StatelessWidget {
  const ButtonClaroNath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 78, right: 78, bottom: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          onClick: () async => await Navigator.pushNamed(context, '/login_1'),
          text: 'Claro, Na.th!',
          color: AppColors.white,
          textColor: AppColors.darkBlue,
          style: TextStyles.buttonTextSemiBold,
        ),
      ),
    );
  }
}