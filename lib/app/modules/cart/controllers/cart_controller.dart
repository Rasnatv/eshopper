
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/productmodel.dart';

class CartItem {
  final Product product;
  final RxInt quantity;

  CartItem({required this.product, int qty = 1}) : quantity = qty.obs;

  Map<String, dynamic> toJson() => {
    'product': product.toJson(),
    'quantity': quantity.value,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      qty: json['quantity'] ?? 1,
    );
  }
}

class CartController extends GetxController {
  final storage = GetStorage();
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    List<dynamic>? savedCart = storage.read<List<dynamic>>('cartItems');
    if (savedCart != null) {
      cartItems.assignAll(
        savedCart.map((e) => CartItem.fromJson(Map<String, dynamic>.from(e))).toList(),
      );
    }

    ever(cartItems, (_) {
      final toSave = cartItems.map((e) => e.toJson()).toList();
      storage.write('cartItems', toSave);
    });
  }


  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      // Do not increase quantity again
      Get.snackbar("Info", "${product.title} is already in cart",
          backgroundColor: Colors.green.withOpacity(0.85),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      cartItems.add(CartItem(product: product, qty: 1));
      //Get.snackbar("Added to Cart", "${product.title} added to cart");
    }
  }


  void removeFromCart(Product product) {
    cartItems.removeWhere((item) => item.product.id == product.id);
    Get.snackbar("Removed", "${product.title} removed from cart");
  }

  void increaseQuantity(CartItem item) {
    item.quantity.value++;
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;
    } else {
      removeFromCart(item.product);
    }
  }
  void clearCart() {
    cartItems.clear();
    GetStorage().remove('cartItems');
    //Get.snackbar("Order Placed", "Thank you for your purchase!",
       // backgroundColor: Colors.green, colorText: Colors.white);
  }
  void removeFromCartIfExists(Product product) {
    final exists = cartItems.any((item) => item.product.id == product.id);
    if (exists) {
      cartItems.removeWhere((item) => item.product.id == product.id);
      GetStorage().write('cartItems', cartItems.map((e) => e.toJson()).toList());
    }
  }


  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + item.product.price * item.quantity.value);

  bool get isEmpty => cartItems.isEmpty;
}
