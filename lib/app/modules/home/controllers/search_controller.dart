import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/productmodel.dart';

class SearchControllers extends GetxController {
  var allProducts = <Product>[].obs;
  var searchResults = <Product>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List products = data['products'];
        allProducts.value = products.map((e) => Product.fromJson(e)).toList();
      } else {
        allProducts.clear();
      }
    } catch (e) {
      allProducts.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      searchResults.clear();
      return;
    }

    final queryWords = query.toLowerCase().split(' ').where((w) => w.isNotEmpty).toList();

    searchResults.value = allProducts.where((product) {
      final title = product.title.toLowerCase().replaceAll('-', ' ');
      final category = (product.category ?? '').toLowerCase().replaceAll('-', ' ');

      // Match if any word in queryWords is in title or category
      return queryWords.any((word) => title.contains(word) || category.contains(word));
    }).toList();
  }

  void clearResults() {
    searchResults.clear();
  }
}
