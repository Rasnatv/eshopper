import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:innsouls_flutter/app/data/models/productmodel.dart';

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