
import 'package:flutter/material.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class MePoupeBaloonExclamationBig extends StatelessWidget {
  const MePoupeBaloonExclamationBig({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(81, (78*0.9824394874228761).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainterMePoupe2(),
        ),
        CustomPaint(
          size: Size(78, (78*0.9824394874228761).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainterMePoupe(),
        ),
        Positioned(
          right: 20,
          top: 8,
          child: Text('!',
            style: TextStyles.mePoupeExclamation,),
        )
      ],
    );
  }
}

class MePoupeBaloonExclamationMedium extends StatelessWidget {
  const MePoupeBaloonExclamationMedium({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(58, (58*0.9824394874228761).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainterMePoupe2(),
        ),
        CustomPaint(
          size: Size(61, (58*0.9824394874228761).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainterMePoupe(),
        ),
        Positioned(
          right: 16,
          top: 8,
          child: Text('!',
            style: TextStyles.mePoupeExclamationMedium,),
        )
      ],
    );
  }
}

class RPSCustomPainterMePoupe extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    Path path_0 = Path();
    path_0.moveTo(size.width*0.2287449,size.height*0.8542395);
    path_0.arcToPoint(Offset(size.width*0.2192527,size.height*0.8185241),radius: Radius.elliptical(size.width*0.06966925, size.height*0.07091454),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.2132138,size.height*0.8094453),radius: Radius.elliptical(size.width*0.09688559, size.height*0.09861736),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.1338396,size.height*0.5450941),radius: Radius.elliptical(size.width*0.4660164, size.height*0.4743462),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.cubicTo(size.width*0.1329722,size.height*0.2751957,size.width*0.3567746,size.height*0.05622189,size.width*0.6333568,size.height*0.05622189);
    path_0.cubicTo(size.width*0.8746543,size.height*0.05622189,size.width*1.075970,size.height*0.2233716,size.width*1.123136,size.height*0.4452774);
    path_0.arcToPoint(Offset(size.width*1.133774,size.height*0.5453940),radius: Radius.elliptical(size.width*0.4621704, size.height*0.4704315),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.6420307,size.height*1.040413),radius: Radius.elliptical(size.width*0.4878648, size.height*0.4965850),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.5062763,size.height*1.017824),radius: Radius.elliptical(size.width*0.5922950, size.height*0.6028819),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.cubicTo(size.width*0.4737738,size.height*1.008746,size.width*0.4415659,size.height*0.9967516,size.width*0.4332193,size.height*0.9935199);
    path_0.arcToPoint(Offset(size.width*0.4064776,size.height*0.9885224),radius: Radius.elliptical(size.width*0.07603555, size.height*0.07739464),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.3774283,size.height*0.9943695),radius: Radius.elliptical(size.width*0.07477538, size.height*0.07611194),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.2143921,size.height*1.053307);
    path_0.arcToPoint(Offset(size.width*0.2031815,size.height*1.056239),radius: Radius.elliptical(size.width*0.03888516, size.height*0.03958021),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.1801385,size.height*1.032817),radius: Radius.elliptical(size.width*0.02291213, size.height*0.02332167),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.1815786,size.height*1.024921),radius: Radius.elliptical(size.width*0.03695400, size.height*0.03761453),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xfffdab47).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainterMePoupe2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2287449,size.height*0.8542395);
    path_0.arcToPoint(Offset(size.width*0.2192527,size.height*0.8185241),radius: Radius.elliptical(size.width*0.06966925, size.height*0.07091454),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.2132138,size.height*0.8094453),radius: Radius.elliptical(size.width*0.09688559, size.height*0.09861736),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.1338396,size.height*0.5450941),radius: Radius.elliptical(size.width*0.4660164, size.height*0.4743462),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.cubicTo(size.width*0.1329722,size.height*0.2751957,size.width*0.3567746,size.height*0.05622189,size.width*0.6333568,size.height*0.05622189);
    path_0.cubicTo(size.width*0.8746543,size.height*0.05622189,size.width*1.075970,size.height*0.2233716,size.width*1.123136,size.height*0.4452774);
    path_0.arcToPoint(Offset(size.width*1.133774,size.height*0.5453940),radius: Radius.elliptical(size.width*0.4621704, size.height*0.4704315),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.6420307,size.height*1.040413),radius: Radius.elliptical(size.width*0.4878648, size.height*0.4965850),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.5062763,size.height*1.017824),radius: Radius.elliptical(size.width*0.5922950, size.height*0.6028819),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.cubicTo(size.width*0.4737738,size.height*1.008746,size.width*0.4415659,size.height*0.9967516,size.width*0.4332193,size.height*0.9935199);
    path_0.arcToPoint(Offset(size.width*0.4064776,size.height*0.9885224),radius: Radius.elliptical(size.width*0.07603555, size.height*0.07739464),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.arcToPoint(Offset(size.width*0.3774283,size.height*0.9943695),radius: Radius.elliptical(size.width*0.07477538, size.height*0.07611194),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.2143921,size.height*1.053307);
    path_0.arcToPoint(Offset(size.width*0.2031815,size.height*1.056239),radius: Radius.elliptical(size.width*0.03888516, size.height*0.03958021),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.1801385,size.height*1.032817),radius: Radius.elliptical(size.width*0.02291213, size.height*0.02332167),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.arcToPoint(Offset(size.width*0.1815786,size.height*1.024921),radius: Radius.elliptical(size.width*0.03695400, size.height*0.03761453),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffff9c24).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}