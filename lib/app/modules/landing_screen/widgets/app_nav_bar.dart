
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innsouls_flutter/app/common/constants/app_icons.dart';
import 'package:innsouls_flutter/app/common/style/app_colors.dart';
import 'package:innsouls_flutter/app/modules/landing_screen/controllers/landing_controller.dart';
import 'package:innsouls_flutter/app/modules/landing_screen/widgets/app_nav_item.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.shimmerGray, width: 2.sp))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppNavItem(iconPath: AppIcons.homeIcon, value: LandingItem.Home, padding: EdgeInsets.only(left: 14.sp)),
            AppNavItem(iconPath: AppIcons.wishlistIcon, value: LandingItem.Wishlist),
            //AppNavItem(iconPath: AppIcons.filterIcon, value: LandingItem.filter),
            AppNavItem(iconPath: AppIcons.cartIcon, value: LandingItem.MyOrders),
            AppNavItem(iconPath: AppIcons.profileIcon, value: LandingItem.Profile, padding: EdgeInsets.only(right: 14.sp))
          ],
        ),
      ),
    );
  }
}
