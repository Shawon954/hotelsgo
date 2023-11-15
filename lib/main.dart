import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotelsgo/app/modules/homepage/bindings/homepage_binding.dart';
import 'package:hotelsgo/app/routes/app_pages.dart';

 Future <void> main() async{

   WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();

  runApp(
    ScreenUtilInit(
    designSize: Size(360, 690),
      builder: (context,child){
      return  GetMaterialApp(
        title: "HotelsGo",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: HomepageBinding(),
      );
      },

    )
  );
}
