import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/money_chip.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class ContaManual extends StatefulWidget {
  const ContaManual({Key? key}) : super(key: key);

  @override
  _ContaManualState createState() => _ContaManualState();
}

class _ContaManualState extends State<ContaManual> {
  final nameController = TextEditingController();
  final saldoController = TextEditingController();
  final TextEditingController selectedCurrency = TextEditingController();
  List<String> currencies = ['R\$', 'US\$'];
  List<String> accountTypes = ['Corrente', 'Poupança', 'Investimento'];
  String dropdownValue = 'Corrente';



  @override
  void dispose() {
    nameController.dispose();
    saldoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectedCurrency.text = 'R\$';
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 46, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nova conta manual',
                    style: TextStyles.headerTextBlue,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 8),
                    child: Text(
                      'Nome da conta',
                      style: TextStyles.paragraphSmall9lightBlack,
                    ),
                  ),
                  TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                          // fillColor: AppColors.white,
                          // filled: true,
                          border: OutlineInputBorder(
                            // borderSide: BorderSide.,
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Ex.: Reserva financeira")),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Tipo da conta',
                      style: TextStyles.paragraphSmall9lightBlack,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(

                      border: Border.all(
                        color: AppColors.textGray
                      ),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValue,
                          isExpanded: true,
                          onChanged: (String? newValue){
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: accountTypes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value));
                                  },
                          ).toList(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Saldo atual',
                      style: TextStyles.paragraphSmall9lightBlack,
                    ),
                  ),
                  TextField(
                    inputFormatters: [CurrencyTextInputFormatter(
                      locale: 'br',
                      symbol: ''
                    )],
                    controller: saldoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 24),
                        // fillColor: AppColors.white,
                        // filled: true,
                        border: OutlineInputBorder(
                          // borderSide: BorderSide.,
                            borderRadius: BorderRadius.circular(25)),
                        hintText: selectedCurrency.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 52),
                    child: ChoiceChipWidget(
                      currencyList: currencies,
                      selectedCurrency: selectedCurrency,
                      ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      thickness: 1,
                      color: AppColors.textGray,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 42, right: 42, top: 48, bottom: 24),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: CustomButton(
                      onClick: () {
                        print('SELECTED ${dropdownValue}');
                      },
                      text: 'Criar conta manual',
                      color: AppColors.orange,
                      textColor: AppColors.white,
                      style: TextStyles.buttonTextMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 76.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async => await Navigator.pushNamed(context, '/como_prefere_conectar'),
                        child: Text(
                          'Conectar minhas contas automaticamente',
                          style: TextStyles.textUnderlineDarkBlueSmall9,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
