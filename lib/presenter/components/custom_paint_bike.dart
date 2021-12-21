//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class RPSCustomPainterBike extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.8842759,size.height*26.08006);
    path_0.arcToPoint(Offset(size.width*1.069823,size.height*25.80863),radius: Radius.elliptical(size.width*0.1855476, size.height*0.2714261),rotation: 0 ,largeArc: true,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.8842759,size.height*26.08006),radius: Radius.elliptical(size.width*0.1871153, size.height*0.2737195),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();
    path_0.moveTo(size.width*0.8842759,size.height*25.62291);
    path_0.arcToPoint(Offset(size.width*1.011236,size.height*25.80863),radius: Radius.elliptical(size.width*0.1269597, size.height*0.1857216),rotation: 0 ,largeArc: true,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.8842759,size.height*25.62291),radius: Radius.elliptical(size.width*0.1280920, size.height*0.1873779),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff2e5292).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*1.628731,size.height*26.08006);
    path_1.arcToPoint(Offset(size.width*1.816223,size.height*25.80863),radius: Radius.elliptical(size.width*0.1855476, size.height*0.2714261),rotation: 0 ,largeArc: true,clockwise: true);
    path_1.arcToPoint(Offset(size.width*1.628731,size.height*26.08006),radius: Radius.elliptical(size.width*0.1858088, size.height*0.2718084),rotation: 0 ,largeArc: false,clockwise: true);
    path_1.close();
    path_1.moveTo(size.width*1.628731,size.height*25.62291);
    path_1.arcToPoint(Offset(size.width*1.757636,size.height*25.80863),radius: Radius.elliptical(size.width*0.1269597, size.height*0.1857216),rotation: 0 ,largeArc: true,clockwise: false);
    path_1.arcToPoint(Offset(size.width*1.628731,size.height*25.62291),radius: Radius.elliptical(size.width*0.1271049, size.height*0.1859339),rotation: 0 ,largeArc: false,clockwise: false);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xff20396f).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width*1.476890,size.height*25.23469);
    path_2.lineTo(size.width*1.123969,size.height*25.23469);
    path_2.lineTo(size.width*1.098798,size.height*25.10579);
    path_2.arcToPoint(Offset(size.width*1.042475,size.height*25.12932),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*1.070230,size.height*25.27143);
    path_2.lineTo(size.width*0.8892695,size.height*25.71261);
    path_2.arcToPoint(Offset(size.width*0.9143828,size.height*25.77754),radius: Radius.elliptical(size.width*0.02932296, size.height*0.04289476),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.lineTo(size.width*1.195622,size.height*25.77754);
    path_2.arcToPoint(Offset(size.width*1.209383,size.height*25.77245),radius: Radius.elliptical(size.width*0.03001974, size.height*0.04391404),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.cubicTo(size.width*1.216119,size.height*25.76735,size.width*1.196609,size.height*25.79708,size.width*1.498635,size.height*25.30621);
    path_2.arcToPoint(Offset(size.width*1.476890,size.height*25.23469),radius: Radius.elliptical(size.width*0.02932296, size.height*0.04289476),rotation: 0 ,largeArc: false,clockwise: false);
    path_2.close();
    path_2.moveTo(size.width*0.9661189,size.height*25.69179);
    path_2.lineTo(size.width*1.092875,size.height*25.38278);
    path_2.lineTo(size.width*1.156254,size.height*25.69179);
    path_2.close();
    path_2.moveTo(size.width*1.208716,size.height*25.64932);
    path_2.lineTo(size.width*1.141244,size.height*25.32039);
    path_2.lineTo(size.width*1.410986,size.height*25.32039);
    path_2.close();

    Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
    paint_2_fill.color = Color(0xffffe278).withOpacity(1.0);
    canvas.drawPath(path_2,paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width*1.563727,size.height*25.33666);
    path_3.lineTo(size.width*1.291952,size.height*25.77835);
    path_3.lineTo(size.width*1.291952,size.height*25.65022);
    path_3.lineTo(size.width*1.476164,size.height*25.35080);
    path_3.lineTo(size.width*1.291952,size.height*25.35080);
    path_3.lineTo(size.width*1.291952,size.height*25.26510);
    path_3.lineTo(size.width*1.541952,size.height*25.26510);
    path_3.arcToPoint(Offset(size.width*1.563727,size.height*25.33666),radius: Radius.elliptical(size.width*0.02932296, size.height*0.04289476),rotation: 0 ,largeArc: false,clockwise: true);
    path_3.close();

    Paint paint_3_fill = Paint()..style=PaintingStyle.fill;
    paint_3_fill.color = Color(0xffffb454).withOpacity(1.0);
    canvas.drawPath(path_3,paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width*1.166618,size.height*25.16041);
    path_4.lineTo(size.width*1.025984,size.height*25.16041);
    path_4.arcToPoint(Offset(size.width*1.025984,size.height*25.07466),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.lineTo(size.width*1.166618,size.height*25.07466);
    path_4.arcToPoint(Offset(size.width*1.166618,size.height*25.16041),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: true);
    path_4.close();

    Paint paint_4_fill = Paint()..style=PaintingStyle.fill;
    paint_4_fill.color = Color(0xff2e5292).withOpacity(1.0);
    canvas.drawPath(path_4,paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width*1.640344,size.height*25.76450);
    path_5.arcToPoint(Offset(size.width*1.611660,size.height*25.73006),radius: Radius.elliptical(size.width*0.02932296, size.height*0.04289476),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.lineTo(size.width*1.517913,size.height*25.04434);
    path_5.arcToPoint(Offset(size.width*1.575369,size.height*25.02735),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.lineTo(size.width*1.669376,size.height*25.71320);
    path_5.arcToPoint(Offset(size.width*1.640344,size.height*25.76450),radius: Radius.elliptical(size.width*0.02932296, size.height*0.04289476),rotation: 0 ,largeArc: false,clockwise: true);
    path_5.close();

    Paint paint_5_fill = Paint()..style=PaintingStyle.fill;
    paint_5_fill.color = Color(0xffffb454).withOpacity(1.0);
    canvas.drawPath(path_5,paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width*1.591424,size.height*25.07857);
    path_6.lineTo(size.width*1.435170,size.height*25.07857);
    path_6.arcToPoint(Offset(size.width*1.435170,size.height*24.99282),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: true);
    path_6.lineTo(size.width*1.591424,size.height*24.99282);
    path_6.arcToPoint(Offset(size.width*1.591424,size.height*25.07857),radius: Radius.elliptical(size.width*0.02929393, size.height*0.04285229),rotation: 0 ,largeArc: false,clockwise: true);
    path_6.close();

    Paint paint_6_fill = Paint()..style=PaintingStyle.fill;
    paint_6_fill.color = Color(0xffe20059).withOpacity(1.0);
    canvas.drawPath(path_6,paint_6_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}