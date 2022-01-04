import 'package:coast/coast.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/me_poupe_baloon_exclamation.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class DetalheCardGastos extends StatefulWidget {
  const DetalheCardGastos({Key? key}) : super(key: key);

  @override
  _DetalheCardGastosState createState() => _DetalheCardGastosState();
}

class _DetalheCardGastosState extends State<DetalheCardGastos> {
  final beaches = [
    Beach(builder: (context) => LeftScreen()),
    Beach(builder: (context) => const MiddleScreen()),
    Beach(builder: (context) => const RightScreen()),

  ];

  final _coastController = CoastController(initialPage: 1);

  @override
  void dispose() {
    _coastController.dispose();
    super.dispose();
  }

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
        child: Column(
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
                  padding: const EdgeInsets.only(left: 42, right: 42, top: 32),
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
                                style: TextStyles.phoneNumberTextFieldSmall),
                            TextSpan(
                                text: 'ZERAR ',
                                style:
                                    TextStyles.paragraphSmall12BlackSemiBold),
                            TextSpan(
                                text: 'este valor.',
                                style: TextStyles.phoneNumberTextFieldSmall),
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
            Expanded(
              child: Coast(
                beaches: beaches,
                controller: _coastController,
                observers: [
                  CrabController(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftScreen extends StatefulWidget {
  LeftScreen({Key? key}) : super(key: key);

  @override
  State<LeftScreen> createState() => _LeftScreenState();
}

class _LeftScreenState extends State<LeftScreen> {
  var selectedFlag = '1';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Crab(
                      tag: 'purple',
                      child: Container(
                        width: 260,
                        height: 400,
                        color: AppColors.purple,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, top: 16, right: 8),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: AppColors.darkBlue,
                                    size: 48,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 16),
                                    child: Text(
                                      'Zere a anuidade do cartão de crédito com a Na.th',
                                      style: TextStyles
                                          .paragraphSmall12DarkBlueSemiBold,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Divider(
                                thickness: 1,
                                color: AppColors.darkBlue,
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: selectedFlag == '1' ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Visibility(
                                visible: selectedFlag == '1',
                                maintainSize: false,
                                maintainState: true,
                                maintainAnimation: true,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, bottom: 12),
                                  child: Text(
                                    'Já temos tudo negociado com o Itaú. Assim que escolher a forma de pagamento, em 1 minuto seu cartão não terá mais anuidade.',
                                    style: TextStyles.paragraphSmall9white,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Transform.translate(
                                offset: const Offset(5, 0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedFlag = '1';
                                    });
                                  },
                                  child: FlagCardGastosLeft(
                                    icon: Icon(
                                      Icons.access_time,
                                      color: selectedFlag == '1'
                                          ? AppColors.darkBlue
                                          : AppColors.white,
                                    ),
                                    italicText: 'Em:',
                                    text: '1 minuto',
                                    backgroundColor: selectedFlag == '1'
                                        ? AppColors.white.withOpacity(0.8)
                                        : AppColors.purple,
                                    italicTextStyle: selectedFlag == '1'
                                        ? TextStyles
                                            .paragraphSmall9darkBlueItalic
                                        : TextStyles.paragraphSmall9whiteItalic,
                                    textStyle: selectedFlag == '1'
                                        ? TextStyles
                                            .paragraphSmall12DarkBlueSemiBold
                                        : TextStyles
                                            .paragraphSmall12WhiteSemiBold,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Transform.translate(
                                offset: const Offset(5, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedFlag = '2';
                                      });
                                    },
                                    child: FlagCardGastosLeft(
                                      icon: Icon(
                                        Icons.attach_money,
                                        color: selectedFlag == '2'
                                            ? AppColors.darkBlue
                                            : AppColors.white,
                                      ),
                                      italicText: 'Por:',
                                      text: 'R\$ 49,90',
                                      backgroundColor: selectedFlag == '2'
                                          ? AppColors.white.withOpacity(0.8)
                                          : AppColors.purple,
                                      italicTextStyle: selectedFlag == '2'
                                          ? TextStyles
                                              .paragraphSmall9darkBlueItalic
                                          : TextStyles
                                              .paragraphSmall9whiteItalic,
                                      textStyle: selectedFlag == '2'
                                          ? TextStyles
                                              .paragraphSmall12DarkBlueSemiBold
                                          : TextStyles
                                              .paragraphSmall12WhiteSemiBold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: selectedFlag == '2' ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Visibility(
                                visible: selectedFlag == '2',
                                maintainSize: false,
                                maintainState: true,
                                maintainAnimation: true,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, bottom: selectedFlag == '2' ? 0 : 12, top: selectedFlag == '2' ? 12 : 0),
                                  child: Text(
                                    'Este é o preço do esforço Na.th pra liberar 3 horas de telemarketing e você não precisar se estressar reduzindo suas tarifas.',
                                    style: TextStyles.paragraphSmall9white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CustomButton(
                                  onClick: () async => await Navigator.pushNamed(context, '/detalhes_card_gastos_com_nath'),
                                  text: 'Na.th, faz pra mim!',
                                  color: AppColors.white,
                                  textColor: AppColors.darkBlue,
                                  style: TextStyles.buttonTextMedium),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 16, left: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.lightbulb_outline,
                                      color: AppColors.white,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '87% já escolheram reduzir a anuidade com a Na.th.',
                                        style: TextStyles.paragraphSmall9white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Crab(
                      tag: 'orange',
                      child: Stack(
                        children: [
                          Container(
                            height: 400,
                            color: AppColors.lightOrange,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 96, bottom: 16, left: 16),
                                      child: Text(
                                        'Fazendo \nsozinha:',
                                        style: TextStyles
                                            .paragraphSmall12LightBlack,
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Em:',
                                            style: TextStyles
                                                .paragraphSmall9blackItalic,
                                          ),
                                          Text(
                                            '3 horas',
                                            style: TextStyles
                                                .paragraphSmall12BlackSemiBold,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Por:',
                                            style: TextStyles
                                                .paragraphSmall9blackItalic,
                                          ),
                                          Text(
                                            'R\$ 115,00',
                                            style: TextStyles
                                                .paragraphSmall12BlackSemiBold,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, bottom: 12),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/image.png'),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          'Arraste',
                                          style:
                                              TextStyles.paragraphSmall9white,
                                          overflow: TextOverflow.fade,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 400,
                            color: AppColors.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Crab(
                tag: 'bottom_row',
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 24,
                        color: AppColors.purple,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: GradientIcon(
                            icon: Icons.circle,
                            size: 16,
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppColors.purple,
                                AppColors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          )),
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: AppColors.orange,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 12,
          top: selectedFlag == '1' ? 220 : 160,
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
                              style: TextStyles.textDarkBlueSmall11SemiBold),
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
    );
  }
}

class RightScreen extends StatefulWidget {
  const RightScreen({Key? key}) : super(key: key);

  @override
  State<RightScreen> createState() => _RightScreenState();
}

class _RightScreenState extends State<RightScreen> {
  var selectedFlag = '1';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Crab(
                      tag: 'purple',
                      child: Stack(
                        children: [
                          Container(
                            height: 400,
                            color: AppColors.purple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 96, bottom: 16, right: 16),
                                      child: Text(
                                        'Na.th fazendo\npra mim:',
                                        style: TextStyles
                                            .paragraphSmall12White,
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Em:',
                                            style: TextStyles
                                                .paragraphSmall9whiteItalic,
                                          ),
                                          Text(
                                            '1 minuto',
                                            style: TextStyles
                                                .paragraphSmall12WhiteSemiBold,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 24),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Por:',
                                            style: TextStyles
                                                .paragraphSmall9whiteItalic,
                                          ),
                                          Text(
                                            'R\$ 49,90',
                                            style: TextStyles
                                                .paragraphSmall12WhiteSemiBold,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, bottom: 12),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'para detalhes',
                                      style:
                                      TextStyles.paragraphSmall9white,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                )



                              ],
                            )
                          ),
                          Container(
                            height: 400,
                            color: AppColors.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Crab(
                      tag: 'orange',
                      child: Container(
                        width: 260,
                        height: 400,
                        color: AppColors.lightOrange,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, top: 16, right: 8),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: AppColors.brown,
                                    size: 48,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 16),
                                    child: Text(
                                      'Zere a anuidade do cartão de crédito sozinha',
                                      style: TextStyles
                                          .paragraphSmall12BrownSemiBold,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12),
                              child: Divider(
                                thickness: 1,
                                color: AppColors.white,
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: selectedFlag == '1' ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Visibility(
                                visible: selectedFlag == '1',
                                maintainSize: false,
                                maintainState: true,
                                maintainAnimation: true,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, bottom: 12),
                                  child: Text(
                                    'Este é o tempo-médio que as pessoas levam para ligar para o banco e passar por todos os setores responsáveis, até cancelar a anuidade. Boa sorte.',
                                    style: TextStyles.paragraphSmall9lightBlack,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.translate(
                                offset: const Offset(-5, 0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedFlag = '1';
                                    });
                                  },
                                  child: FlagCardGastosRight(
                                    icon: const Icon(
                                      Icons.access_time,
                                      color: AppColors.black,
                                    ),
                                    italicText: 'Em:',
                                    text: '1 minuto',
                                    backgroundColor: selectedFlag == '1'
                                        ? AppColors.white.withOpacity(0.8)
                                        : AppColors.lightOrange,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.translate(
                                offset: const Offset(-5, 0),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedFlag = '2';
                                      });
                                    },
                                    child: FlagCardGastosRight(
                                      icon: const Icon(
                                        Icons.attach_money,
                                        color: AppColors.black,
                                      ),
                                      italicText: 'Por:',
                                      text: 'R\$ 115,00',
                                      backgroundColor: selectedFlag == '2'
                                          ? AppColors.white.withOpacity(0.8)
                                          : AppColors.lightOrange,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              opacity: selectedFlag == '2' ? 1 : 0,
                              duration: const Duration(milliseconds: 500),
                              child: Visibility(
                                visible: selectedFlag == '2',
                                maintainSize: false,
                                maintainState: true,
                                maintainAnimation: true,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, bottom: selectedFlag == '2' ? 0 : 12, top: selectedFlag == '2' ? 12 : 0),
                                  child: Text(
                                    'Este é o preço do esforço Na.th pra liberar 3 horas de telemarketing e você não precisar se estressar reduzindo suas tarifas.',
                                    style: TextStyles.paragraphSmall9lightBlack,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CustomButton(
                                  onClick: () {},
                                  text: 'Fazer sozinha',
                                  color: AppColors.white,
                                  textColor: AppColors.darkBlue,
                                  style: TextStyles.buttonTextMedium),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16, bottom: 16, left: 16),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.lightbulb_outline,
                                      color: AppColors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6.0,left: 4),
                                      child: Text(
                                        '13% escolheram fazer sozinhos',
                                        style: TextStyles.paragraphSmall9lightBlack,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Crab(
                tag: 'bottom_row',
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: AppColors.purple,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: GradientIcon(
                            icon: Icons.circle,
                            size: 16,
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppColors.purple,
                                AppColors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          )),
                      Icon(
                        Icons.circle,
                        size: 24,
                        color: AppColors.orange,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 12,
          top: selectedFlag == '1' ? 220 : 160,
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
                              style: TextStyles.textDarkBlueSmall11SemiBold),
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
    );
  }
}

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Crab(
                      tag: 'purple',
                      child: Container(
                        height: 400,
                        color: AppColors.purple,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 96, right: 48, bottom: 24),
                                  child: Text(
                                    'Na.th fazendo \npra mim:',
                                    style: TextStyles.paragraphSmall12White,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(5, 0),
                                  child: FlagCardGastosLeft(
                                    icon: const Icon(
                                      Icons.access_time,
                                      color: AppColors.white,
                                    ),
                                    italicText: 'Em:',
                                    text: '1 minuto',
                                    backgroundColor: AppColors.purple,
                                    italicTextStyle:
                                        TextStyles.paragraphSmall9whiteItalic,
                                    textStyle: TextStyles
                                        .paragraphSmall12WhiteSemiBold,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(5, 0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: FlagCardGastosLeft(
                                      icon: const Icon(
                                        Icons.attach_money,
                                        color: AppColors.white,
                                      ),
                                      italicText: 'Por:',
                                      text: 'R\$ 49,90',
                                      backgroundColor: AppColors.purple,
                                      italicTextStyle:
                                          TextStyles.paragraphSmall9whiteItalic,
                                      textStyle: TextStyles
                                          .paragraphSmall12WhiteSemiBold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24, left: 20, right: 8, bottom: 32),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.lightbulb_outline,
                                        color: AppColors.white,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4),
                                          child: Text(
                                            '87% já escolheram reduzir a anuidade com a Na.th',
                                            style:
                                                TextStyles.paragraphSmall9white,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 24, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset('assets/image.png'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      'Arraste para detalhes',
                                      style: TextStyles.paragraphSmall9white,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: Crab(
                      tag: 'orange',
                      child: Container(
                        height: 400,
                        color: AppColors.lightOrange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 96, left: 16, bottom: 24),
                                  child: Text(
                                    'Fazendo \nsozinha:',
                                    style:
                                        TextStyles.paragraphSmall12LightBlack,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(-5, 0),
                                  child: const FlagCardGastosRight(
                                    icon: Icon(
                                      Icons.access_time,
                                      color: AppColors.textLightBlack,
                                    ),
                                    italicText: 'Em:',
                                    text: '3 horas',
                                    backgroundColor: AppColors.lightOrange,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(-5, 0),
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 12),
                                    child: FlagCardGastosRight(
                                      icon: Icon(
                                        Icons.money_off,
                                        color: AppColors.textLightBlack,
                                      ),
                                      italicText: 'Por:',
                                      text: 'R\$ 115,00',
                                      backgroundColor: AppColors.lightOrange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 24, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset('assets/image.png'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      'Arraste para detalhes',
                                      style: TextStyles.paragraphSmall9white,
                                      softWrap: true,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Crab(
                tag: 'bottom_row',
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: AppColors.purple,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: GradientIcon(
                            icon: Icons.circle,
                            size: 24,
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppColors.purple,
                                AppColors.orange,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          )),
                      Icon(
                        Icons.circle,
                        size: 16,
                        color: AppColors.orange,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 24,
          child: DelayedDisplay(
            delay: Duration(seconds: 1),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Economize até ',
                        style: TextStyles.paragraphSmall12DarkBlueLight,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'R\$ ',
                              style: TextStyles.paragraphMedium15DarkBlue),
                          TextSpan(
                              text: '490',
                              style: TextStyles.textBig20DarkBlueSemiBold),
                          TextSpan(
                              text: '/ano ',
                              style:
                                  TextStyles.paragraphSmall12DarkBlueSemiBold),
                          TextSpan(
                              text: '(40,83/mês)',
                              style: TextStyles.paragraphSmall9darkBlue),
                        ],
                      ),
                    ),
                    Text(
                      'Como gostaria de reduzir este gasto?',
                      style: TextStyles.paragraphSmall12DarkBlue,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}






class GradientIcon extends StatelessWidget {
  const GradientIcon({
    required this.icon,
    required this.size,
    required this.gradient,
  });

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

class FlagCardGastosLeft extends StatelessWidget {
  final Icon icon;
  final String italicText;
  final TextStyle italicTextStyle;
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;

  const FlagCardGastosLeft({
    Key? key,
    required this.icon,
    required this.italicText,
    required this.text,
    required this.backgroundColor,
    required this.italicTextStyle,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        side: BorderSide(width: 1, color: AppColors.white),
      ),
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: icon,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 24, bottom: 8, top: 4),
            child: Column(
              children: [
                Text(italicText, style: italicTextStyle),
                Text(
                  text,
                  style: textStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlagCardGastosRight extends StatelessWidget {
  final Icon icon;
  final String italicText;
  final String text;
  final Color backgroundColor;

  const FlagCardGastosRight({
    Key? key,
    required this.icon,
    required this.italicText,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        side: BorderSide(width: 1, color: AppColors.white),
      ),
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 24, bottom: 8, top: 4),
            child: Column(
              children: [
                Text(
                  italicText,
                  style: TextStyles.paragraphSmall9blackItalic,
                ),
                Text(
                  text,
                  style: TextStyles.paragraphSmall12BlackSemiBold,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: icon,
          ),
        ],
      ),
    );
  }
}
