import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

 Future <void> main() async{
  runApp(
    ScreenUtilInit(
    designSize: Size(360, 690),
      builder: (context,child){
      return  GetMaterialApp(
        title: "HotelsGo",
        debugShowCheckedModeBanner: false,

      );
      },

    )
  );
}
