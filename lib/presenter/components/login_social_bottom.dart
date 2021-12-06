import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class LoginSocialBottom extends StatelessWidget {
  const LoginSocialBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 156.0),
      child: Column(
        children: [
          Row(children: [
            const Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.only(right: 24.0, bottom: 24, top: 24),
                  child: Divider(
                    thickness: 1,
                  ),
                )),
            Text("Ou entre com",
                style: TextStyles.paragraphSmall9grey),
            const Expanded(
                child: Padding(
                  padding:
                  EdgeInsets.only(left: 24.0, bottom: 24, top: 24),
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
                onClick: () => sl
                    .get<AuthenticationBloc>()
                    .add(GoogleSignInEvent()),
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
    );
  }
}
