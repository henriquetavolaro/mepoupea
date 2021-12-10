import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mepoupeapp/presenter/components/card_selfie.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class MostrarSelfie extends StatefulWidget {
  final XFile imageFile;
  const MostrarSelfie({Key? key, required this.imageFile}) : super(key: key);

  @override
  _MostrarSelfieState createState() => _MostrarSelfieState();
}

class _MostrarSelfieState extends State<MostrarSelfie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.file(
                  File(widget.imageFile.path),
              ),
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
                                padding:
                                const EdgeInsets.only(bottom: 4.0),
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
                                    style: TextStyles
                                        .paragraphSmall12Black,
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
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                          child: InkWell(
                            onTap: () async {
                            },
                            child: const Icon(
                              Icons.check_circle,
                              color: AppColors.white,
                              size: 62,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.only(bottom: 4.0),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    height: 300,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(14),
                                        color: AppColors
                                            .lightGreenSelfie
                                            .withOpacity(0.8)),
                                    child: Text(
                                      'Em 10 anos \n(com Na.th)',
                                      style: TextStyles
                                          .paragraphSmall12Black,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
