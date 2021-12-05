import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/components/custom_buttom_icon.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);

  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  var phoneNumberController = TextEditingController();
  var smsCodeController = TextEditingController();
  var phoneMask = MaskTextInputFormatter(
      mask: '_ _      _ _ _ _ _   _ _ _ _', filter: {'_': RegExp(r'[0-9]')});
  bool isButtonEnabled = false;

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.loginBackground));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.loginBackground,
        appBar: AppBar(
            toolbarHeight: 46,
            backgroundColor: AppColors.loginBackground,
            elevation: 0,
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vamos começar!',
                  style: TextStyles.headerTextBlue,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Calma, falta pouco!',
                    style: TextStyles.paragraphSmall12Black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(25),
                          child: TextField(
                            style: TextStyles.phoneNumberTextField,
                            inputFormatters: [phoneMask],
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              isDense: true,
                                contentPadding: const EdgeInsets.all(8),
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image.asset(
                                      'assets/bandeira_brasil_phone.png'),
                                ),
                                fillColor: AppColors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25)),
                                hintText: "____  __________________"),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: phoneNumberController,
                          builder: (BuildContext context, value, Widget? child) {
                            final enabled = phoneNumberController.text.length == 28;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(top: 60, left: 60, right: 60),
                              child: CustomButton(
                                onClick: enabled ? () {sl.get<AuthenticationBloc>().add(PhoneSignInSendCodeEvent(
                                    phoneNumberController.text.toString())); } : (){},
                                text: 'Continuar',
                                color: enabled ? AppColors.orange : AppColors.textGray,
                                textColor: AppColors.white,
                                style: TextStyles.buttonTextMedium,
                              ),
                            );
                          },

                        )
                      ],
                    ),
                  ),
                ),
                Row(children: [
                  const Expanded(
                      child: Padding(
                    padding:EdgeInsets.only(right : 24.0, bottom: 24, top: 24),
                    child: Divider(
                      thickness: 1,
                    ),
                  )),
                  Text("Ou entre com", style: TextStyles.paragraphSmall9grey),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 24.0, bottom: 24, top: 24),
                    child: Divider(
                      thickness: 1,
                    ),
                  )),
                ]),
                Row(
                  children: [
                    SocialLoginButton(
                      icon: Image.asset('assets/google_logo.png'),
                      text: 'Google',
                      color: AppColors.white,
                      textColor: AppColors.textLightBlack,
                      onClick: () =>
                          sl.get<AuthenticationBloc>().add(GoogleSignInEvent()),
                      iconPaddingRight: 16,
                      paddingLeft: 0,
                      paddingRight: 12,
                    ),
                    SocialLoginButton(
                      icon: const Icon(FontAwesomeIcons.facebook),
                      text: 'Facebook',
                      color: AppColors.facebookBlue,
                      textColor: AppColors.white,
                      onClick: () => sl
                          .get<AuthenticationBloc>()
                          .add(FacebookSignInEvent()),
                      iconPaddingRight: 8,
                      paddingLeft: 12,
                      paddingRight: 0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
