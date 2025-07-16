


import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/controllers/auth_controller.dart';
import '../../../data/models/categorymodel.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = false.obs;

  String get token => Get.find<AuthController>().token.value;
  bool get isLoggedIn => Get.find<AuthController>().isLoggedIn;

  @override
  void onInit() {
    super.onInit();
    if (isLoggedIn) {
      fetchCategories();
    }
  }

  void fetchCategories() async {
    if (!isLoggedIn) return;

    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse('https://dummyjson.com/auth/products/categories'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        categories.value = jsonList.map((e) => Category.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        Get.snackbar("Session Expired", "Please log in again");
        Get.find<AuthController>().logout();
        return;
      } else {
        Get.snackbar("Error", "Failed to load categories: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
