import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors.dart';
import '../../presentation/menu/categories/categories_model.dart';
import '../icons.dart';

void showAddCategoryDialog(
    BuildContext context, Function(CategoryModel) onAdd) {
  final theme = Theme.of(context);
  final nameController = TextEditingController();
  final selectedColor = AppColors.categoryColors[0].color.obs;
  final selectedIcon = AppIcons.categoryIcons['Basic']![0].obs;
  final ScrollController iconScrollController = ScrollController();
  final ScrollController colorScrollController = ScrollController();

  Get.dialog(
    Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: 400,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Custom Category',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Select Color',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  controller: colorScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: AppColors.categoryColors.length,
                  itemBuilder: (context, index) {
                    final color = AppColors.categoryColors[index];
                    return Obx(() => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            splashColor:
                                theme.colorScheme.primary.withOpacity(0.2),
                            highlightColor:
                                theme.colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                            onTap: () => selectedColor.value = color.color,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color.color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColor.value == color.color
                                      ? theme.colorScheme.primary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Select Icon',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: theme.colorScheme.onSecondary.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView(
                    controller: iconScrollController,
                    children: AppIcons.categoryIcons.entries.map((entry) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              entry.key,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: entry.value.map((icon) {
                                return Obx(() => InkWell(
                                      splashColor: theme.colorScheme.primary
                                          .withOpacity(0.2),
                                      highlightColor: theme.colorScheme.primary
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      onTap: () => selectedIcon.value = icon,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: selectedIcon.value == icon
                                              ? theme.colorScheme.primary
                                                  .withOpacity(0.1)
                                              : null,
                                          border: Border.all(
                                            color: selectedIcon.value == icon
                                                ? theme.colorScheme.primary
                                                : Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Icon(
                                          icon,
                                          color: selectedIcon.value == icon
                                              ? theme.colorScheme.primary
                                              : theme.colorScheme.onBackground,
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Enter the Category name",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }

                      // Get the string representation of the selected icon
                      final iconString =
                          AppIcons.getIconString(selectedIcon.value);

                      if (iconString == 'category') {
                        Fluttertoast.showToast(
                            msg: "Please select an icon",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        return;
                      }

                      final newCategory = CategoryModel(
                        id: DateTime.now().toString(),
                        name: nameController.text,
                        icon: iconString,
                        // Use the correct icon string
                        color: AppColors.getHexFromColor(selectedColor.value),
                        isDefault: false,
                      );
                      onAdd(newCategory);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Add',
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
