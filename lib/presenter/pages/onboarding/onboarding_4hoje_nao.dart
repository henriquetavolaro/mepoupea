import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Onboarding4HojeNao extends StatefulWidget {
  const Onboarding4HojeNao({Key? key}) : super(key: key);

  @override
  State<Onboarding4HojeNao> createState() => _Onboarding4HojeNaoState();
}

class _Onboarding4HojeNaoState extends State<Onboarding4HojeNao> {
  List<String> answers = [
    'Com minha gestão financeira',
    'Com dicas de produtos',
    'Informações sobre descontos',
    'Tava brincando, mudei de ideia'
  ];

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
              padding: const EdgeInsets.only(bottom: 42, left: 22, right: 42),
              child: Column(
                children: [
                  Text(
                    'Que pena! Se você mudar de ideia, será uma jornada incrível. ',
                    style: TextStyles.headerTextWhite,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      'Como você acha que eu poderia te ajudar melhor?',
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
            SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: answers.length,
                  itemBuilder: (context, index) {
                    final item = answers[index];
                    if (index != 3) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 48, right: 48, bottom: 12),
                        child: CustomButton(
                          onClick: () {},
                          text: item,
                          color: AppColors.white,
                          textColor: AppColors.darkBlue,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 48, right: 48, bottom: 12),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: AppColors.white, width: 1),
                              ),
                              primary: AppColors.white),
                          onPressed: () {},
                          child: Text(
                            item,
                            style: TextStyles.buttonTextWhiteMedium,
                          ),
                        ),
                      );
                    }
                  }),
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
