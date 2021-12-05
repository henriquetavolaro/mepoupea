import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/components/custom_buttom_icon.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Login1 extends StatelessWidget {
  const Login1({Key? key}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.only(left: 22, right: 42),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Acho que vamos \nnos dar bem.',
                  style: TextStyles.headerTextBlue,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Mas pera...eu nem te conheço! Que Inteligência Artificial fajuta eu sou. Enquanto vou ao psicólogo, faça seu cadastro como achar melhor.',
                    style: TextStyles.paragraphSmall12Grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButtonIcon(
                              onClick: () {},
                              text: 'Entrar com Email',
                              color: AppColors.white,
                              textColor: AppColors.textLightBlack,
                              icon: const Icon(Icons.local_post_office,
                                  color: AppColors.orange)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 24),
                          child: CustomButtonIcon(
                              onClick: () async => await Navigator.pushNamed(context, '/login_phone'),
                              text: 'Entrar com nº do celular',
                              color: AppColors.white,
                              textColor: AppColors.textLightBlack,
                              icon: const Icon(Icons.phone_android,
                                  color: AppColors.orange)),
                        )
                      ],
                    ),
                  ),
                ),
                Row(children: [
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  )),
                  Text("Ou entre com", style: TextStyles.paragraphSmall9grey),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 24.0),
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
                      onClick: () => sl.get<AuthenticationBloc>().add(GoogleSignInEvent()),
                      iconPaddingRight: 16,
                      paddingLeft: 0,
                      paddingRight: 12,
                    ),
                    SocialLoginButton(
                      icon: const Icon(FontAwesomeIcons.facebook),
                      text: 'Facebook',
                      color: AppColors.facebookBlue,
                      textColor: AppColors.white,
                      onClick: () => sl.get<AuthenticationBloc>().add(FacebookSignInEvent()),
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
