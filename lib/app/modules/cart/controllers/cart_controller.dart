
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/storage/storage.dart';
import '../../../data/models/cartmodel.dart';
import '../../../data/models/productmodel.dart';


class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCartFromStorage();

    // Automatically sync cart changes to storage
    ever(cartItems, (_) {
      final toSave = cartItems.map((e) => e.toJson()).toList();
      Storage.saveValueForce('cartItems', toSave);
    });
  }

  void _loadCartFromStorage() {
    final savedCart = Storage.getValue<List>('cartItems');
    if (savedCart != null) {
      cartItems.assignAll(
        savedCart.map((e) => CartItem.fromJson(Map<String, dynamic>.from(e))).toList(),
      );
    }
  }

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      Get.snackbar(
        "Info",
        "${product.title} is already in cart",
        backgroundColor: Colors.green.withOpacity(0.85),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      cartItems.add(CartItem(product: product, qty: 1));
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
    Storage.removeValue('cartItems');
  }

  void removeFromCartIfExists(Product product) {
    final exists = cartItems.any((item) => item.product.id == product.id);
    if (exists) {
      cartItems.removeWhere((item) => item.product.id == product.id);
      final toSave = cartItems.map((e) => e.toJson()).toList();
      Storage.saveValueForce('cartItems', toSave);
    }
  }

  double get totalPrice => cartItems.fold(
      0, (sum, item) => sum + item.product.price * item.quantity.value);

  bool get isEmpty => cartItems.isEmpty;
}
