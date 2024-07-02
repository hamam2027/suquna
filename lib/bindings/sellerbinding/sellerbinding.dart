import 'package:get/get.dart';
import 'package:suquna/controller/sellercontrollers/sellercontroller.dart';

class SellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Sellercontroller>(
      () => Sellercontroller(),
    );
  }
}
