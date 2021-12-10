import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/app_bar_login.dart';
import 'package:mepoupeapp/presenter/components/avatar_pre_selfie.dart';
import 'package:mepoupeapp/presenter/components/custom_buttom_icon.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class TirarSelfie extends StatelessWidget {
  const TirarSelfie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      appBar: AppBarLogin(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.only(
                        top: 64,
                        bottom: 52,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 42),
                            child: Text(
                              '01 de novembro de 2021.',
                              style: TextStyles.headerTextWhiteBold,
                            ),
                          ),
                          Text(
                            'Este é o primeiro dia da sua nova vida financeira!,',
                            textAlign: TextAlign.center,
                            style: TextStyles.paragraphMedium14White,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32, bottom: 42),
                            child: Text(
                              'Que tal tirar uma selfie de verdade para registrar este momento?',
                              textAlign: TextAlign.center,
                              style: TextStyles.paragraphMedium14White,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              // left: 56,
                              // right: 56,
                            ),
                            child: ElevatedButton.icon(
                              onPressed: () async => await availableCameras()
                                  .then((value) =>
                                      Navigator.pushNamed(context, '/camera', arguments: value)),
                              label: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text('Tirar selfie'),
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Icons.camera_alt),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                primary: AppColors.orange,
                                onPrimary: AppColors.white,
                                textStyle: TextStyles.buttonTextMedium,
                              ),
                            ),
                          ),
                          Text(
                            'Agora não, Na.th',
                            textAlign: TextAlign.center,
                            style: TextStyles.textUnderlinedDarkBlue,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: AvatarPreSelfie(
                  border: Border.all(color: AppColors.white, width: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
