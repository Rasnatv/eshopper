// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:innsouls_flutter/app/modules/landing_screen/widgets/app_nav_bar.dart';
//
// import '../controllers/landing_controller.dart';
//
//
// class LandingView extends GetView<LandingController> {
//   const LandingView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LandingController>(
//       builder: (controller) => PopScope(
//         canPop: controller.selectedPage == LandingItem.Home,
//         onPopInvokedWithResult: (didPop, result) => controller.onPop(),
//         child: Scaffold(
//           body: controller.getPage(),
//           bottomNavigationBar: AppNavBar(), // ✅ Always visible
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/landing_screen/widgets/app_nav_bar.dart';
import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingController>(
      builder: (controller) => PopScope(
        canPop: true, // Always allow pop
        onPopInvoked: (didPop) {
          if (!didPop) {
            controller.onPop(); // Handle back manually
          }
        },
        child: Scaffold(
          body: controller.getPage(),
          bottomNavigationBar: const AppNavBar(), // Bottom Nav always visible
        ),
      ),
    );
  }
}
