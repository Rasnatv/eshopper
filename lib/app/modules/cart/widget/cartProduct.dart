import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/cart/controllers/cart_controller.dart';
// class Cartproduct extends GetView<CartController>{
//    Cartproduct({super.key});
//    final cartController  = Get.find<CartController>();
//
//   @override
//   Widget build(BuildContext context) {
//     final item = cartController.cartItems[index];
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 item.product.thumbnail,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(item.product.title,
//                       style: const TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 4),
//                   Text("₹${item.product.price.toStringAsFixed(2)}",
//                       style: const TextStyle(color: Colors.green)),
//                   const SizedBox(height: 8),
//                   Container(
//                     width: 130,
//                     height: 40,
//                     padding: EdgeInsets.zero,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Row(
//                       children: [
//                         IconButton(
//                           icon: const Icon(Icons.remove, size: 18),
//                           onPressed: () => cartController.decreaseQuantity(item),
//                           constraints: const BoxConstraints(),
//                           padding: EdgeInsets.zero,
//                         ),
//                         Container(height: 24, width: 1, color: Colors.grey),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Obx(() => Text(item.quantity.value.toString())),
//                         ),
//                         Container(height: 24, width: 1, color: Colors.grey),
//                         IconButton(
//                           icon: const Icon(Icons.add, size: 18),
//                           onPressed: () => cartController.increaseQuantity(item),
//                           constraints: const BoxConstraints(),
//                           padding: EdgeInsets.zero,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: TextButton.icon(
//                 onPressed: () => cartController.removeFromCart(item.product),
//                 icon: const Icon(Icons.close, color: Colors.black),
//                 label: const Text("Remove", style: TextStyle(color: Colors.black)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/cart/controllers/cart_controller.dart';


class CartProduct extends StatelessWidget {
  final CartItem item;
  final CartController cartController = Get.find<CartController>();

  CartProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.product.thumbnail,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("₹${item.product.price.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 8),
                  _buildQuantityControls(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => cartController.removeFromCart(item.product),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControls() {
    return Container(
      width: 130,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            onPressed: () => cartController.decreaseQuantity(item),
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
          ),
          Container(height: 24, width: 1, color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Obx(() => Text(item.quantity.value.toString())),
          ),
          Container(height: 24, width: 1, color: Colors.grey),
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            onPressed: () => cartController.increaseQuantity(item),
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
