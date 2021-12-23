import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';


class ChoiceChipWidget extends StatefulWidget {
  final List<String> currencyList;
  final TextEditingController selectedCurrency;


  ChoiceChipWidget({required this.currencyList, required this.selectedCurrency});

  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String selectedChoice = 'R\$';

  _buildChoiceList() {
    List<Widget> currencies = [];
    for (var item in widget.currencyList) {
      currencies.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: selectedChoice == item ? TextStyles.paragraphSmall12White : TextStyles.paragraphSmall12DarkBlue,
          backgroundColor: AppColors.white,
          selectedColor: AppColors.darkBlue,
          selected: selectedChoice == item,
          side: const BorderSide(
            color: AppColors.darkBlue,
            width: 1
          ),
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.selectedCurrency.text = selectedChoice;
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
