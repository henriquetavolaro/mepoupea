import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/presenter/components/app_bar_blue.dart';
import 'package:mepoupeapp/presenter/components/background_blue_gradient_container.dart';
import 'package:mepoupeapp/theme/app_colors.dart';
import 'package:mepoupeapp/theme/text_style.dart';
import 'package:show_up_animation/show_up_animation.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>  {


  @override
  void initState() {
    navigateAfterAnimation();
    super.initState();
  }

  void navigateAfterAnimation() async {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/onboarding_3_ganhar_mais');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBlue(appBar: AppBar(),),
      body: SafeArea(
        child: BackgroundBlueGradientContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: ShowUpAnimation(
                        animationDuration: Duration(seconds: 3),
                        curve: Curves.ease,
                        offset: -100,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Image.asset('assets/coin.png'),
                        )),
                  ),
                  Center(
                    child: ShowUpAnimation(
                        delayStart: Duration(milliseconds: 300),
                        animationDuration: Duration(seconds: 3),
                        curve: Curves.ease,
                        offset: -100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Image.asset('assets/coin.png'),
                        )),
                  ),
                  Center(
                    child: ShowUpAnimation(
                        delayStart: Duration(milliseconds: 600),
                        animationDuration: Duration(seconds: 3),
                        curve: Curves.ease,
                        offset: -100,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60.0),
                          child: Image.asset('assets/coin.png'),
                        )),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/wallet_left.png'),
                        Image.asset('assets/wallet_right.png'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: BlinkText(
                  'Ativando modo',
                  style: TextStyles.textLoadingWhite20Medium,
                  beginColor: AppColors.white,
                  endColor: AppColors.secondaryBlue,
                  times: 2,
                  duration: Duration(seconds: 1),
                ),
              ),
              BlinkText(
                'GANHAR MAIS DINHEIRO',
                style: TextStyles.textLoadingWhite20SemiBold,
                beginColor: AppColors.white,
                endColor: AppColors.secondaryBlue,
                times: 2,
                duration: Duration(seconds: 1),
              )
            ],
          ),
        ),
      ),
    );
  }


}
