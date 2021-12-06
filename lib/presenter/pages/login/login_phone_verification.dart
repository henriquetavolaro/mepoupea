import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_state.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginPhoneVerification extends StatefulWidget {
  final String phoneNumber;

  const LoginPhoneVerification({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _LoginPhoneVerificationState createState() => _LoginPhoneVerificationState();
}

class _LoginPhoneVerificationState extends State<LoginPhoneVerification> {
  var smsCodeController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    listenOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.loginBackground,
        appBar: AppBar(
            toolbarHeight: 46,
            backgroundColor: AppColors.loginBackground,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.loginBackground),
            automaticallyImplyLeading: false),
        body:     BlocListener<AuthenticationBloc, AuthenticationState>(
            bloc: sl.get<AuthenticationBloc>(),
            listener: (context, state){
              if(state is AuthenticationFailureState) {
                buildShowSnackBar(context, "Falha na autenticação");
              }
            },
          child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(25),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: Image.asset(
                                          'assets/bandeira_brasil_phone.png'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.phoneNumber,
                                        style:
                                            TextStyles.phoneNumberTextFieldSmall,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 36.0),
                                child: Text(
                                  'Valide o token recebido por SMS',
                                  style: TextStyles.phoneVerificationSmall11,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24.0, left: 48, right: 48),
                                child: PinFieldAutoFill(
                                  codeLength: 6,
                                  controller: smsCodeController,
                                  textInputAction: TextInputAction.send,
                                  onCodeSubmitted: (code) {
                                    sl.get<AuthenticationBloc>().add(
                                        PhoneSignInVerifyEvent(smsCodeController.text.toString()));
                                  },
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => sl.get<AuthenticationBloc>().add(
                          PhoneSignInSendCodeEvent(
                              widget.phoneNumber)),
                      child: RichText(
                        text: TextSpan(
                          text: 'Não recebeu? ',
                          style: TextStyles.phoneVerificationSmall11,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Reenviar',
                                style:
                                    TextStyles.phoneVerificationSmall11Underline)
                          ],
                        ),
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(
      BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void listenOtp() async {
    SmsAutoFill().listenForCode();
  }
}




