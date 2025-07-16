//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../landing_screen/controllers/landing_controller.dart';
// import '../../product/controllers/productcontroller.dart';
// import '../../product/widget/productcard.dart';
// import '../controllers/wishlist_controller.dart';
//
//
// class WishlistView extends StatelessWidget {
//   final  productcontroler  = Get.find<ProductController >();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Favorites"),
//           leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {
//                 Get.find<LandingController>().changePage(page: LandingItem.Home);
//               })),
//       body: Obx(() {
//         final favorites = productcontroler.favoriteItems;
//
//         if (favorites.isEmpty) {
//           return const Center(
//             child: Text(
//               "No favorite products yet!",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           );
//         }
//
//         return GridView.builder(
//           padding: const EdgeInsets.all(8.0),
//           itemCount: favorites.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 0.7,
//           ),
//           itemBuilder: (context, index) {
//             final product = favorites[index];
//
//             return ProductCard(product: product);
//           },
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../landing_screen/controllers/landing_controller.dart';
import '../../product/controllers/productcontroller.dart';
import '../../product/widget/productcard.dart';
import '../controllers/wishlist_controller.dart';


class WishlistView extends StatelessWidget {
  final  whishlistcontroller  = Get.find<WishlistController >();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("My Favorites"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.find<LandingController>().changePage(page: LandingItem.Home);
              })),
      body: Obx(() {
        final favorites = whishlistcontroller .favoriteItems;

        if (favorites.isEmpty) {
          return const Center(
            child: Text(
              "No favorite products yet!",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = favorites[index];

            return ProductCard(product: product);
          },
        );
      }),
    );
  }
}
