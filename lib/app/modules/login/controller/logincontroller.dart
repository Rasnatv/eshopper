import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innsouls_flutter/app/core/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  void submitLogin() {
    if (formKey.currentState!.validate()) {
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();
      authController.login(username, password);
    }
  }
  }

