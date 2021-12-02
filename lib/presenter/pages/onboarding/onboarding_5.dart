import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding5 extends StatefulWidget {
  const Onboarding5({Key? key}) : super(key: key);

  @override
  State<Onboarding5> createState() => _Onboarding5();
}

class _Onboarding5 extends State<Onboarding5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {

          },
        ),
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
                    'Anotado! E se eu te disser que te ajudo com isso e mais um pouco aqui no app?',
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
              height: 24,
            ),
           CustomButton(
                        onClick: () {},
                        text: 'Bora, Na.th!',
                        color: AppColors.white,
                        textColor: AppColors.darkBlue,
                      ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 66.0, top: 16),
                    child: RichText(
                        text: TextSpan(
                          text: 'Já tem uma conta? ',
                          style: TextStyles.textWhite,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Entrar',
                                style: TextStyles.textUnderlineWhite)
                          ],
                        ),
                        textAlign: TextAlign.center
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}