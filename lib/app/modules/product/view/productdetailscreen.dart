// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// //
// // import '../../../data/models/productmodel.dart';
// // import '../widget/bottomnavbar.dart';
// //
// // class Productdetailscreen extends StatelessWidget {
// //   final Product product;
// //   const Productdetailscreen({super.key, required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: DBottomAddtoCard(), // your custom bottom bar
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Expanded(child:
// //               Center(
// //                 child: ClipRRect(
// //                   //borderRadius: BorderRadius.circular(12),
// //                   child: Image.network(
// //                     product.thumbnail,
// //                     height: 250,
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),),
// //
// //               const SizedBox(height: 20),
// //
// //                Expanded(child: Column(children: [
// //               Text(
// //                 product.title,
// //                 maxLines: 1,
// //                 style: const TextStyle(
// //                   fontSize: 22,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //
// //               const SizedBox(height: 10),
// //
// //               // Price
// //               // Text(
// //               //   "₹${product.price}",
// //               //   style: const TextStyle(
// //               //     fontSize: 20,
// //               //     color: Colors.deepPurple,
// //               //     fontWeight: FontWeight.w600,
// //               //   ),
// //               // ),
// //               Row(
// //                 children: [
// //                   Text("₹${product.price}",
// //                       style: const TextStyle(
// //                           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
// //                   const SizedBox(width: 10),
// //                   Text(
// //                     "${product.discountPercentage}% OFF",
// //                     style: const TextStyle(
// //                         fontSize: 14, color: Colors.green, fontWeight: FontWeight.w600),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 10),
// //
// //               // Rating
// //
// //                   RatingBarIndicator(
// //                     rating: product.rating,
// //                     itemBuilder: (context, index) => const Icon(
// //                       Icons.star,
// //                       color: Colors.amber,
// //                     ),
// //                     itemCount: 5,
// //                     itemSize: 24.0,
// //                     direction: Axis.horizontal,
// //                   ),
// //
// //              // Chip(label: Text(product.brand), backgroundColor: Colors.purple.shade50),
// //               if (product.brand != null && product.brand!.isNotEmpty)
// //                 Chip(
// //                   label: Text(product.brand!),
// //                   backgroundColor: Colors.purple.shade50,
// //                 ),
// //               // Description
// //               Align(
// //                 alignment: Alignment.centerLeft,
// //                 child: Text(
// //                   "Description",
// //                   style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w600,
// //                       color: Colors.grey[700]),
// //                 ),
// //               ),
// //               const SizedBox(height: 6),
// //               Text(
// //                 product.description,
// //                 textAlign: TextAlign.left,
// //                 style: const TextStyle(color: Colors.black87),
// //               ),
// //              Divider(),
// //      Row(
// //     mainAxisSize: MainAxisSize.min,
// //     children:  [
// //       SvgPicture.asset(
// //         'assets/icons/vansvg.svg',
// //         height: 30.sp,
// //         width: 30.sp,
// //       ),
// //     SizedBox(width:13 ),
// //     Text(" Free Delivery", style: TextStyle(fontSize: 16,color: Colors.black87)),
// //     ],),
// //               Divider(),
// //               // to prevent overlap with bottom nav
// //             ]),
// //           ),
// //         ]),
// //               ))
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/svg.dart';
// //
// // import '../../../data/models/productmodel.dart';
// // import '../widget/bottomnavbar.dart';
// //
// // class Productdetailscreen extends StatelessWidget {
// //   final Product product;
// //   const Productdetailscreen({super.key, required this.product});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: DBottomAddtoCard(),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             // 1) Image takes a fixed height or flex
// //             Expanded(
// //               flex: 2,
// //               child: Center(
// //                 child: ClipRRect(
// //                   child: Image.network(
// //                     product.thumbnail,
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //
// //             // 2) The rest of the content scrolls if needed
// //             Expanded(
// //               flex: 3,
// //               child: SingleChildScrollView(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Title
// //                     Text(
// //                       product.title,
// //                       maxLines: 1,
// //                       overflow: TextOverflow.ellipsis,
// //                       style: const TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 12),
// //
// //                     // Price + Discount
// //                     Row(
// //                       children: [
// //                         Text(
// //                           "₹${product.price}",
// //                           style: const TextStyle(
// //                             fontSize: 20,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.pink,
// //                           ),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Text(
// //                           "${product.discountPercentage}% OFF",
// //                           style: const TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w600,
// //                             color: Colors.green,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 12),
// //
// //                     // Rating
// //                     RatingBarIndicator(
// //                       rating: product.rating,
// //                       itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
// //                       itemCount: 5,
// //                       itemSize: 24.0,
// //                     ),
// //                     const SizedBox(height: 12),
// //
// //                     // Brand chip
// //                     if (product.brand?.isNotEmpty ?? false)
// //                       Chip(
// //                         label: Text(product.brand!),
// //                         backgroundColor: Colors.purple.shade50,
// //                       ),
// //                     const SizedBox(height: 16),
// //
// //                     // Description
// //                     const Text(
// //                       "Description",
// //                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
// //                     ),
// //                     const SizedBox(height: 6),
// //                     Text(
// //                       product.description,
// //                       style: const TextStyle(color: Colors.black87),
// //                     ),
// //                     const SizedBox(height: 24),
// //
// //                     // Free Delivery
// //                     Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         SvgPicture.asset(
// //                           'assets/icons/vansvg.svg',
// //                           height: 30.sp,
// //                           width: 30.sp,
// //                         ),
// //                         const SizedBox(width: 12),
// //                         const Text(
// //                           "Free Delivery",
// //                           style: TextStyle(fontSize: 16),
// //                         ),
// //                       ],
// //                     ),
// //
// //                     // Extra bottom padding so content isn't hidden by the bar
// //                     const SizedBox(height: 80),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }}
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../data/models/productmodel.dart';
// import '../widget/bottomnavbar.dart';
//
// class Productdetailscreen extends StatelessWidget {
//   final Product product;
//   const Productdetailscreen({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: DBottomAddtoCard(product:product,),
//       body: SafeArea(
//     child: SingleChildScrollView(
//     padding: const EdgeInsets.all(20),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     // IMAGE
//     Center(
//     child: ClipRRect(
//     child: Image.network(
//     product.thumbnail,
//     height: 250,
//     width: double.infinity,
//     fit: BoxFit.cover,
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 20),
//
//     // TITLE
//     Text(
//     product.title,
//     maxLines: 1,
//     style: const TextStyle(
//     fontSize: 22,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//
//     const SizedBox(height: 10),
//
//     // PRICE + DISCOUNT ROW
//     Row(
//     children: [
//     Text(
//     "₹${product.price}",
//     style: const TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//     color: Colors.pink,
//     ),
//     ),
//     const SizedBox(width: 10),
//     Text(
//     "${product.discountPercentage}% OFF",
//     style: const TextStyle(
//     fontSize: 14,
//     color: Colors.green,
//     fontWeight: FontWeight.w600,
//     ),
//     ),
//     ],
//     ),
//
//     const SizedBox(height: 10),
//
//     // RATING
//     RatingBarIndicator(
//     rating: product.rating,
//     itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
//     itemCount: 5,
//     itemSize: 24.0,
//     ),
//
//     // BRAND CHIP (if any)
//     if (product.brand != null && product.brand!.isNotEmpty)
//     Padding(
//     padding: const EdgeInsets.only(top: 8.0),
//     child: Chip(
//     label: Text(product.brand!),
//     backgroundColor: Colors.purple.shade50,
//     ),
//     ),
//
//     const SizedBox(height: 20),
//
//     // DESCRIPTION
//     const Text(
//     "Description",
//     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//     ),
//     const SizedBox(height: 6),
//     Text(
//     product.description,
//     style: const TextStyle(color: Colors.black87),
//     ),
//
//     const Divider(height: 40),
//
//     // FREE DELIVERY ROW
//     Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     SvgPicture.asset(
//     'assets/icons/vansvg.svg',
//     height: 30.sp,
//     width: 30.sp,
//     ),
//     const SizedBox(width: 13),
//     const Text(
//     "Free Delivery",
//     style: TextStyle(fontSize: 16, color: Colors.black87),
//     ),
//     ],
//     ),
//      // give space so bottom bar doesn’t overlap
//     ],
//     ),
//     ),)
//     );}}
import 'package:flutter/material.dart';
import '../../../common/style/app_text_style.dart';
import '../../../data/models/productmodel.dart';
import '../../../widgets/countofcart.dart';
import '../widget/bottomnavbar.dart';
import '../widget/productdetailcontent.dart';

class Productdetailscreen extends StatelessWidget {
  final Product product;
  const Productdetailscreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text("e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600,),
        actions: [
          DCounter( onpressed: (){},iconcolor: Colors.black.withOpacity(0.5),),
        ],
      ),
      bottomNavigationBar: DBottomAddtoCard(product: product),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ProductDetailContent(product: product),
        ),
      ),
    );
  }
}
