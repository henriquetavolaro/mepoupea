import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/components/custom_buttom_icon.dart';
import 'package:mepoupeapp/presenter/components/login_social_bottom.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Login1 extends StatefulWidget {


  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.loginBackground,
      appBar: AppBar(
          toolbarHeight: 46,
          backgroundColor: AppColors.loginBackground,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 42),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Acho que vamos \nnos dar bem.',
                    style: TextStyles.headerTextBlue,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Mas pera...eu nem te conheço! Que Inteligência Artificial fajuta eu sou. Enquanto vou ao psicólogo, faça seu cadastro como achar melhor.',
                      style: TextStyles.paragraphSmall12Grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButtonIcon(
                              onClick: () {
                                Navigator.pushNamed(context, '/login_email');
                              },
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
                              onClick: () async => await Navigator.pushNamed(
                                  context, '/login_phone'),
                              text: 'Entrar com nº do celular',
                              color: AppColors.white,
                              textColor: AppColors.textLightBlack,
                              icon: const Icon(Icons.phone_android,
                                  color: AppColors.orange)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const LoginSocialBottom()
            ],
          ),
        ),
      ),
    );
  }
}
