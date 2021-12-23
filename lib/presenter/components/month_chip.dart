import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class MonthChip extends StatefulWidget {
  final List<String> monthList;
  final TextEditingController selectedMonth;

  const MonthChip({
    Key? key,
    required this.monthList,
    required this.selectedMonth,
  }) : super(key: key);

  @override
  _MonthChipState createState() => _MonthChipState();
}

class _MonthChipState extends State<MonthChip> {
  String selectedChoice = 'Out';

  _buildChoiceList() {
    List<Widget> months = [];
    for (var item in widget.monthList) {
      months.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: selectedChoice == item ? TextStyles.monthChipMedium14Underline : TextStyles.paragraphSmall12Grey,
          backgroundColor: AppColors.white,
          selectedColor: AppColors.white,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              widget.selectedMonth.text = selectedChoice;
            });
          },
        ),
      ));
    }
    return months;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
