import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hotelsgo/app/utils/app_image/appimage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 3),()=>Get.offNamed(Routes.homepage));
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Image.asset(
        AppImage.splashscreenimage,
        height: size.height/1.5,
        width:  size.width/1.5,
      ),
    ));
  }
}
