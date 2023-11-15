import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../custom_widget/backroun_screen/backroundscreen.dart';
import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {

  HomepageController homepageController = Get.put(HomepageController());

  HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackrounScreen(

      body: Column()
    );
  }
}
