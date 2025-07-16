import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constants/app_images.dart';
import '../../product/view/categoryofproducts.dart';

class CategoryGridRow extends StatelessWidget {
  final List categories;
  final Map<String, String> categoryImages;

  const CategoryGridRow({
    super.key,
    required this.categories,
    required this.categoryImages,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            final imagePath = categoryImages[category.slug]!;
            return _CategoryItem(
              imagePath: imagePath,
              name: category.name,
              slug: category.slug,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String slug;

  const _CategoryItem({
    required this.imagePath,
    required this.name,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.to(() => CategoryProductPage(
              categorySlug: slug,
              categoryName: name,
            ));
          },
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
