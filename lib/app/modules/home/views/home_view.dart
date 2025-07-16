//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:get/get.dart';
// import 'package:innsouls_flutter/app/common/style/app_text_style.dart';
// import 'package:innsouls_flutter/app/common/style/dimens.dart';
// import 'package:innsouls_flutter/app/modules/cart/views/cart_view.dart';
// import 'package:innsouls_flutter/app/modules/category/views/category_gridlist.dart';
// import 'package:innsouls_flutter/app/modules/home/views/searchscreen.dart';
// import 'package:innsouls_flutter/app/modules/product/view/productlist.dart';
// //import 'package:innsouls_flutter/app/modules/home/widgets/category_grid_list.dart';
// import 'package:innsouls_flutter/app/modules/home/widgets/section_title_bar.dart';
// import 'package:innsouls_flutter/app/widgets/dismiss_keyboard_widget.dart';
//
// import '../../../widgets/countofcart.dart';
// import '../controllers/search_controller.dart';
// import '../../product/controllers/productcontroller.dart';
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   final ScrollController _mainScroll = ScrollController();
//   final ProductController productController = Get.put(ProductController());
//
//   @override
//   void initState() {
//     super.initState();
//
//     _mainScroll.addListener(() {
//       if (_mainScroll.position.pixels >=
//           _mainScroll.position.maxScrollExtent - 200 &&
//           !productController.isFetchingMore.value &&
//           productController.hasMore.value) {
//         productController.fetchProducts();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _mainScroll.dispose();
//     super.dispose();
//   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           elevation: 0,
// //           scrolledUnderElevation: 0,
// //           surfaceTintColor: Colors.transparent,
// //           backgroundColor: Colors.white,
// //           title: Text("e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600,),
// //           actions: [
// //             DCounter( onpressed: (){},iconcolor: Colors.black.withOpacity(0.5),),
// //           ],
// //         ),
// //         body: SingleChildScrollView(
// //           controller: _mainScroll,
// //           child: Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 7.w),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SectionTitleBar(title: 'Categories', onSeeAll: () {}),
// //                 CategoriesScreen(), // horizontal scroll
// //                 Dimens.kSizedBoxH10,
// //                 SectionTitleBar(title: 'Products For You'),
// //                 Dimens.kSizedBoxH10,
// //                 ProductListScreen(),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DismissKeyboard(
//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             scrolledUnderElevation: 0,
//             surfaceTintColor: Colors.transparent,
//             backgroundColor: Colors.white,
//             title: Text("e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600),
//             actions: [
//               DCounter(
//                 onpressed: () => Get.to(() => CartView()),
//                 iconcolor: Colors.black.withOpacity(0.5),
//               ),
//             ],
//           ),
//           // rest of the UI
//
//           body: SingleChildScrollView(
//             controller: _mainScroll,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 7.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10.h),
//
//                   /// 🔍 Search Field
//                   GestureDetector(
//                     onTap: () => Get.to(() => Searchscreen()),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.withOpacity(0.005),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.search, color: Colors.grey, size: 22.sp),
//                           SizedBox(width: 8.w),
//                           Text(
//                             "Search products...",
//                             style: AppTextStyle.rTextRalewayBlack16w600.copyWith(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 16.h),
//
//                   SectionTitleBar(title: 'Categories', onSeeAll: () {}),
//                   CategoriesScreen(), // horizontal scroll
//                   Dimens.kSizedBoxH10,
//                   SectionTitleBar(title: 'Products For You'),
//                   Dimens.kSizedBoxH10,
//                   ProductListScreen(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/countofcart.dart';
import '../../../widgets/dismiss_keyboard_widget.dart';
import '../../../common/style/app_text_style.dart';
import '../../../common/style/dimens.dart';
import '../../cart/views/cart_view.dart';
import '../../category/views/category_gridlist.dart';
import '../../product/controllers/productcontroller.dart';
import '../../product/view/productlist.dart';
import '../widgets/searchfield.dart';
import '../widgets/section_title_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !productController.isFetchingMore.value &&
        productController.hasMore.value) {
      productController.fetchProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DismissKeyboard(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
                "e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600),
            actions: [
              DCounter(
                onpressed: () => Get.to(() => const CartView()),
                iconcolor: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Searchfield(),
                SizedBox(height: 16.h),
                SectionTitleBar(title: 'Categories', onSeeAll: () {}),
                CategoriesScreen(),
                Dimens.kSizedBoxH10,
                SectionTitleBar(title: 'Products For You'),
                Dimens.kSizedBoxH10,
                ProductListScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

