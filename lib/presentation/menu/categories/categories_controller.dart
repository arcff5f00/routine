import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/icons.dart';
import 'categories_model.dart';

class CategoryController extends GetxController {
  final RxList<CategoryModel> defaultCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> customCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDefaultCategories();
  }

  // Load default categories to be shown
  void loadDefaultCategories() {
    defaultCategories.assignAll([
      CategoryModel(
        id: '1',
        name: 'Quit a bad habit',
        icon: 'block',
        color: AppColors.getHexFromColor(AppColors.categoryColors[0].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '2',
        name: 'Art',
        icon: 'brush',
        color: AppColors.getHexFromColor(AppColors.categoryColors[2].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '3',
        name: 'Entertainment',
        icon: 'local_activity',
        color: AppColors.getHexFromColor(AppColors.categoryColors[4].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '4',
        name: 'Finance',
        icon: 'attach_money',
        color: AppColors.getHexFromColor(AppColors.categoryColors[6].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '5',
        name: 'Health',
        icon: 'health_and_safety',
        color: AppColors.getHexFromColor(AppColors.categoryColors[8].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '6',
        name: 'Home',
        icon: 'home',
        color: AppColors.getHexFromColor(AppColors.categoryColors[9].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '7',
        name: 'Meditation',
        icon: 'self_improvement',
        color: AppColors.getHexFromColor(AppColors.categoryColors[10].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '8',
        name: 'Nutrition',
        icon: 'local_dining',
        color: AppColors.getHexFromColor(AppColors.categoryColors[11].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '9',
        name: 'Outdoor',
        icon: 'terrain',
        color: AppColors.getHexFromColor(AppColors.categoryColors[12].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '10',
        name: 'Social',
        icon: 'chat',
        color: AppColors.getHexFromColor(AppColors.categoryColors[13].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '11',
        name: 'Sports',
        icon: 'directions_bike',
        color: AppColors.getHexFromColor(AppColors.categoryColors[14].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '12',
        name: 'Study',
        icon: 'school',
        color: AppColors.getHexFromColor(AppColors.categoryColors[15].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '13',
        name: 'Task',
        icon: 'library_add_check',
        color: AppColors.getHexFromColor(AppColors.categoryColors[16].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '14',
        name: 'Work',
        icon: 'work',
        color: AppColors.getHexFromColor(AppColors.categoryColors[17].color),
        isDefault: true,
      ),
      CategoryModel(
        id: '15',
        name: 'Other',
        icon: 'widgets',
        color: AppColors.getHexFromColor(AppColors.categoryColors[18].color),
        isDefault: true,
      ),
      // ... Add the rest of the categories here ...
    ]);
  }

  // Add a custom category
  void addCustomCategory(CategoryModel category) {
    customCategories.add(category);
    update();
  }

  Color getColorFromHex(String hexColor) {
    final hex = hexColor.replaceAll("#", "");
    return Color(int.parse(
        '0xFF$hex')); // Ensure it's a full 6-digit hex with 0xFF prefix for opacity
  }

  // Remove a custom category
  void removeCustomCategory(String id) {
    customCategories.removeWhere((category) => category.id == id);
    update();
  }

  // Get IconData from icon string
  IconData getIconData(String iconString) {
    return AppIcons.getIconFromString(
        iconString); // Ensure this method is implemented correctly in AppIcons
  }

  // Get icon string from IconData
  String getIconString(IconData icon) {
    return AppIcons.getIconString(icon);
  }

  void updateDefaultCategory(CategoryModel editedCategory) {
    final index =
        defaultCategories.indexWhere((cat) => cat.id == editedCategory.id);
    if (index != -1) {
      defaultCategories[index] = editedCategory;
      update();
    }
  }

  void updateCustomCategory(CategoryModel editedCategory) {
    final index =
        customCategories.indexWhere((cat) => cat.id == editedCategory.id);
    if (index != -1) {
      customCategories[index] = editedCategory;
      update();
    }
  }
}
