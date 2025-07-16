//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../../common/constants/app_images.dart';
// import '../../product/view/categoryofproducts.dart';
// import '../controller/categorycontroller.dart';
//
// class CategoriesScreen extends StatelessWidget {
//   final CategoryController categoryController = Get.put(CategoryController());
//
//   final Map<String, String> categoryImages = {
//     'beauty': AppImages.categorybeauty,
//     'fragrances': AppImages.categoryfragrance,
//     'furniture': AppImages.categoryfurniture,
//     'groceries': AppImages.categorygrocery,
//     'home-decoration': AppImages.categoryhomedecor,
//     'womens-watches': AppImages.categorywomenwatches,
//     'womens-dresses': AppImages.categorytwomendress,
//     'womens-shoes': AppImages.categorywomenshoe,
//     'mens-shirts': AppImages.categorymenshirt,
//     'mens-shoes': AppImages.categorymenshoes,
//     'mens-watches': AppImages.categorymenwatch,
//     'laptops': AppImages.categorylaptop,
//     'motorcycle': AppImages.categorymotorcycle,
//     'automotive': AppImages.categoryvehicle,
//     'lighting': AppImages.categoryhomedecor,
//     'smartphones': AppImages.smartphone,
//     'tablets': AppImages.categorytablets,
//     'tops': AppImages.categorytops,
//     'vehicle': AppImages.categoryvehicle,
//     'sunglasses': AppImages.categorysunglass,
//     'skin-care': AppImages.categoryskincare,
//     'kitchen-accessories': AppImages.categorykitchenaccesories,
//     'sports-accessories': AppImages.categorysportsaccesories,
//     'mobile-accessories': AppImages.categorymobileaccesories,
//     'womens-bags': AppImages.categorywomenbag,
//     'womens-jewellery': AppImages.categoryjwellery,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Obx(() {
//       if (categoryController.isLoading.value) {
//         return Column(
//           children: [
//             _buildShimmerRow(),
//             const SizedBox(height: 8),
//             _buildShimmerRow(),
//           ],
//         );
//       }
//
//       final filtered = categoryController.categories
//           .where((category) => categoryImages.containsKey(category.slug))
//           .toList();
//
//       final half = (filtered.length / 2).ceil();
//       final firstRow = filtered.take(half).toList();
//       final secondRow = filtered.skip(half).toList();
//
//       return SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildScrollableRow(firstRow),
//             const SizedBox(height: 8),
//             _buildScrollableRow(secondRow),
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget _buildShimmerRow() {
//     return SizedBox(
//       height: 90,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 6,
//         itemBuilder: (_, index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 5),
//           child: Column(
//             children: [
//               Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: Container(
//                   width: 60,
//                   height: 60,
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Shimmer.fromColors(
//                 baseColor: Colors.grey[300]!,
//                 highlightColor: Colors.grey[100]!,
//                 child: Container(
//                   width: 50,
//                   height: 8,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScrollableRow(List<dynamic> categories) {
//     return SizedBox(
//       height: 90,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: categories.map((category) {
//             final imagePath = categoryImages[category.slug]!;
//
//             return Container(
//               width: 60,
//               margin: const EdgeInsets.symmetric(horizontal: 5),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: () {
//                     Get.to(() => CategoryProductPage(
//                       categorySlug: category.slug,
//                       categoryName: category.name,
//                     ));
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey[200],
//                           image: DecorationImage(
//                             image: AssetImage(imagePath),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         category.name,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(fontSize: 8),
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../common/constants/app_images.dart';
import '../../product/view/categoryofproducts.dart';
import '../controller/categorycontroller.dart';
import '../widget/categorygridrow.dart';
import '../widget/categoryimgmap.dart';
import '../widget/categoryshimmerrow.dart';

class CategoriesScreen extends StatelessWidget {
  //final CategoryController categoryController = Get.put(CategoryController());
  final categoryController=Get.put(CategoryController());

  final Map<String, String> categoryImages = CategoryImageMap.categoryImages;
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (categoryController.isLoading.value) {
        return Column(
          children: const [
            CategoryShimmerRow(),
            SizedBox(height: 8),
            CategoryShimmerRow(),
          ],
        );
      }

      final filtered = categoryController.categories
          .where((category) => categoryImages.containsKey(category.slug))
          .toList();

      final half = (filtered.length / 2).ceil();
      final firstRow = filtered.take(half).toList();
      final secondRow = filtered.skip(half).toList();

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryGridRow(categories: firstRow, categoryImages: categoryImages),
            const SizedBox(height: 8),
            CategoryGridRow(categories: secondRow, categoryImages: categoryImages),
          ],
        ),
      );
    });
  }
}