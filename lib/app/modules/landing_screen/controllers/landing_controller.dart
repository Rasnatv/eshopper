import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/modules/home/views/home_view.dart';
import 'package:innsouls_flutter/app/modules/profile/views/profile_view.dart';
import 'package:innsouls_flutter/app/modules/wishlist/views/wishlist_view.dart';

import '../../../data/models/productmodel.dart';
import '../../checkout/view/myorder.dart';


class LandingController extends GetxController {
  static LandingController get to => (Get.isRegistered<LandingController>() == false) ? Get.put<LandingController>(LandingController()) : Get.find();

  LandingItem selectedPage = LandingItem.Home;

  void changePage({required LandingItem page}) {
    selectedPage = page;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget getPage() {
    switch (selectedPage) {
      case LandingItem.Home:
        return HomeView();
      case LandingItem.Wishlist:
        return WishlistView();
      // case LandingItem.filter:
      //   return FilterView();
      case LandingItem.MyOrders:
        return MyOrdersScreen();
      case LandingItem.Profile:
        return ProfileView();
    }
  }

  // void onPop() {
  //   if (selectedPage != LandingItem.Home) {
  //     selectedPage = LandingItem.Home;
  //     update();
  //     return;
  //   }
  //   Get.back();
  // }
  void onPop() {
    if (selectedPage != LandingItem.Home) {
      selectedPage = LandingItem.Home;
      update();
    } else {
      Get.back(); // Exit app or go to previous route
    }
  }

}

enum LandingItem { Home, Wishlist, MyOrders, Profile }

