import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/strings.dart';
import '../../presentation/today/today_controller.dart';

class CustomDrawerController extends GetxController {
  final TodayController todayController = Get.put(TodayController());

  RxBool isEditing = false.obs;
  RxString localErrorText = ''.obs;
  RxBool localIsInputValid = true.obs;
  RxString username = ''.obs;

  late TextEditingController nameController;
  late FocusNode nameFocusNode;

  @override
  void onInit() {
    super.onInit();
    username.value = todayController.username.value;
    nameController = TextEditingController(text: username.value);
    nameFocusNode = FocusNode();
  }

  @override
  void onClose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.onClose();
  }

  void validateInput(String value) {
    if (value.isEmpty) {
      localErrorText.value = 'Your name please!';
      localIsInputValid.value = false;
    } else if (value.startsWith(' ')) {
      localErrorText.value = AppStrings.space;
      localIsInputValid.value = false;
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      localErrorText.value = AppStrings.number;
      localIsInputValid.value = false;
    } else if (RegExp(r'[^\p{L}\p{M}\s]', unicode: true).hasMatch(value)) {
      localErrorText.value = AppStrings.symbol;
      localIsInputValid.value = false;
    } else {
      localErrorText.value = '';
      localIsInputValid.value = true;
    }
  }

  void toggleEditing() {
    if (isEditing.value && localIsInputValid.value) {
      todayController.username.value = nameController.text;
      username.value = nameController.text;
    }

    isEditing.value = !isEditing.value;

    if (isEditing.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(Get.context!).requestFocus(nameFocusNode);
      });
    }
  }

  void cancelEditing() {
    isEditing.value = false;
    localErrorText.value = '';
    localIsInputValid.value = true;
    nameController.text = username.value;
  }
}
