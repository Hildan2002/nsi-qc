import 'package:get/get.dart';

import '../controllers/record_finish_good_controller.dart';

class RecordFinishGoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecordFinishGoodController>(
      () => RecordFinishGoodController(),
    );
  }
}
