import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CriarMeta3 extends StatefulWidget {
  const CriarMeta3({Key? key}) : super(key: key);

  @override
  _CriarMeta3State createState() => _CriarMeta3State();
}

class _CriarMeta3State extends State<CriarMeta3> {
  final totalCostController = TextEditingController();
  final monthlyCostController = TextEditingController();

  @override
  void dispose() {
    totalCostController.dispose();
    monthlyCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, top: 24, right: 20, bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.angleLeft,
                        color: AppColors.purple,
                        size: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Quanto custa?',
                          style: TextStyles
                              .textSelfieCardMedium15MontserratDarkBlueSemiBold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 64, right: 64, top: 32, bottom: 64),
                    child: Hero(
                      tag: 'progress_line',
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.purple,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                thickness: 1,
                                color: AppColors.textLightGray,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.purple,
                          ),
                          // Icon(Icons.circle, color: AppColors.purple, size: 16,),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                thickness: 1,
                                color: AppColors.textLightGray,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.purple,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                thickness: 1,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: AppColors.purple,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      color: AppColors.white,
                      elevation: 4,
                      child: TextField(
                        style: TextStyles.textFieldMedium18MontserratLightBlackMedium,
                          controller: totalCostController,
                        inputFormatters: [CurrencyTextInputFormatter(
                            locale: 'br',
                            symbol: ''
                        )],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'R\$', style: TextStyles.textPurple11Medium),
                              ],
                            ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  )
                          ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 36),
                    child: Text(
                      'E quanto preciso poupar por mês?',
                      style: TextStyles
                          .textSelfieCardMedium15MontserratDarkBlueSemiBold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)
                      ),
                      color: AppColors.white,
                      elevation: 4,
                      child: TextField(
                        style: TextStyles.textFieldMedium18MontserratLightBlackMedium,
                        controller: monthlyCostController,
                        inputFormatters: [CurrencyTextInputFormatter(
                            locale: 'br',
                            symbol: ''
                        )],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'R\$', style: TextStyles.textPurple11Medium),
                              ],
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )
                        ),

                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Não sei, Na.th!',
                      style: TextStyles.textUnderlineDarkBlueSmall9,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppColors.orange,
                          size: 56,
                        ),
                        IconButton(
                          onPressed: () async => await Navigator.pushNamed(
                              context, '/criar_meta_4'),
                          icon: const FaIcon(
                            FontAwesomeIcons.angleRight,
                            color: AppColors.white,
                            size: 24,
                          ),
                        ),
                      ],
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
