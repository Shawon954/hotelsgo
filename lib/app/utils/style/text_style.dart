

 import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelsgo/app/utils/app_color/app_colors.dart';

 TextStyle textAppBarStyle(
     {color = AppColors.primaycolor,
       double fontSize = 16,
       fontWeight = FontWeight.w600,
       bool isGrayColor = false}) {
   return GoogleFonts.inter(
       fontSize: fontSize.sp,
       color: color,
       fontWeight: fontWeight);
 }