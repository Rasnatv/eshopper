
import 'package:flutter/material.dart';
import '../../../common/style/app_text_style.dart';
import '../../../data/models/productmodel.dart';
import '../../../widgets/countofcart.dart';
import '../widget/bottomnavbar.dart';
import '../widget/productdetailcontent.dart';

class Productdetailscreen extends StatelessWidget {
  final Product product;
  const Productdetailscreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text("e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600,),
        actions: [
          DCounter( onpressed: (){},iconcolor: Colors.black.withOpacity(0.5),),
        ],
      ),
      bottomNavigationBar: DBottomAddtoCard(product: product),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ProductDetailContent(product: product),
        ),
      ),
    );
  }
}
