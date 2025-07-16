
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/landing_screen/views/landing_view.dart';

import '../../../core/controllers/auth_controller.dart';
import '../../../data/models/productmodel.dart';
import '../../cart/widget/bottononebutton.dart';
import '../controller/ordercontroller.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> products;
  final bool clearCartAfterOrder;

  CheckoutScreen({
    Key? key,
    required this.products,
    this.clearCartAfterOrder = false,
  }) : super(key: key);

  final AuthController authController = Get.find<AuthController>();
  final OrderController orderController = Get.put(OrderController());
  final CartController cartController = Get.find<CartController>();
  final RxString selectedPayment = 'UPI'.obs;

  @override
  Widget build(BuildContext context) {
    double totalPrice = products.fold(0, (sum, item) => sum + item.price);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomCartBar(
        amount: "₹${totalPrice.toStringAsFixed(2)}",
        buttonText: "Place Order",
        onPressed: () {
          orderController.placeOrder(products, selectedPayment.value);

          if (clearCartAfterOrder) {
            cartController.clearCart();
          } else {
            for (var product in products) {
              cartController.removeFromCartIfExists(product);
            }
          }

          Get.snackbar(
            'Order Placed',
            'Your order has been placed successfully.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          Get.off(() => LandingView());
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧍 User Info
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(() {
                  final fullName =
                  '${authController.firstName.value} ${authController.lastName.value}'.trim();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName.isEmpty ? 'Guest User' : fullName,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(authController.address.value),
                      const SizedBox(height: 4),
                      Text(authController.phoneNumber.value),
                    ],
                  );
                }),
              ),
            ),

            // 🛒 Product List
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Products", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ...products.map((product) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 📷 Thumbnail
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.thumbnail,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 60),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // 📋 Title + Delivery
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.purple.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    "Free Delivery",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // 💰 Price
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
                    const Divider(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Total: ₹${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 💳 Payment Method
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Select Payment Method",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Obx(() => Column(
                      children: [
                        RadioListTile<String>(
                          title: const Text('UPI'),
                          value: 'UPI',
                          groupValue: selectedPayment.value,
                          onChanged: (val) => selectedPayment.value = val!,
                        ),
                        RadioListTile<String>(
                          title: const Text('Cash on Delivery'),
                          value: 'COD',
                          groupValue: selectedPayment.value,
                          onChanged: (val) => selectedPayment.value = val!,
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    )
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:innsouls_flutter/app/modules/landing_screen/views/landing_view.dart';
//
// import '../../../common/dialogs/app_dialogs.dart';
// import '../../../core/controllers/auth_controller.dart';
// import '../../../data/models/productmodel.dart';
// import '../../cart/widget/bottononebutton.dart';
// import '../controller/ordercontroller.dart';
// import '../../cart/controllers/cart_controller.dart';
// // Make sure this path is correct
//
// class CheckoutScreen extends StatelessWidget {
//   final List<Product> products;
//   final bool clearCartAfterOrder;
//
//   CheckoutScreen({
//     Key? key,
//     required this.products,
//     this.clearCartAfterOrder = false,
//   }) : super(key: key);
//
//   final AuthController authController = Get.find<AuthController>();
//   final OrderController orderController = Get.put(OrderController());
//   final CartController cartController = Get.find<CartController>();
//   final RxString selectedPayment = 'UPI'.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     double totalPrice = products.fold(0, (sum, item) => sum + item.price);
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Order Summary'),
//           centerTitle: true,
//         ),
//         backgroundColor: Colors.grey.shade100,
//         bottomNavigationBar: BottomCartBar(
//           amount: "₹${totalPrice.toStringAsFixed(2)}",
//           buttonText: "Place Order",
//           onPressed: () {
//             orderController.placeOrder(products, selectedPayment.value);
//
//             if (clearCartAfterOrder) {
//               cartController.clearCart();
//             } else {
//               for (var product in products) {
//                 cartController.removeFromCartIfExists(product);
//               }
//             }
//
//             AppDialogs.orderPlacedDialog(() {
//               Get.offAll(() => LandingView());
//             });
//           },
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🧍 User Info
//               Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Obx(() {
//                     final fullName =
//                     '${authController.firstName.value} ${authController.lastName.value}'.trim();
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           fullName.isEmpty ? 'Guest User' : fullName,
//                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(authController.address.value),
//                         const SizedBox(height: 4),
//                         Text(authController.phoneNumber.value),
//                       ],
//                     );
//                   }),
//                 ),
//               ),
//
//               // 🛒 Product List
//               Card(
//                 elevation: 2,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Products", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 12),
//                       ...products.map((product) => Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // 📷 Thumbnail
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 product.thumbnail,
//                                 width: 60,
//                                 height: 60,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                 const Icon(Icons.broken_image, size: 60),
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//
//                             // 📋 Title + Delivery
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     product.title,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   Container(
//                                     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                                     decoration: BoxDecoration(
//                                       color: Colors.purple.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(6),
//                                     ),
//                                     child: const Text(
//                                       "Free Delivery",
//                                       style: TextStyle(
//                                         fontSize: 11,
//                                         color: Colors.purple,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             // 💰 Price
//                             Text(
//                               "₹${product.price}",
//                               style: const TextStyle(
//                                 color: Colors.green,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//                       const Divider(height: 30),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           "Total: ₹${totalPrice.toStringAsFixed(2)}",
//                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // 💳 Payment Method
//               Card(
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Select Payment Method",
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10),
//                       Obx(() => Column(
//                         children: [
//                           RadioListTile<String>(
//                             title: const Text('UPI'),
//                             value: 'UPI',
//                             groupValue: selectedPayment.value,
//                             onChanged: (val) => selectedPayment.value = val!,
//                           ),
//                           RadioListTile<String>(
//                             title: const Text('Cash on Delivery'),
//                             value: 'COD',
//                             groupValue: selectedPayment.value,
//                             onChanged: (val) => selectedPayment.value = val!,
//                           ),
//                         ],
//                       )),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
