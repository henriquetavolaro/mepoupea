import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      appBar: AppBar(
          backgroundColor: AppColors.loginBackground,
          elevation: 0,
          automaticallyImplyLeading: false),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vamos começar!',
                style: TextStyles.headerTextBlue,
                textAlign: TextAlign.end,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Cadastre-se ou acesse sua conta para ter acesso a todos os recursos da Na.th',
                  style: TextStyles.loginParagraphSmall,
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
                            onClick: () {},
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
                  padding: EdgeInsets.all(24.0),
                  child: Divider(
                    thickness: 1,
                  ),
                )),
                Text("Ou entre com", style: TextStyles.loginParagraphSmall),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Divider(
                    thickness: 1,
                  ),
                )),
              ]),
              Row(
                children: [
                  SocialLoginButton(
                      paddingLeft: 12,
                      paddingRight: 12,
                      icon: Image.asset('assets/google_logo.png'),
                      text: 'Google',
                      color: AppColors.white,
                      textColor: AppColors.textLightBlack
                  ),
                  const SocialLoginButton(
                      paddingLeft: 12,
                      paddingRight: 12,
                      icon: Icon(FontAwesomeIcons.facebook),
                      text: 'Facebook',
                      color: AppColors.facebookBlue,
                      textColor: AppColors.white
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
