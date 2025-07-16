import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/login/view/login.dart';
import 'package:innsouls_flutter/app/modules/product/bindings/product_binding.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_gridlist.dart';
import '../modules/landing_screen/bindings/landing_binding.dart';
import '../modules/landing_screen/views/landing_view.dart';
import '../modules/login/bindings/LoginBinding.dart';
import '../modules/product/view/productlist.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding:LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () =>ProductListScreen(),
     binding:ProductBinding(),
    ),

    GetPage(
      name: _Paths.LANDING,
      page: () =>  LandingView(),
      binding: LandingBinding(),
     // bindings: [HomeBinding(),WishlistBinding()]
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () =>  HomeView(),
    //   // binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistView(),
      binding: WishlistBinding(),
    ),

    GetPage(
      name: _Paths.CART,
      page: () =>  CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () =>  ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORYS,
      page: () => CategoriesScreen(),
        binding: CategoryBinding()
    ),
  ];
}
