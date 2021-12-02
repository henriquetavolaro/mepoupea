import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mepoupeapp/theme/app_colors.dart';

class TextStyles {
  static final titleNath = GoogleFonts.poppins(
    fontSize: 72,
    fontWeight: FontWeight.w600,
    color: AppColors.textNath
  );
  static final paragraphHeaderWhite = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white
  );
  static final buttonTextWhiteSemiBold = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static final buttonTextWhiteMedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static final textBlue = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryBlue
  );
  static final textWhite = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.white
  );
  static final headerTextWhite = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white
  );
  static final headerParagraphWhite = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white
  );
  static final textUnderlinedDarkBlue = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlue,
    decoration: TextDecoration.underline
  );
  static final textUnderlineBlue = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryBlue,
      decoration: TextDecoration.underline
  );
  static final textUnderlineWhite = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      decoration: TextDecoration.underline
  );

}