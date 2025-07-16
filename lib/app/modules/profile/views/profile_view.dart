
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/controllers/auth_controller.dart';
import '../../landing_screen/controllers/landing_controller.dart';
import '../widget/menulist.dart';

class ProfileView extends GetView<AuthController> {
  ProfileView({super.key});
  @override
  final _authCtrl  = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text('Account'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Get.find<LandingController>().changePage(page: LandingItem.Home);
        },
      ),
    ),

      body: Obx(() {
        if (_authCtrl.isProfileLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final isGuest = !_authCtrl.isLoggedIn;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/download.png'), // Replace with actual path or network
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isGuest
                              ? 'Guest User'
                              : '${_authCtrl.firstName.value} ${_authCtrl.lastName.value}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isGuest ? 'No email' : _authCtrl.email.value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 6, color: Colors.grey[100]),
              Menulist()

            ]),
          ),
        );
      }),
    );
  }
}
