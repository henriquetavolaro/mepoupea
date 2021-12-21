import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CriarMeta1 extends StatefulWidget {
  const CriarMeta1({Key? key}) : super(key: key);

  @override
  _CriarMeta1State createState() => _CriarMeta1State();
}

class _CriarMeta1State extends State<CriarMeta1> {
  int _value = 1;

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
                          'Criar nota meta!',
                          style: TextStyles
                              .textSelfieCardMedium15MontserratDarkBlueSemiBold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Text(
                      'Podemos chamar de meta, sonho, desejo...não importa! O que vale é que é importante para você',
                      style: TextStyles.textPurple11Medium,
                    ),
                  ),
                  Text(
                    'Primeiro me conta o que você deseja:',
                    style: TextStyles.textLightBlack11semiBold,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value as int;
                            },
                          );
                        },
                      ),
                      Text(
                        'Comprar um item à vista',
                        style: TextStyles.textTermosLightBlack11,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value as int;
                            },
                          );
                        },
                      ),
                      Text(
                        'Fazer um passeio específico',
                        style: TextStyles.textTermosLightBlack11,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value as int;
                            },
                          );
                        },
                      ),
                      Text(
                        'Quitar parcelas',
                        style: TextStyles.textTermosLightBlack11,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(
                            () {
                              _value = value as int;
                            },
                          );
                        },
                      ),
                      Text(
                        'Outros',
                        style: TextStyles.textTermosLightBlack11,
                      )
                    ],
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
                              context, '/criar_meta_2'),
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
