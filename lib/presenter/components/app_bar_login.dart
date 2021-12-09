import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class AppBarLogin extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const AppBarLogin({Key? key, required this.appBar}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 46,
        backgroundColor: AppColors.loginBackground,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.loginBackground),
        automaticallyImplyLeading: false);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}