import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:innsouls_flutter/app/modules/cart/views/cart_view.dart';

import '../modules/cart/controllers/cart_controller.dart';
class DCounter extends StatelessWidget {
  DCounter({super.key, required this.onpressed,  this.iconcolor});
  final VoidCallback onpressed;
  final Color? iconcolor;
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          IconButton(onPressed:()=>Get.to(()=>CartView()), icon:Icon(Iconsax.shopping_bag,color: iconcolor,)

          ) ,
          //if (cartController.cartCount > 0)
          Obx(()=>Positioned(
              right: 4,
              top: 6,
              child:Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(100),color: Colors.black.withOpacity(0.5) ),
                  child:
                  Center(child:Text(cartController.cartItems.length.toString(),style: Theme.of(context).textTheme.labelSmall!.apply(color:Colors.white,fontSizeFactor: 0.8),)
                  )))),
        ])
    ;


  }}
