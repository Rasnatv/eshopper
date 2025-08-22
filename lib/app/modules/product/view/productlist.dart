//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:innsouls_flutter/app/modules/product/view/productdetailscreen.dart';
// import '../controllers/productcontroller.dart';
//
// class ProductListScreen extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (productController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       return Column(
//         children: [
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: const EdgeInsets.all(8.0),
//             itemCount: productController.products.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.7,
//             ),
//             itemBuilder: (context, index) {
//               final product = productController.products[index];
//
//               return GestureDetector(
//                 onTap: () => Get.to(() => Productdetailscreen(product: product)),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                         spreadRadius: 2,
//                         offset: Offset(2, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       // ---------- IMAGE + FAVORITE ICON STACK ----------
//                       Expanded(
//                         child: Stack(
//                           children: [
//                             ClipRRect(
//                               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                               child: AspectRatio(
//                                 aspectRatio: 1.2,
//                                 child: Image.network(
//                                   product.thumbnail,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (context, error, stackTrace) =>
//                                   const Icon(Icons.broken_image),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 8,
//                               right: 8,
//                               child: Obx(() {
//                                 final isFav = productController.isFavorite(product);
//                                 return InkWell(
//                                   onTap: () => productController.toggleFavorite(product),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.white.withOpacity(0.8),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     padding: const EdgeInsets.all(6),
//                                     child: Icon(
//                                       isFav ? Icons.favorite : Icons.favorite_border,
//                                       color: isFav ? Colors.red : Colors.grey,
//                                       size: 18,
//                                     ),
//                                   ),
//                                 );
//                               }),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // ---------- PRODUCT INFO ----------
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               product.title,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               "₹${product.price}",
//                               style: const TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             Container(
//                               width: 55,
//                               padding: const EdgeInsets.all(4),
//                               decoration: BoxDecoration(
//                                 color: Colors.amber.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Row(
//                                 children: [
//                                   const Icon(Icons.star, color: Colors.amber, size: 14),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     "${product.rating}",
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           // LOADING MORE INDICATOR
//           if (productController.isFetchingMore.value)
//             const Padding(
//               padding: EdgeInsets.all(12.0),
//               child: Center(child: CircularProgressIndicator()),
//             ),
//
//           // END OF LIST INDICATOR
//           if (!productController.hasMore.value)
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text('No more products', style: TextStyle(color: Colors.grey)),
//             ),
//         ],
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/widgets/gridviewlayout.dart';
import '../controllers/productcontroller.dart';
import '../widget/productcard.dart';


class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [

          Gridviewlayout(itemcount: productController.products.length, itembuilder: (context,index){
            final product = productController.products[index];
                return ProductCard(product: product);
          }),
          if (productController.isFetchingMore.value)
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          if (!productController.hasMore.value)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('No more products', style: TextStyle(color: Colors.grey)),
            ),
        ],
      );
    });
  }
}
