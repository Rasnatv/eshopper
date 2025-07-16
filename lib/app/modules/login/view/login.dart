import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/common/style/dimens.dart';
import 'package:innsouls_flutter/app/modules/login/widget/loginform.dart';
import 'package:innsouls_flutter/app/modules/login/widget/loginheader.dart';
import '../controller/logincontroller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(() {
            return controller.authController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                           // SizedBox(height: 90,),
                            Dimens.kSizedBoxH90,
                            LoginHeader(),
                           Dimens.kSizedBoxH20,
                           Loginform()
                        ],
                      ),
                    );
          }),
        ),
      ),
    );
  }
}
