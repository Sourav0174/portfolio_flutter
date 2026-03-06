import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/app/helpers/constants/app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,

    primaryColor: AppColors.limedSpruce,
    scaffoldBackgroundColor: AppColors.dawnPink,
    iconTheme: const IconThemeData(color: AppColors.limedSpruce),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),

    // 🌟 Nunito Sans as default font
    textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
      // Display (Runaways)
      displayLarge: TextStyle(
        fontFamily: "Runaways",
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.limedSpruce,
      ),
      displayMedium: TextStyle(
        fontFamily: "Runaways",
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.limedSpruce,
      ),
      displaySmall: TextStyle(
        fontFamily: "Runaways",
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.limedSpruce,
      ),

      // Headlines (Runaways)
      headlineLarge: TextStyle(
        fontFamily: "Runaways",
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.limedSpruce,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Runaways",
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.limedSpruce,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Runaways",
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.limedSpruce,
      ),

      // Titles (Nunito Sans)
      titleLarge: GoogleFonts.nunitoSans(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.limedSpruce,
      ),
      titleMedium: GoogleFonts.nunitoSans(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.limedSpruce,
      ),
      titleSmall: GoogleFonts.nunitoSans(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.limedSpruce,
      ),

      // Body
      bodyLarge: GoogleFonts.nunitoSans(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),
      bodyMedium: GoogleFonts.nunitoSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.limedSpruce,
      ),
      bodySmall: GoogleFonts.nunitoSans(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),

      // Labels
      labelLarge: GoogleFonts.nunitoSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.limedSpruce,
      ),
      labelMedium: GoogleFonts.nunitoSans(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.greyText,
      ),
      labelSmall: GoogleFonts.nunitoSans(
        fontSize: 8.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.greyText,
      ),
    ),
  );
}
