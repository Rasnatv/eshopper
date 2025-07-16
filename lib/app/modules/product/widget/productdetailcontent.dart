import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innsouls_flutter/app/common/style/app_text_style.dart';
import '../../../common/style/dimens.dart';
import '../../../data/models/productmodel.dart';

class ProductDetailContent extends StatelessWidget {
  final Product product;
  const ProductDetailContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        Center(
          child: ClipRRect(
            child: Image.network(
              product.thumbnail,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // const SizedBox(height: 20),
        Dimens.kSizedBoxH20,

        // Title
        Text(
          product.title,
          maxLines: 1,
          style: AppTextStyle.rTextNunitoBlack17w400),
        // const SizedBox(height: 10),
         Dimens.kSizedBoxH10,
        // Price & Discount
        Row(
          children: [
            Text(
              "₹${product.price}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(width: 10),
            Text(
              "${product.discountPercentage}% OFF",
              style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.w600),
            ),
          ],
        ),
       // const SizedBox(height: 10),
        Dimens.kSizedBoxH10,
        RatingBarIndicator(
          rating: product.rating,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 24,
        ),

        // Brand
        if (product.brand?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Chip(
              label: Text(product.brand!),
              backgroundColor: Colors.purple.shade50,
            ),
          ),

        // const SizedBox(height: 20),
        Dimens.kSizedBoxH20,
        // Description
        Text("Description", style:AppTextStyle.rTextNunitoBlack10w600),
        const SizedBox(height: 6),
        Text(product.description, style: const TextStyle(color: Colors.black87)),

        const Divider(height: 40),

        // Free Delivery
        Row(
          children: [
            SvgPicture.asset('assets/icons/vansvg.svg', height: 30.sp, width: 30.sp),
            const SizedBox(width: 13),
          Text("Free Delivery", style: AppTextStyle.rTextNunitoBlack10w600)]),
        const SizedBox(height: 80), // space for bottom bar
      ],
    );
  }
}
