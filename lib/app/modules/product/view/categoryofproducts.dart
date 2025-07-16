
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/product/widget/productcard.dart';
import '../../../data/models/productmodel.dart';
import '../../../widgets/gridviewlayout.dart';
import '../controllers/productcontroller.dart';
import 'productdetailscreen.dart';

class CategoryProductPage extends StatelessWidget {
  final String categorySlug;
  final String categoryName;

  CategoryProductPage({
    super.key,
    required this.categorySlug,
    required this.categoryName,
  });

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    // Fetch category products once when widget builds
    Future.microtask(() => productController.fetchProductsByCategory(categorySlug));

    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: Obx(() {
        if (productController.isCategoryLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final categoryList = productController.categoryProducts;

        if (categoryList.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return Column(
          children: [
            Expanded(
              // child: GridView.builder(
              //   padding: const EdgeInsets.all(8),
              //   itemCount: categoryList.length,
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 0.7,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //   ),
              //   itemBuilder: (context, index) {
              //     final product = categoryList[index];
              //     return ProductCard(product: product);
              child:Gridviewlayout(itemcount: categoryList.length, itembuilder: (context,index){
          final product = categoryList[index];
          return ProductCard(product: product);

      }),
    )
    ]);})));

  }
}
