// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../core/controllers/auth_controller.dart';
// import '../../../routes/app_pages.dart';
//
// class SplashController extends GetxController {
//   final box = GetStorage();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _navigate();
//   }
//
//   void _navigate() async {
//     await Future.delayed(const Duration(seconds: 2));
//     final authController = Get.find<AuthController>();
//
//     final isFirstTime = box.read('isFirstTime') ?? true;
//     final storedToken = authController.token.value;
//
//     print('isFirstTime: $isFirstTime');
//     print('Token: $storedToken');
//
//     if (isFirstTime) {
//       Get.offNamed(Routes.LOGIN);
//     } else if (storedToken.isNotEmpty) {
//       Get.offNamed(Routes.LANDING);
//     } else {
//       Get.offNamed(Routes.LOGIN);
//     }
//   }
// }
import 'package:get/get.dart';

import '../../../common/storage/storage.dart';
import '../../../core/controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final authController = Get.find<AuthController>();
    final isFirstTime = Storage.getValue<bool>('isFirstTime') ?? true;
    final storedToken = authController.token.value;

    print('isFirstTime: $isFirstTime');
    print('Token: $storedToken');

    if (isFirstTime) {
      Get.offNamed(Routes.LOGIN);
    } else if (storedToken.isNotEmpty) {
      Get.offNamed(Routes.LANDING);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }
}
