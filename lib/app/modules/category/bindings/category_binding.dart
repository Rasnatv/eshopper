import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/category/controller/categorycontroller.dart';


class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
  }
}
