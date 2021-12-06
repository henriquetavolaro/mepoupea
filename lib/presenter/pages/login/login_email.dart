
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mepoupeapp/di/injection_module.dart';
import 'package:mepoupeapp/presenter/bloc/auth_events.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_state.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/icon_password_visibility.dart';
import 'package:mepoupeapp/presenter/components/login_social_bottom.dart';
import 'package:mepoupeapp/presenter/components/social_login_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'A senha é necessária'),
    MinLengthValidator(8, errorText: 'A senha deve conter ao menos 8 caracteres'),
    PatternValidator(
        r'(?=.*?[#?!@$%^&*-.,;])(?=.*?[0-9])(?=.*?[A-Z])',
        errorText: 'A senha deve conter ao menos 1 número, 1 caracter maiúsculo e 1 especial',
    caseSensitive: true)
  ]);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.loginBackground,
        appBar: AppBar(
            toolbarHeight: 46,
            backgroundColor: AppColors.loginBackground,
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.loginBackground),
            automaticallyImplyLeading: false),
        body:  BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: sl.get<AuthenticationBloc>(),
          listener: (context, state){
            if(state is RegisterEmailAndPasswordFailureState) {
              buildShowSnackBar(context, state.message);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 42, top: 46),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: EmailValidator(errorText: 'Insira um email válido'),
                                style: TextStyles.paragraphSmall12Grey,
                                controller: emailController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 8),
                                    fillColor: AppColors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(25)),
                                    hintText: "Seu melhor email"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: TextFormField(
                                  validator: passwordValidator,
                                  obscureText: !passwordVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyles.paragraphSmall12Grey,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      errorMaxLines: 2,
                                      suffixIcon: passwordVisible
                                          ? IconPasswordVisibility(
                                              passwordVisible: () => setState(() {
                                                passwordVisible = !passwordVisible;
                                              }),
                                              icon: Icons.visibility,
                                            )
                                          : IconPasswordVisibility(
                                              passwordVisible: () => setState(() {
                                                passwordVisible = !passwordVisible;
                                              }),
                                              icon: Icons.visibility_off,
                                            ),
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      fillColor: AppColors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(25)),
                                      hintText: "Senha"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: TextFormField(
                                  validator: (val) => MatchValidator(errorText: 'A confirmação da senha está incorreta').validateMatch(val!, passwordController.text),
                                  obscureText: !passwordVisible,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: TextStyles.paragraphSmall12Grey,
                                  controller: confirmPasswordController,
                                  decoration: InputDecoration(
                                      suffixIcon: passwordVisible
                                          ? IconPasswordVisibility(
                                              passwordVisible: () => setState(() {
                                                passwordVisible = !passwordVisible;
                                              }),
                                              icon: Icons.visibility,
                                            )
                                          : IconPasswordVisibility(
                                              passwordVisible: () => setState(() {
                                                passwordVisible = !passwordVisible;
                                              }),
                                              icon: Icons.visibility_off,
                                            ),
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      fillColor: AppColors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(25)),
                                      hintText: "Confirme sua senha"),
                                ),
                              ),
                              ValueListenableBuilder(
                                valueListenable: confirmPasswordController,
                                builder:
                                    (BuildContext context, value, Widget? child) {
                                  final enabled = emailController.text.isNotEmpty
                                      && passwordController.text.isNotEmpty
                                      && confirmPasswordController.text.isNotEmpty;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(
                                        top: 60, left: 60, right: 60),
                                    child: CustomButton(
                                      onClick: enabled ? () {
                                        final form = formKey.currentState!;
                                        if(form.validate()){
                                          sl.get<AuthenticationBloc>()
                                              .add(RegisterWithEmailAndPasswordEvent(emailController.text, passwordController.text));
                                        }
                                      } : () {},
                                      text: 'Registrar',
                                      color: enabled
                                          ? AppColors.orange
                                          : AppColors.buttonDisabled,
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
                    ],
                  ),
                  const LoginSocialBottom()
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
}
