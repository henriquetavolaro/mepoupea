import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class GastoDetailListTile extends StatelessWidget {
  final String text;
  final String category;
  final String valor;
  final String detail;

  const GastoDetailListTile({
    Key? key,
    required this.text,
    required this.category,
    required this.valor,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColors.textGray,
      ),
      title: Text(
        text,
        style: TextStyles.textTermosLightBlack11,
      ),
      subtitle: RichText(
        text: TextSpan(
          text: 'Categoria ',
          style: TextStyles.paragraphSmall10Grey,
          children: <TextSpan>[
            TextSpan(
                text: category,
                style: TextStyles.paragraphSmall10GreyUnderline),
          ],
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            valor,
            style: TextStyles.textTermosLightBlack11,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              detail,
              style: TextStyles.paragraphSmall10Grey,
            ),
          )
        ],
      ),
    );
  }
}