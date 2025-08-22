
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/countofcart.dart';
import '../../../widgets/dismiss_keyboard_widget.dart';
import '../../../common/style/app_text_style.dart';
import '../../../common/style/dimens.dart';
import '../../cart/views/cart_view.dart';
import '../../category/views/category_gridlist.dart';
import '../../product/controllers/productcontroller.dart';
import '../../product/view/productlist.dart';
import '../widgets/searchfield.dart';
import '../widgets/section_title_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !productController.isFetchingMore.value &&
        productController.hasMore.value) {
      productController.fetchProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DismissKeyboard(
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
                "e-Shopper", style: AppTextStyle.rTextNunitoBlack20w600),
            actions: [
              DCounter(
                onpressed: () => Get.to(() => const CartView()),
                iconcolor: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Searchfield(),
                SizedBox(height: 16.h),
                SectionTitleBar(title: 'Categories', onSeeAll: () {}),
                CategoriesScreen(),
                Dimens.kSizedBoxH10,
                SectionTitleBar(title: 'Products For You'),
                Dimens.kSizedBoxH10,
                ProductListScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

