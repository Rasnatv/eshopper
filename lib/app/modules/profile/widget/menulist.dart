import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/dialogs/app_dialogs.dart';
import '../../../core/controllers/auth_controller.dart';
import '../../checkout/view/myorder.dart';

import 'menustitle.dart';
class Menulist extends StatelessWidget {
  const Menulist({super.key});
  @override
  Widget build(BuildContext context) {
    final _authCtrl = Get.find<AuthController>();
    final bool isGuest = !_authCtrl.isLoggedIn;
    return Column(children: [
      DSettingMenutile(
        icon: Iconsax.safe_home,
        title: 'My Home',
        subtitle: 'Set Shopping Delivery address',
        ontap: () {},
      ),
      DSettingMenutile(
        icon: Iconsax.card,
        title: 'My Cart',
        subtitle: 'Add, remove products and move to checkout',
        ontap: () {},
      ),
      DSettingMenutile(
        icon: Iconsax.bag_tick,
        title: 'My Order',
        subtitle: 'Inprogress and complete order',
        ontap: () => Get.to(MyOrdersScreen()),
      ),
      DSettingMenutile(
        icon: Iconsax.bank4,
        title: 'Bank Account',
        subtitle: 'Withdraw balance to registered bank account',
        ontap: () {},
      ),
      DSettingMenutile(
        icon: Iconsax.discount_shape,
        title: 'My Coupons',
        subtitle: 'List of discount coupons',
        ontap: () {},
      ),
      DSettingMenutile(
        icon: Iconsax.notification,
        title: 'Notification',
        subtitle: 'Set any kind of notification message',
        ontap: () {},
      ),
      DSettingMenutile(
        icon: Iconsax.security_user,
        title: 'Account Privacy',
        subtitle: 'Manage usage and connected accounts',
        ontap: () {},
      ),
      const SizedBox(height: 5),
      if (!isGuest)
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => AppDialogs.confirmLogout(),
            child: Text(
              "Log Out",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.black),
            ),
          ),
        ),
      const SizedBox(height: 50),
    ]);
  }
}
