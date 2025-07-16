

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constants/app_images.dart';
import '../controllers/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final  controller = Get.find<SplashController >();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(width: 350,height:300,
        decoration: BoxDecoration(image:DecorationImage(image:AssetImage(AppImages.appSplachLogoImagePNG)),
    ))));
  }
}
