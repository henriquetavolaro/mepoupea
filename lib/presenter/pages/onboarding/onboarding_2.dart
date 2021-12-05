import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  _OnboardingScreen2State createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {

  List<String> answers = ['Ganhar mais dinheiro', 'Investir melhor','Quitar minhas dívidas','Gastar menos'];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.orange
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          elevation: 0,
          automaticallyImplyLeading: false
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none, children: [
                Positioned(
                    right: 20,
                    bottom: -24,
                    child: Image.asset('assets/vector2.png')),
                Positioned(
                    right: 40,
                    bottom: -46,
                    child: Image.asset('assets/vector1.png')),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(25)
                        ),
                        gradient: LinearGradient(
                            colors: [
                              AppColors.primaryBlue,
                              AppColors.secondaryBlue
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 42, left: 22, right: 22),
                      child: Column(
                        children: [
                          Text(
                            'Uhul! Não vou te decepcionar! E já que estamos começando nossa relação, me conta: ',
                            style: TextStyles.headerTextWhite,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              'Qual o seu desejo mais urgente?',
                              style: TextStyles.headerParagraphWhite,
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ),

                ],
              ),
                const SizedBox(
                  height: 56,
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                    itemCount: answers.length,
                    itemBuilder: (context, index){
                      final item = answers[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 78, right: 78, bottom: 12),
                        child: CustomButton(
                            onClick: (){},
                            text: item,
                            color: AppColors.white,
                            textColor: AppColors.darkBlue,
                          style: TextStyles.buttonTextSemiBold,
                            ),
                      );
                    }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: InkWell(
                    onTap: () async => await Navigator.pushNamed(context, '/onboarding_3_naosei'),
                    child: Text(
                        'Não sei o que eu quero',
                      style: TextStyles.textUnderlinedDarkBlue,
                    ),
                  ),
                )
            ],
          ),
        ),
        bottomSheet: Container(
          color: AppColors.white,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0, top: 16),
            child: InkWell(
              onTap: () async => await Navigator.pushNamed(context, '/login_1'),
              child: RichText(
                text: TextSpan(
                  text: 'Já tem uma conta? ',
                  style: TextStyles.textBlue,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Entrar',
                    style: TextStyles.textUnderlineBlue)
                  ],
                ),
                  textAlign: TextAlign.center
              ),
            )
          ),
        ),
      ),
    );
  }
}
