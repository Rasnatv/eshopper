//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:innsouls_flutter/app/common/style/app_colors.dart';
// import '../../../data/models/productmodel.dart';
// import '../../../widgets/bottombar.dart';
// import '../../cart/controllers/cart_controller.dart';
// import '../../checkout/view/checkoutscreen.dart';
//
// class DBottomAddtoCard extends StatelessWidget {
//   final Product product;
//   final CartController cartController = Get.find<CartController>();
//
//   DBottomAddtoCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final isInCart = cartController.cartItems
//           .any((item) => item.product.id == product.id);
//
//       return DBottomBar(
//         firstButtonText: "Buy Now",
//         firstButtonAction: () {
//           Get.to(() => CheckoutScreen(products: [product]));
//         },
//         secondButtonText: isInCart ? "Added" : "Add to Cart",
//         secondButtonIcon: isInCart ? Icons.check_circle : Icons.shopping_cart,
//         secondButtonColor: isInCart ? Colors.green : AppColors.kPrimary,
//         secondButtonAction: () {
//           if (isInCart) {
//             Get.snackbar("Info", "${product.title} is already in cart",
//                 backgroundColor: Colors.green.withOpacity(0.85),
//                 colorText: Colors.white,
//                 snackPosition: SnackPosition.BOTTOM);
//           } else {
//             cartController.addToCart(product);
//           }
//         },
//       );
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';
import '../../../common/dialogs/app_dialog_widgets.dart';
import '../../../data/models/productmodel.dart';
import '../../../widgets/bottombar.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../checkout/view/checkoutscreen.dart';
import '../../../common/dialogs/app_dialogs.dart'; // Ensure this path is correct for DialogWidget

class DBottomAddtoCard extends StatelessWidget {
  final Product product;
  final CartController cartController = Get.find<CartController>();

  DBottomAddtoCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isInCart =
      cartController.cartItems.any((item) => item.product.id == product.id);

      return DBottomBar(
        firstButtonText: "Buy Now",
        firstButtonAction: () {
          Get.to(() => CheckoutScreen(products: [product]));
        },
        secondButtonText: isInCart ? "Added" : "Add to Cart",
        secondButtonIcon: isInCart ? Icons.check_circle : Icons.shopping_cart,
        secondButtonColor: isInCart ? Colors.green : AppColors.kPrimary,
        secondButtonAction: () {
          if (isInCart) {
            showDialog(
              context: context,
              builder: (_) => const DialogWidget(
                title: 'Already in Cart',
                message: 'This product is already in your cart.',
                iconPath: 'assets/icons/cart.svg',
                iconColor: Colors.green,
                positiveButtonText: 'Okay',
              ),
            );
          } else {
            cartController.addToCart(product);
            showDialog(
              context: context,
              builder: (_) => DialogWidget(
                title: 'Added to Cart',
                message: '${product.title} has been added successfully.',
                iconPath: 'assets/icons/cart.svg',
                iconColor: Colors.green,
                positiveButtonText: 'Continue ',
              ),
            );
          }
        },
      );
    });
  }
}
