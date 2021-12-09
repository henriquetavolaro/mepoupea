import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/presenter/components/custom_button_stroke.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class ComoPrefereConectar extends StatelessWidget {
  const ComoPrefereConectar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.loginBackground),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -300,
              width: MediaQuery.of(context).size.width * 2,
              left: -75,
              child: Column(
                children: [
                  Image.asset('assets/elipse_background.png'),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 46.0),
              child: DelayedDisplay(
                delay: const Duration(milliseconds: 200),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Sorria, sua  ',
                        style: TextStyles.headerTextBlue,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Selfie da Riqueza ',
                              style: TextStyles.headerTextBlueSemiBold),
                          TextSpan(
                              text: 'será revelada!',
                              style: TextStyles.headerTextBlue),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32.0),
                      child: Text(
                        'Para isso é importante conhecer todas as suas contas em bancos e corretoras.',
                        style: TextStyles.paragraphSmall12BlackMedium,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Como prefere compartilhar essas contas?',
                        style: TextStyles.paragraphSmall12BlackMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: CustomButton(
                        onClick: () async => await Navigator.pushNamed(context, '/escolha_dos_bancos'),
                        text: 'Automaticamente',
                        color: AppColors.orange,
                        textColor: AppColors.white,
                        style: TextStyles.buttonTextMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 36),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                            size: Size(9, (9 * 1.1412535079513564).toDouble()),
                            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(AppColors.orange),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Tempo estimado: 1 minuto!',
                              style: TextStyles.paragraphSmall9orange,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomButtonStroke(
                        onClick: () async => await Navigator.pushNamed(context, '/conta_manual'),
                        text: 'Manualmente',
                        color: AppColors.white,
                        textColor: AppColors.redGastei,
                        style: TextStyles.buttonTextMedium,
                        borderSide: const BorderSide(
                            width: 1, color: AppColors.redGastei),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 36),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPaint(
                            size: Size(9, (9 * 1.1412535079513564).toDouble()),
                            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(AppColors.redGastei),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Tempo estimado: 3 HORAS!',
                              style: TextStyles.paragraphSmall9red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final Color color;

  RPSCustomPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2853134, 0);
    path_0.lineTo(size.width * 0.2853134, size.height * 0.1249545);
    path_0.lineTo(size.width * 0.4279181, size.height * 0.1249545);
    path_0.lineTo(size.width * 0.4279181, size.height * 0.1286885);
    path_0.arcToPoint(Offset(size.width * 0.9985448, size.height * 0.5623862),
        radius:
            Radius.elliptical(size.width * 0.4996362, size.height * 0.4377960),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.9628937, size.height * 0.4061931),
        radius:
            Radius.elliptical(size.width * 0.4845650, size.height * 0.4245902),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.8330735, size.height * 0.4537341);
    path_0.arcToPoint(Offset(size.width * 0.8559401, size.height * 0.5637523),
        radius:
            Radius.elliptical(size.width * 0.3429997, size.height * 0.3005464),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4989086, size.height * 0.2512750),
        radius:
            Radius.elliptical(size.width * 0.3566157, size.height * 0.3124772),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.6244673, size.height * 0.2713115),
        radius:
            Radius.elliptical(size.width * 0.3487163, size.height * 0.3055556),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.6730070, size.height * 0.1538251);
    path_0.arcToPoint(Offset(size.width * 0.5703149, size.height * 0.1337887),
        radius:
            Radius.elliptical(size.width * 0.5973392, size.height * 0.5234062),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.5703149, size.height * 0.1262295);
    path_0.lineTo(size.width * 0.7132315, size.height * 0.1262295);
    path_0.lineTo(size.width * 0.7132315, size.height * 0.001275046);
    path_0.lineTo(size.width * 0.2853134, size.height * 0.001275046);
    path_0.close();
    path_0.moveTo(size.width * 0.9985448, size.height * 0.1449909);
    path_0.cubicTo(
        size.width * 0.9985448,
        size.height * 0.1449909,
        size.width * 0.4781208,
        size.height * 0.4962659,
        size.width * 0.4507847,
        size.height * 0.5199454);
    path_0.arcToPoint(Offset(size.width * 0.4507847, size.height * 0.6061931),
        radius: Radius.elliptical(
            size.width * 0.06974327, size.height * 0.06111111),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5492153, size.height * 0.6061931),
        radius: Radius.elliptical(
            size.width * 0.06724873, size.height * 0.05892532),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.cubicTo(
        size.width * 0.5776946,
        size.height * 0.5812386,
        size.width * 1.000000,
        size.height * 0.1449909,
        size.width * 1.000000,
        size.height * 0.1449909);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
