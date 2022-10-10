import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/record_finish_good/bindings/record_finish_good_binding.dart';
import '../modules/record_finish_good/views/record_finish_good_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RECORD_FINISH_GOOD,
      page: () => const RecordFinishGoodView(),
      binding: RecordFinishGoodBinding(),
    ),
  ];
}
