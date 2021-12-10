import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CardSelfie extends StatelessWidget {
  final String text;
  final String value;
  final TextStyle styleR$;
  final TextStyle styleValue;

  const CardSelfie({
    Key? key,
    required this.text,
    required this.value,
    required this.styleR$,
    required this.styleValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 14, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyles.paragraphSmall12Black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: RichText(
                  text: TextSpan(
                    text: 'R\$ ',
                    style: styleR$,
                    children: <TextSpan>[
                      TextSpan(
                          text: value,
                          style: styleValue
                          ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
