

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/checkout/view/checkoutscreen.dart';
import '../controllers/cart_controller.dart';
import '../widget/bottononebutton.dart';

import '../widget/cartProduct.dart';
import '../widget/bottononebutton.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cart"),centerTitle: true,),
        body: Obx(() {
          if (controller.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              final item = controller.cartItems[index];
              return CartProduct(item: item);
            },
          );
        }),
        bottomNavigationBar: Obx(() {
          if (controller.cartItems.isEmpty) return const SizedBox.shrink();

          return BottomCartBar(
            title: "Total:",
            amount: "₹${controller.totalPrice.toStringAsFixed(2)}",
            buttonText: "Checkout",
            onPressed: () {
              final products = controller.cartItems.map((e) => e.product).toList();
              Get.to(() => CheckoutScreen(
                products: products,
                clearCartAfterOrder: true,
              ));
            },
          );
        }),
      ),
    );
  }
}
