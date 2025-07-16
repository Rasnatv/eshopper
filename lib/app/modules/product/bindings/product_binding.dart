
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/product/controllers/productcontroller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
