import 'package:camera/camera.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:mepoupeapp/presenter/components/avatar_pre_selfie.dart';
import 'package:mepoupeapp/presenter/components/card_ganhei.dart';
import 'package:mepoupeapp/presenter/components/card_gastei_investi.dart';
import 'package:mepoupeapp/presenter/components/custom_button.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';

class SelfieFinanceira1 extends StatefulWidget {
  final XFile? imageFile;

  const SelfieFinanceira1({Key? key, this.imageFile}) : super(key: key);

  @override
  _SelfieFinanceira1State createState() => _SelfieFinanceira1State();
}

class _SelfieFinanceira1State extends State<SelfieFinanceira1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late bool isAccountConnected;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
    if(widget.imageFile != null){
      isAccountConnected = true;
    } else {
      isAccountConnected = false;
    }
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.white),
        automaticallyImplyLeading: false,
        actions: [
          DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            child: Column(
              children: [
                Text(
                  '??ltimas 24h',
                  style: TextStyles.paragraphSmall9darkBlue,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 28),
                        child: Row(
                          children: [
                            Text(
                              'R\$',
                              style: TextStyles.textValueSmall7MontserratDarkBlue,
                            ),
                            Text(' 3,00',
                                style:
                                    TextStyles.textValueSmall12MontserratDarkBle)
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 8,
                      child: Icon(
                        Icons.add_circle_outlined,
                        color: AppColors.purple,
                        size: 18,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 6,
                      child: Image.asset('assets/selfie_coin.png'),
                    )
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: AppColors.darkBlue,
              ))
        ],
      ),
      body: SafeArea(
        child: DelayedDisplay(
          delay: const Duration(milliseconds: 200),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22, right: 10),
                          child: InkWell(
                            onTap: () async => await Navigator.pushNamed(
                                context, '/tirar_selfie'),
                              child: AvatarPreSelfie(
                            imageFile: widget.imageFile,
                          ),),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16, bottom: 8),
                              child: Text(
                                'Ol??, Bruce Dickinson',
                                style: TextStyles.textBlack14Medium,
                              ),
                            ),
                            widget.imageFile != null ?
                                Text(
                                  'Prazem em conhec??-la! \nGostei da selfie :)',
                                  style: TextStyles.textBlack14Medium,
                                )
                            : RichText(
                              text: TextSpan(
                                text: 'Sua Selfie da Riqueza merece ',
                                style: TextStyles.textBlack14Medium,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '\n67 curtidas',
                                      style: TextStyles.textPurple14SemiBold),
                                  TextSpan(
                                      text: '!',
                                      style: TextStyles.textBlack14Medium),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 74.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.loginBackground,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 120),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 12, bottom: 24),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CardGanhei(
                                    animationController: animationController,
                                    textAlignment: Alignment.bottomLeft,
                                    text: '7.568,65',
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: CardGasteiInvesti(
                                            value: ' 6.795,93',
                                            liquidColor:
                                                AppColors.gasteiBackground,
                                            text: 'Gastei',
                                            valueStyle:
                                                TextStyles.textCardValorGastei,
                                            animationController:
                                                animationController,
                                            moneyStyle:
                                                TextStyles.textCardR$Gastei,
                                            liquidPercentage: 0.56,
                                            textAlignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: CardGasteiInvesti(
                                            value: ' 398,42',
                                            liquidColor:
                                                AppColors.investiBackground,
                                            text: 'Investi',
                                            valueStyle:
                                                TextStyles.textCardValorInvest,
                                            animationController:
                                                animationController,
                                            moneyStyle:
                                                TextStyles.textCardR$Investi,
                                            liquidPercentage: 0.24,
                                            textAlignment: Alignment.bottomLeft,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: CustomButton(
                                            onClick: () {},
                                            text: 'Inserir d??vida',
                                            color: AppColors.white,
                                            textColor: AppColors.redGastei,
                                            style: TextStyles.textCardR$Gastei,
                                            visualDensity: VisualDensity.compact),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: CustomButton(
                                            onClick: () {},
                                            text: 'Conectar corretora',
                                            color: AppColors.white,
                                            textColor: AppColors.greenInvesti,
                                            style: TextStyles.textCardR$Investi,
                                            visualDensity: VisualDensity.compact),
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 8, bottom: 8, right: 22),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Saldo atual',
                                          style:
                                              TextStyles.textTermosLightBlack11,
                                        ),
                                        Text(
                                          'R\$ 749,00',
                                          style: TextStyles
                                              .textValueSmall13MontserratBlack,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, bottom: 32),
                                  child: Visibility(
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: isAccountConnected ? false : true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Conecte todas as suas contas para ver uma mensagem que trouxe do futuro!',
                                        style: TextStyles.paragraphSmall12Black,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomButton(
                                  onClick: () async => await Navigator.pushNamed(
                                      context, '/escolha_dos_bancos'),
                                  text: 'Conectar + contas',
                                  color: AppColors.orange,
                                  textColor: AppColors.white,
                                  style: TextStyles.buttonTextMedium,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: InkWell(
                                    onTap: () async => await Navigator.pushNamed(
                                        context, '/selfie_financeira_2'),
                                    child: Text(
                                      'Ver futuro com a Na.th',
                                      style: TextStyles.textUnderlinedDarkBlue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 84,
                  right: 6,
                  child: Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: isAccountConnected ? true : false,
                    child: Image.asset(
                      'assets/robot.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 115,
                  right: 32,
                  child: Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: isAccountConnected ? true : false,
                    child: ChatBubble(
                      clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                      backGroundColor: AppColors.robotBubble,
                      child: Text(
                        'Conecte todas as suas contas para ver\numa mensagem que trouxe do futuro!',
                        style: TextStyles.paragraphSmall9lightBlack,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class HeartIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8633402, size.height * 0.1766167);
    path_0.arcToPoint(Offset(size.width * 0.5148905, size.height * 0.2054733),
        radius:
            Radius.elliptical(size.width * 0.2553899, size.height * 0.2900566),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.4780688, size.height * 0.2483361);
    path_0.lineTo(size.width * 0.4412909, size.height * 0.2052747);
    path_0.arcToPoint(Offset(size.width * 0.09284121, size.height * 0.1764180),
        radius:
            Radius.elliptical(size.width * 0.2553461, size.height * 0.2900070),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.07434294, size.height * 0.6175623),
        radius:
            Radius.elliptical(size.width * 0.2681594, size.height * 0.3045595),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.4356934, size.height * 1.041323);
    path_0.arcToPoint(Offset(size.width * 0.5202694, size.height * 1.041323),
        radius: Radius.elliptical(
            size.width * 0.05855600, size.height * 0.06650442),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.8816198, size.height * 0.6175623);
    path_0.arcToPoint(Offset(size.width * 0.8633402, size.height * 0.1766167),
        radius:
            Radius.elliptical(size.width * 0.2679844, size.height * 0.3043608),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint_0_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04373114;
    paint_0_stroke.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_stroke);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff3a2670).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
