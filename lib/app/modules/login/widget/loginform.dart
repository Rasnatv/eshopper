// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:innsouls_flutter/app/core/controllers/auth_controller.dart';
// import 'package:innsouls_flutter/app/modules/login/controller/logincontroller.dart';
//
// import '../../../common/style/dimens.dart';
// import '../../../common/utils/validators.dart';
// class Loginform extends StatelessWidget {
//   const Loginform({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller=Get.put(LoginController());
//     return Form(
//         key: controller.formKey,
//         child: Column(
//         children: [
//         TextFormField(
//         controller: controller.usernameController,
//         decoration: InputDecoration(labelText: "Username"),
//     validator: LoginValidator.validateUsername,
//     ),
//     Dimens.kSizedBoxH12,
//     TextFormField(
//     controller: controller.passwordController,
//     decoration: InputDecoration(labelText: "Password"),
//     validator: LoginValidator.validatePassword,
//     ),
//     Dimens.kSizedBoxH12,
//     SizedBox(width: double.infinity,child:
//     ElevatedButton(
//     onPressed: controller.submitLogin,
//     child: const Text('Login'),)
//     ),
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/core/controllers/auth_controller.dart';
import 'package:innsouls_flutter/app/modules/login/controller/logincontroller.dart';

import '../../../common/style/dimens.dart';
import '../../../common/utils/validators.dart';

class Loginform extends StatelessWidget {
  const Loginform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.usernameController,
            decoration: const InputDecoration(labelText: "Username"),
            validator: LoginValidator.validateUsername,
          ),
          Dimens.kSizedBoxH12,
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
            validator: LoginValidator.validatePassword,
          ),
          Dimens.kSizedBoxH12,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.submitLogin,
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
