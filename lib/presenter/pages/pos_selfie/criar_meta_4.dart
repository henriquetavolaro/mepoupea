import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class CriarMeta4 extends StatefulWidget {
  const CriarMeta4({Key? key}) : super(key: key);

  @override
  _CriarMeta4State createState() => _CriarMeta4State();
}

class _CriarMeta4State extends State<CriarMeta4> {
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
                          'Por último, por que é importante?',
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
                    padding: const EdgeInsets.only(right: 68),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              'Sempre foi um sonho meu',
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
                              'Vai me dar mais qualidade de vida',
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
                              'Vai ser bom para mim e minha família',
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
                              'Outra razão importante',
                              style: TextStyles.textTermosLightBlack11,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Começar a realizar!',
                        textColor: AppColors.white,
                        color: AppColors.orange,
                        onClick: () async => await Navigator.pushNamed(context, '/minhas_metas'),
                        style: TextStyles.buttonTextMedium,
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
