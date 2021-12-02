import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding3A extends StatelessWidget {
  const Onboarding3A({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: AppColors.orange));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          gradient: LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 42, left: 22, right: 22),
              child: Column(
                children: [
                  Text(
                    'Amei! Vou te ajudar a ganhar mais, muito rápido!',
                    style: TextStyles.headerTextWhite,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      'Mas preciso da sua ajuda também. Posso contar com você se esforçando um pouquinho para chegar mais longe, mais depressa?',
                      style: TextStyles.headerParagraphWhite,
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding:  const EdgeInsets.only(left: 78, right: 78, bottom: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                  onClick: (){

                  },
                  text: 'Claro, Na.th!',
                  color: AppColors.white,
                  textColor: AppColors.darkBlue,
                ),
              ),
            ),
            Text(
                'Hoje não, Na.th',
              style: TextStyles.textUnderlineWhite,
            )
          ],
        ),
      ),
    );
  }
}
