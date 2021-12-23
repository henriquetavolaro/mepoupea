
import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class GastoColumn extends StatelessWidget {
  final String total;
  final double height;
  final Color color;
  final String text;
  final String percent;
  final IconData icon;

  const GastoColumn({
    Key? key,
    required this.total,
    required this.height,
    required this.color,
    required this.text,
    required this.percent,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'R\$ $total',
          style: TextStyles.paragraphSmall12BlackMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 12),
          child: Container(
              width: 10,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: color)),
        ),
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          child: Text(
            text,
            style: TextStyles.paragraphSmall10Grey,
          ),
        ),
        Text(
          '$percent%',
          style: TextStyles.paragraphSmall10LightBlack,
        )
      ],
    );
  }
}
