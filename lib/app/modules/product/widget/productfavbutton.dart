import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/productmodel.dart';
import '../../wishlist/controllers/wishlist_controller.dart';
import '../controllers/productcontroller.dart';

class FavoriteIconButton extends StatelessWidget {
  final Product product;

  const FavoriteIconButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(WishlistController());

    return Obx(() {
      final isFav = controller.isFavorite(product);
      return InkWell(
        onTap: () => controller.toggleFavorite(product),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5),
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : Colors.grey,
            size: 18,
          ),
        ),
      );
    });
  }
}
