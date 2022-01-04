import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/card_selfie.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Camera({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  late CameraDescription description;
  XFile? imageFile;

  @override
  void initState() {
    description = widget.cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);
    super.initState();
    initCamera(description);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !controller.value.isInitialized
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CameraPreview(controller),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      height: 280,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: AppColors.lightRedSelfie
                                              .withOpacity(0.8)),
                                      child: Text(
                                        'HOJE',
                                        style: TextStyles.paragraphSmall12Black,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightBlackSemiBold,
                                        text: 'Eu ganho',
                                        value: '4.591,00',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightBlackSemiBold,
                                      ),
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightRedSemiBold,
                                        text: 'Eu gasto',
                                        value: '3.917,00',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightRedSemiBold,
                                      ),
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightGreenSemiBold,
                                        text: 'Eu invisto',
                                        value: '400,00',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightGreenSemiBold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: InkWell(
                                onTap: () async {
                                  imageFile = await controller.takePicture();
                                  await Navigator.pushNamed(
                                      context, '/mostrar_selfie',
                                      arguments: imageFile!);
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: const [
                                    Icon(
                                      Icons.remove_circle_outline_rounded,
                                      color: AppColors.white,
                                      size: 86,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: AppColors.white,
                                      size: 62,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        height: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: AppColors.lightGreenSelfie
                                                .withOpacity(0.8)),
                                        child: Text(
                                          'Em 10 anos \n(com Na.th)',
                                          style:
                                              TextStyles.paragraphSmall12Black,
                                        )),
                                  ),
                                  Column(
                                    children: [
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightBlackSemiBold,
                                        text: 'Vou ganhar',
                                        value: '22.917,35',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightBlackSemiBold,
                                      ),
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightRedSemiBold,
                                        text: 'Vou gastar',
                                        value: '7.589,03',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightRedSemiBold,
                                      ),
                                      CardSelfie(
                                        styleR$: TextStyles
                                            .textSelfieSmall12MontserratLightGreenSemiBold,
                                        text: 'Vou invistir',
                                        value: '14.818,32',
                                        styleValue: TextStyles
                                            .textSelfieMedium16MontserratLightGreenSemiBold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 96,
                    right: 48,
                    child: IconButton(
                      icon: const Icon(
                        Icons.flip_camera_ios_rounded,
                        color: AppColors.white,
                        size: 48,
                      ),
                      onPressed: () {
                        toggleCamera();
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void initCamera(CameraDescription description) {
    controller = CameraController(
      description,
      ResolutionPreset.high,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      } else {
        setState(() {});
      }
    });
  }

  void toggleCamera() {

    final lensDirection =  controller.description.lensDirection;
    CameraDescription newDescription;
    if(lensDirection == CameraLensDirection.front){
      newDescription = widget.cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.back);
    }
    else{
      newDescription = widget.cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.front);
    }

    if(newDescription != null){
      initCamera(newDescription);
    }
    else{
      print('Asked camera not available');
    }
  }

}
