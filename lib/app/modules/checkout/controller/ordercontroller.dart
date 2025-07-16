
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/addressmodel.dart';
import '../../../data/models/productmodel.dart';
import '../../../core/controllers/auth_controller.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void placeOrder(List<Product> productList, String paymentMethod) {
    final auth = Get.find<AuthController>();

    if (auth.firstName.value.isEmpty || auth.phoneNumber.value.isEmpty) {
      Get.snackbar('Error', 'User profile not loaded. Please login again.');
      return;
    }

    final newOrder = Order(
      name: '${auth.firstName.value} ${auth.lastName.value}',
      address: auth.address.value,
      phone: auth.phoneNumber.value,
      paymentMethod: paymentMethod,
      products: productList,
      timestamp: DateTime.now(),
    );


    final isDuplicate = orders.any((order) {
      final sameTime = DateTime.now().difference(order.timestamp).inSeconds < 5;
      return sameTime &&
          order.name == newOrder.name &&
          order.address == newOrder.address &&
          order.phone == newOrder.phone &&
          order.paymentMethod == newOrder.paymentMethod &&
          _sameProducts(order.products, newOrder.products);
    });

    if (!isDuplicate) {
      orders.add(newOrder);
      saveOrders();
    }
  }

  bool _sameProducts(List<Product> a, List<Product> b) {
    if (a.length != b.length) return false;
    final sortedA = [...a]..sort((x, y) => x.id.compareTo(y.id));
    final sortedB = [...b]..sort((x, y) => x.id.compareTo(y.id));
    for (int i = 0; i < sortedA.length; i++) {
      if (sortedA[i].id != sortedB[i].id) return false;
    }
    return true;
  }

  void saveOrders() {
    final data = orders.map((order) => order.toJson()).toList();
    box.write('orders', data);
  }

  void loadOrders() {
    final stored = box.read<List>('orders');
    if (stored != null) {
      orders.value = stored
          .map((e) => Order.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }

  }
  void clearOrders() {
    orders.clear();
    box.remove('orders');
  }

}
