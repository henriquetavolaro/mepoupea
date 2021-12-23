import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/app_bar_login.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class PreSelfieNome extends StatefulWidget {
  const PreSelfieNome({Key? key}) : super(key: key);

  @override
  _PreSelfieNomeState createState() => _PreSelfieNomeState();
}

class _PreSelfieNomeState extends State<PreSelfieNome> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarLogin(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Como gostaria que eu te chamasse?',
                  style: TextStyles.headerTextBlue,
                ),
              ),
              TextFormField(
                controller: nameController,
                style: TextStyles.headerTextDarkBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 128),
                child: Text(
                  'Me conta seu melhor apelido carinhoso, mas se não quiser intimidade pode ser só seu nome.',
                  style: TextStyles.paragraphSmall12BlackMedium,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: nameController,
                builder:
                    (BuildContext context, value, Widget? child) {
                  final enabled = nameController.text.isNotEmpty;
                  return CustomButton(
                    onClick: enabled
                        ? () async => await Navigator.pushNamed(context, '/pre_selfie_1')
                        : () {},
                    text: 'Seguir',
                    color: enabled
                        ? AppColors.darkBlue
                        : AppColors.buttonDisabled,
                    textColor: AppColors.white,
                    style: TextStyles.buttonTextMedium,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
