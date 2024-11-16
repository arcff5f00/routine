// lib/app/bindings/category_binding.dart
import 'package:get/get.dart';

import 'categories_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
