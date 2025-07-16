// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:innsouls_flutter/app/common/style/app_colors.dart';
// import 'package:innsouls_flutter/app/common/style/app_text_style.dart';
// import 'package:innsouls_flutter/app/widgets/custom_image_widget.dart';
//
// import '../../../common/constants/app_images.dart';
// import '../../../data/models/categorymodel.dart';
// import '../controllers/categorycontroller.dart';
//
// class CategoryTile extends StatelessWidget {
//   final Category category;
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
//     'vehicle':AppImages.categoryvehicle,
//     'sunglasses': AppImages.categorysunglass,
//     'skin-care': AppImages.categoryskincare,
//     'kitchen-accessories': AppImages.categorykitchenaccesories,
//     'sports-accessories': AppImages.categorysportsaccesories,
//     'mobile-accessories': AppImages.categorymobileaccesories,
//     'womens-bags': AppImages.categorywomenbag,
//     'womens-jewellery':AppImages.categoryjwellery
//   };
//
//
//   CategoryTile({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     // final imagePath = categoryImages[category.slug] ??;
//     final imagePath = categoryImages[category.slug];
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.r),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(8.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset(imagePath!, fit: BoxFit.contain),
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             category.name,
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 10.sp),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
