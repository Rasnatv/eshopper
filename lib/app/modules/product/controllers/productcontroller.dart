
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/controllers/auth_controller.dart';
import '../../../data/models/productmodel.dart';

class ProductController extends GetxController {
  //final _storage = GetStorage();

  var isLoading = false.obs;
  var isFetchingMore = false.obs;
  var hasMore = true.obs;
  var products = <Product>[].obs;
  var cartItems = <Product>[].obs;
  var categoryProducts = <Product>[].obs;
  var isCategoryLoading = false.obs;

  final int limit = 10;
  int skip = 0;

  String get token => Get.find<AuthController>().token.value;

  bool get isLoggedIn => Get.find<AuthController>().isLoggedIn;

  @override
  void onInit() {
    super.onInit();
    if (isLoggedIn) {
      fetchProducts(isInitial: true);
    }
    // loadFavoritesFromStorage();
  }

  Future<void> fetchProducts({bool isInitial = false}) async {
    if (!isLoggedIn) return;

    if (isInitial) {
      skip = 0;
      hasMore.value = true;
      products.clear();
    }

    if (isFetchingMore.value || !hasMore.value) return;

    if (isInitial) isLoading.value = true;
    isFetchingMore.value = true;

    final url = 'https://dummyjson.com/auth/products?limit=$limit&skip=$skip';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newProducts = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();

        if (newProducts.length < limit) {
          hasMore.value = false;
        }

        products.addAll(newProducts);
        skip += limit;
      } else if (response.statusCode == 401) {
        Get.snackbar('Session Expired', 'Please log in again');
        Get.find<AuthController>().logout();
        return;
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }

  Future<void> fetchProductsByCategory(String categorySlug) async {
    if (!isLoggedIn) return;

    isCategoryLoading.value = true;
    categoryProducts.clear();

    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/auth/products/category/$categorySlug'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List newProducts = data['products'];
        categoryProducts.value =
            newProducts.map((e) => Product.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        Get.snackbar('Session Expired', 'Please log in again');
        Get.find<AuthController>().logout();
        return;
      } else {
        Get.snackbar('Error', 'Failed to fetch category products');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isCategoryLoading.value = false;
    }
  }
}