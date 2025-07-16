// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../data/models/productmodel.dart';
// import '../controllers/search_controller.dart';
//
//
// class Searchscreen extends StatelessWidget {
//   Searchscreen({super.key});
//
//   final SearchControllers controller = Get.put(SearchControllers());
//   final TextEditingController textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search Products"),
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // 🔍 Search Field
//             TextField(
//               controller: textController,
//               onChanged: controller.searchProducts,
//               autofocus: true,
//               decoration: InputDecoration(
//                 hintText: "Search by title or category...",
//                 prefixIcon: const Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.clear),
//                   onPressed: () {
//                     textController.clear();
//                     controller.clearResults();
//                   },
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // 🔄 Results
//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 if (controller.searchResults.isEmpty) {
//                   return const Center(child: Text("No products found."));
//                 }
//
//                 return ListView.builder(
//                   itemCount: controller.searchResults.length,
//                   itemBuilder: (context, index) {
//                     final Product product = controller.searchResults[index];
//                     return ListTile(
//                       leading: Image.network(product.thumbnail, width: 50, height: 50, fit: BoxFit.cover),
//                       title: Text(product.title),
//                       subtitle: Text("₹${product.price}"),
//                       //onTap: () => Get.to(() => ProductDetailScreen(product: product)),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/product/widget/productcard.dart';
import 'package:innsouls_flutter/app/widgets/gridviewlayout.dart';

import '../controllers/search_controller.dart';

class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});

  final SearchControllers controller = Get.put(SearchControllers());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Products")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              onChanged: controller.searchProducts,
              decoration: InputDecoration(
                hintText: "Search by title or category...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    textController.clear();
                    controller.clearResults();
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.searchResults.isEmpty) {
                  return const Center(child: Text("No products found."));
                }

                // return ListView.builder(
                //   itemCount: controller.searchResults.length,
                //   itemBuilder: (context, index) {
                //     final product = controller.searchResults[index];
                //     return ListTile(
                //       leading: Image.network(product.thumbnail, width: 50, height: 50, fit: BoxFit.cover),
                //       title: Text(product.title),
                //       subtitle: Text("₹${product.price}"),
                //      // onTap: () => Get.to(() => ProductDetailScreen(product: product)),
                //     );
                //   },
                // );
                return Gridviewlayout(itemcount: controller.searchResults.length, itembuilder: (context,index){
                  final product = controller.searchResults[index];
                  return ProductCard(product: product);

                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
