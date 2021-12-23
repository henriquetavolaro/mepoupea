import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class BankChip extends StatefulWidget {
  final List<String> bankList;
  final TextEditingController selectedBank;

  const BankChip({
    Key? key,
    required this.bankList,
    required this.selectedBank,
  }) : super(key: key);

  @override
  _BankChipState createState() => _BankChipState();
}

class _BankChipState extends State<BankChip> {
  String selectedChoice = 'Todos os bancos';

  _buildChoiceList() {
    List<Widget> currencies = [];
    for (var item in widget.bankList) {
      currencies.add(Container(
        padding: const EdgeInsets.only(right: 16.0),
        child: ChoiceChip(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 4,
          label: Text(item),
          labelStyle: selectedChoice == item
              ? TextStyles.textWhiteSmall11Medium
              : TextStyles.textDarkBlueSmall11Medium,
          backgroundColor: AppColors.white,
          selectedColor: AppColors.darkBlue,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.selectedBank.text = selectedChoice;
            });
          },
        ),
      ));
    }
    return currencies;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
