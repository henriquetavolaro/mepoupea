import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mepoupeapp/presenter/components/bank_chip.dart';
import 'package:mepoupeapp/presenter/components/card_gasto_category_exclamation.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/presenter/components/gasto_column.dart';
import 'package:mepoupeapp/presenter/components/gasto_detail_list_tile.dart';
import 'package:mepoupeapp/presenter/components/me_poupe_baloon_exclamation.dart';
import 'package:mepoupeapp/presenter/components/month_chip.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';
import 'package:grouped_list/grouped_list.dart';

class GastosDetalhes1 extends StatefulWidget {
  const GastosDetalhes1({Key? key}) : super(key: key);

  @override
  _GastosDetalhes1State createState() => _GastosDetalhes1State();
}

class _GastosDetalhes1State extends State<GastosDetalhes1> {
  final TextEditingController selectedMonth = TextEditingController();
  List<String> monthList = [
    'Mar',
    'Abr',
    'Mai',
    'Jun',
    'Jul',
    'Ago',
    'Set',
    'Out'
  ];

  List<GastoColumn> gastosList = [
    const GastoColumn(
      total: '1.780',
      height: 175,
      color: AppColors.darkBlue,
      text: 'Moradia',
      percent: '23',
      icon: Icons.home,
    ),
    const GastoColumn(
      total: '670',
      height: 670 * 175 / 1780,
      color: AppColors.yellow,
      text: 'Comida',
      percent: '7',
      icon: Icons.dinner_dining_outlined,
    ),
    const GastoColumn(
      total: '978',
      height: 978 * 175 / 1780,
      color: AppColors.orange,
      text: 'Transporte',
      percent: '10',
      icon: Icons.directions_car_filled_rounded,
    ),
    const GastoColumn(
      total: '713',
      height: 713 * 175 / 1780,
      color: AppColors.redGastei,
      text: 'Viagem',
      percent: '9',
      icon: Icons.beach_access,
    ),
    const GastoColumn(
      total: '377',
      height: 377 * 175 / 1780,
      color: AppColors.textLightBlack,
      text: 'Saúde',
      percent: '5',
      icon: Icons.favorite,
    ),
    const GastoColumn(
      total: '978',
      height: 978 * 175 / 1780,
      color: AppColors.purple,
      text: 'Cat A',
      percent: '10',
      icon: Icons.directions_car_filled_rounded,
    ),
  ];

  final TextEditingController selectedBank = TextEditingController();
  List<String> bankList = [
    'Todos os bancos',
    'Itaú',
    'Nubank',
    'Bradesco',
    "Banco do Brasil"
  ];

  final gastos = [
    {
      'text': 'Restaurante da esquina',
      'category': 'Comida',
      'valor': "-R\$ 32.90",
      'detail': "Crédito (Final 5006)",
      'date': '22/12/2021'
    },
    {
      'text': 'Magalu',
      'category': 'Compras',
      'valor': "-R\$ 332.90",
      'detail': "PIX conta Itaú",
      'date': '21/12/2021'
    },
    {
      'text': 'Magalu',
      'category': 'Compras',
      'valor': "-R\$ 332.90",
      'detail': "PIX conta Itaú",
      'date': '21/12/2021'
    },
    {
      'text': 'Magalu',
      'category': 'Compras',
      'valor': "-R\$ 332.90",
      'detail': "PIX conta Itaú",
      'date': '21/12/2021'
    }
  ];
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var yesterday = DateTime.now().subtract(Duration(days: 1));
    var formatter = DateFormat('dd/MM/yyyy');
    String formattedNow = formatter.format(now);
    String formattedYesterday = formatter.format(yesterday);

    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.white),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const FaIcon(
                                FontAwesomeIcons.angleLeft,
                                color: AppColors.purple,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(
                                'Onde Gastei?',
                                style: TextStyles
                                    .paragraphMedium16LightBlackSemiBold,
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: '- R\$ ',
                            style: TextStyles
                                .textSelfieSmall12MontserratLightRedSemiBold,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '6.795,95',
                                  style: TextStyles
                                      .textSelfieMedium16MontserratLightRedSemiBold),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: MonthChip(
                        monthList: monthList,
                        selectedMonth: selectedMonth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Você ainda tem R\$ 287,20 de verba este mês',
                        style: TextStyles.paragraphSmall12BlackMedium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          for (var item in gastosList)
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategory = item.text;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                                color: AppColors.white,
                                elevation:
                                    selectedCategory == item.text ? 4 : 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 12, right: 16, left: 16),
                                  child: GastoColumn(
                                    total: item.total,
                                    height: item.height,
                                    color: item.color,
                                    text: item.text,
                                    percent: item.percent,
                                    icon: item.icon,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: selectedCategory.isNotEmpty,
                    child: CardGastoCategoryExclamation(
                      onClick: () async => await Navigator.pushNamed(
                          context, '/gastos_detalhes_categoria'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 24, left: 24, top: 24, bottom: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomButtonStroke(
                        onClick: () {},
                        text: 'Na.th, me ajuda a reduzir meus gastos!',
                        color: AppColors.white,
                        textColor: AppColors.darkBlue,
                        style: TextStyles.buttonTextMedium,
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.darkBlue),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: Text(
                      'Quero reduzir manualmente',
                      style: TextStyles.textUnderlinedDark11Blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Como tô gastando?',
                        style: TextStyles.paragraphMedium16BlackBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'Exibir:',
                              style: TextStyles.paragraphSmall9lightBlack,
                            ),
                          ),
                          Row(
                            children: [
                              BankChip(
                                bankList: bankList,
                                selectedBank: selectedBank,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Registrei um total de 48 transações! Dá só uma olhada:',
                        style: TextStyles.paragraphSmall9lightBlack,
                      ),
                    ),
                  ),
                  GroupedListView<dynamic, String>(
                    shrinkWrap: true,
                    elements: gastos,
                    groupBy: (element) => element['date'],
                    groupSeparatorBuilder: (String groupByValue) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, bottom: 20, top: 24),
                          child: groupByValue == formattedNow
                              ? Text(
                                  'Hoje',
                                  style: TextStyles.textTermosLightBlack11,
                                )
                              : groupByValue == formattedYesterday
                                  ? Text(
                                      'Ontem $groupByValue',
                                      style: TextStyles.textTermosLightBlack11,
                                    )
                                  : Text(
                                      groupByValue,
                                      style: TextStyles.textTermosLightBlack11,
                                    ),
                        ),
                      );
                    },
                    itemBuilder: (context, dynamic item) {
                      return GastoDetailListTile(
                        valor: item['valor'],
                        category: item['category'],
                        detail: item['detail'],
                        text: item['text'],
                      );
                    },
                    itemComparator: (item1, item2) =>
                        item1['text'].compareTo(item2['text']),
                    // optional
                    useStickyGroupSeparators: true,
                    // optional
                    floatingHeader: true,
                    // optional
                    order: GroupedListOrder.DESC, // optional
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
