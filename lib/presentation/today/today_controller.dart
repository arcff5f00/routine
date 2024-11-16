import 'package:get/get.dart';
import '../onboarding/name_controller.dart';

class TodayController extends GetxController {
  final NameController nameController = Get.find();
  RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    username.value = nameController.nameController.text;
    nameController.nameController.addListener(() {
      username.value = nameController.nameController.text;
    });
  }

  @override
  void onClose() {
    nameController.nameController.removeListener(() {
      username.value = nameController.nameController.text;
    });
    super.onClose();
  }
}
