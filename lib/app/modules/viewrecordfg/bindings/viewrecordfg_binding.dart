import 'package:get/get.dart';

import '../controllers/viewrecordfg_controller.dart';

class ViewrecordfgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewrecordfgController>(
      () => ViewrecordfgController(),
    );
  }
}
