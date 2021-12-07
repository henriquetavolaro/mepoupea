import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class AppBarBlue extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const AppBarBlue({Key? key, required this.appBar}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      elevation: 0,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.orange),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
