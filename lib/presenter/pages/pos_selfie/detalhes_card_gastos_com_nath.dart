import 'package:coast/coast.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/me_poupe_baloon_exclamation.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class DetalheCardGastosComNath extends StatefulWidget {
  const DetalheCardGastosComNath({Key? key}) : super(key: key);

  @override
  _DetalheCardGastosComNathState createState() =>
      _DetalheCardGastosComNathState();
}

class _DetalheCardGastosComNathState extends State<DetalheCardGastosComNath> {
  final cards = [
    CardPaymentMethod(
        method: 'No cartão de crédito',
        valor: 'R\$ 5,90',
        numberCredit: '10',
        value: 1),
    CardPaymentMethod(method: 'PIX (à vista)', valor: 'R\$ 49,90', value: 2),
  ];
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.white),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.angleLeft,
                        color: AppColors.orange,
                        size: 28,
                      ),
                      Text(
                        'Gaste menos',
                        style: TextStyles.paragraphSmall13lightBlack,
                      ),
                      const FaIcon(
                        FontAwesomeIcons.angleLeft,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 42, right: 42, top: 32),
                      child: Card(
                        color: AppColors.loginBackground,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'Minha inteligência detectou que você está pagando ',
                              style: TextStyles.phoneNumberTextFieldSmall,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'R\$490 de anuidade ',
                                    style: TextStyles.buttonTextSemiBold),
                                TextSpan(
                                    text: 'no cartão Itaú. Podemos ',
                                    style:
                                        TextStyles.phoneNumberTextFieldSmall),
                                TextSpan(
                                    text: 'ZERAR ',
                                    style: TextStyles
                                        .paragraphSmall12BlackSemiBold),
                                TextSpan(
                                    text: 'este valor.',
                                    style:
                                        TextStyles.phoneNumberTextFieldSmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 35,
                      child: MePoupeBaloonExclamationMedium(),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42, left: 24, right: 24),
                  child: Crab(
                    tag: 'purple',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.purple,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 16, bottom: 20),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(unselectedWidgetColor: AppColors.white),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 16, right: 8),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: AppColors.white,
                                      size: 48,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 16, right: 70),
                                      child: Text(
                                        'Zere a anuidade do cartão Itaú com a Na.th',
                                        style: TextStyles
                                            .paragraphSmall12WhiteSemiBold,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 122, bottom: 12),
                                child: Text(
                                  'Sem precisar mais ligar e passar horas  negociando com o telemarketing! Já tá tudo negociado para você. É só clicar e economizar agora.',
                                  style: TextStyles.paragraphSmall9white,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.info,
                                  color: AppColors.white,
                                  size: 16,
                                ),
                              ),
                              ...cards
                                  .map(
                                    (e) => RadioListTile(
                                      onChanged: (int newValue) {
                                        setState(() {
                                          _value = newValue;
                                        });
                                      },
                                      groupValue: _value,
                                      cardPaymentMethod: e,
                                    ),
                                  )
                                  .toList(),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: CustomButton(
                                  onClick: () async => await Navigator.pushNamed(context, '/detalhes_card_distribuir_em_metas'),
                                  text: 'Eliminar gasto',
                                  color: _value != 0 ? AppColors.orange : AppColors.white.withOpacity(0.6),
                                  textColor: _value != 0 ? AppColors.white : AppColors.darkBlue,
                                  style: TextStyles.buttonTextSemiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    'Voltar',
                    style: TextStyles.textUnderlinedDarkBlue,
                  ),
                )
              ],
            ),
            Positioned(
              left: 12,
              top: 330,
              child: DelayedDisplay(
                delay: const Duration(seconds: 1),
                child: Card(
                  elevation: 4,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12, top: 12, right: 16, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Economia de\n',
                            style: TextStyles.paragraphSmall9darkBlue,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'R\$ ',
                                  style: TextStyles.textDarkBlue14SemiBold),
                              TextSpan(
                                  text: '490',
                                  style: TextStyles.textDarkBlueBig19SemiBold),
                              TextSpan(
                                  text: '/ano',
                                  style:
                                      TextStyles.textDarkBlueSmall11SemiBold),
                            ],
                          ),
                        ),
                        Text('(40,83/mês)',
                            style: TextStyles.paragraphSmall9darkBlue)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RadioListTile extends StatefulWidget {
  final CardPaymentMethod cardPaymentMethod;
  final int groupValue;
  final ValueChanged<int> onChanged;

  const RadioListTile(
      {Key? key,
      required this.cardPaymentMethod,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  _RadioListTileState createState() => _RadioListTileState();
}

class _RadioListTileState extends State<RadioListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.cardPaymentMethod.value != widget.groupValue) {
          widget.onChanged(widget.cardPaymentMethod.value);
        }
      },
      child: Card(
        color: widget.cardPaymentMethod.value == widget.groupValue ? AppColors.white : AppColors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(width: 1, color: AppColors.white),
        ),
        child: Row(
          children: [
            Radio<int>(
              groupValue: widget.groupValue,
              value: widget.cardPaymentMethod.value,
              onChanged: (int? newValue) {
                widget.onChanged(newValue!);
              },
              activeColor: AppColors.darkBlue,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cardPaymentMethod.method,
                      style: widget.cardPaymentMethod.value == widget.groupValue ? TextStyles.paragraphSmall9darkBlue : TextStyles.paragraphSmall9white,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.cardPaymentMethod.valor,
                          style: widget.cardPaymentMethod.value == widget.groupValue
                              ? TextStyles
                              .textSelfieCardMedium14MontserratDarkBlueSemiBold
                          : TextStyles
                              .textSelfieCardMedium14MontserratWhiteSemiBold,
                        ),
                        Visibility(
                          visible: widget.cardPaymentMethod.numberCredit != '0',
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.white, width: 1)),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Text(
                                      '${widget.cardPaymentMethod.numberCredit}x',
                                      style:  widget.cardPaymentMethod.value == widget.groupValue
                                      ? TextStyles.textValueSmall7MontserratDarkBlue
                                      :TextStyles
                                          .textValueSmall7MontserratWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardPaymentMethod {
  final String method;
  final String valor;
  String? numberCredit;
  int value;

  CardPaymentMethod({
    this.numberCredit = '0',
    required this.value,
    required this.method,
    required this.valor,
  });
}

class CardPaymentRow extends StatelessWidget {
  final CardPaymentMethod cardPaymentMethod;

  const CardPaymentRow({Key? key, required this.cardPaymentMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardPaymentMethod.method,
              style: TextStyles.paragraphSmall9white,
            ),
            Row(
              children: [
                Text(
                  cardPaymentMethod.valor,
                  style:
                      TextStyles.textSelfieCardMedium14MontserratWhiteSemiBold,
                ),
                Visibility(
                  visible: cardPaymentMethod.numberCredit != '0',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white, width: 1)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: FaIcon(
                              FontAwesomeIcons.angleDown,
                              size: 12,
                              color: AppColors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              '${cardPaymentMethod.numberCredit}x',
                              style: TextStyles.textValueSmall7MontserratWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
