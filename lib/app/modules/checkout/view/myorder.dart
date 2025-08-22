//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../landing_screen/controllers/landing_controller.dart';
// import '../controller/ordercontroller.dart';
//
//
// class MyOrdersScreen extends StatelessWidget {
//   final OrderController orderController = Get.put(OrderController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('My Orders'),
//     leading: IconButton(
//     icon: const Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () {
//       Get.find<LandingController>().changePage(page: LandingItem.Home);
//     })),
//       body: Obx(() {
//         if (orderController.orders.isEmpty) {
//           return const Center(child: Text('No orders yet.'));
//         }
//         return ListView.builder(
//           itemCount: orderController.orders.length,
//           itemBuilder: (context, index) {
//             final order = orderController.orders[index];
//             final product = order.products.first;
//             return Card(
//               margin: const EdgeInsets.all(8),
//               child: ListTile(
//                 leading: Image.network(product.thumbnail, width: 50, height: 50),
//                 title: Text(product.title),
//                 subtitle: Text(
//                     'Price: \$${product.price}\nPayment: ${order.paymentMethod}\nDate: ${order.timestamp.toLocal().toString().split('.')[0]}'
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../landing_screen/controllers/landing_controller.dart';
import '../controller/ordercontroller.dart';

class MyOrdersScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.find<LandingController>().changePage(page: LandingItem.Home);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            tooltip: 'Clear All Orders',
            onPressed: () {
              if (orderController.orders.isNotEmpty) {
                Get.defaultDialog(
                  title: 'Clear Orders',
                  middleText: 'Are you sure you want to clear all orders?',
                  confirm: ElevatedButton(
                    onPressed: () {
                      orderController.clearOrders();
                      Get.back(); // Close dialog
                    },
                    child: const Text('Yes'),
                  ),
                  cancel: TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                );
              } else {
                Get.snackbar('No Orders', 'There are no orders to clear.');
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (orderController.orders.isEmpty) {
          return const Center(child: Text('No orders yet.'));
        }

        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment: ${order.paymentMethod}\nDate: ${order.timestamp.toLocal().toString().split('.')[0]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ...order.products.map((product) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.network(product.thumbnail, width: 50, height: 50),
                      title: Text(product.title),
                      subtitle: Text('Price: \₹${product.price}'),
                    )),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
