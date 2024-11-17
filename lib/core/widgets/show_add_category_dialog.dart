import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/widgets/custom_text_field.dart';
import '../../../core/colors.dart';
import '../../presentation/menu/categories/categories_model.dart';
import '../icons.dart';
import '../strings.dart';
import 'custom_button.dart';

void showAddCategoryDialog(
    BuildContext context, Function(CategoryModel) onAdd) {
  final theme = Theme.of(context);
  final nameController = TextEditingController();
  final selectedColor = AppColors.categoryColors[0].color.obs;
  final selectedIcon = AppIcons.categoryIcons['Basic']![0].obs;
  final ScrollController iconScrollController = ScrollController();
  final ScrollController colorScrollController = ScrollController();

  final RxString errorText = ''.obs;

  nameController.addListener(() {
    if (errorText.value.isNotEmpty) {
      errorText.value = ''; // Clear the error text
    }
  });

  Get.dialog(
    Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          maxWidth: 400,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.addCategories,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.categoryName,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => CustomTextField(
                        controller: nameController,
                        hintText: AppStrings.categoryNew,
                        fillColor: Colors.transparent,
                        borderColor: theme.colorScheme.secondary,
                        textColor: theme.colorScheme.onBackground,
                        focusedBorderColor: theme.colorScheme.primary,
                        enabledBorderColor: theme.colorScheme.secondary,
                        hintTextColor:
                            theme.colorScheme.onBackground.withOpacity(0.4),
                        errorBorderColor: Colors.red,
                        errorText:
                            errorText.value.isEmpty ? null : errorText.value,
                        isInputValid: false,
                        hintTextSize: 12,
                      )),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.selectColor,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 50, // Fixed height for the list
                    child: ListView.builder(
                      controller: colorScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: AppColors.categoryColors.length,
                      itemBuilder: (context, index) {
                        final color = AppColors.categoryColors[index];
                        return Obx(() => Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: InkWell(
                                splashColor:
                                    theme.colorScheme.primary.withOpacity(0.2),
                                highlightColor:
                                    theme.colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                                onTap: () => selectedColor.value = color.color,
                                child: Container(
                                  width: 50, // Width of the outer container
                                  height: 50, // Height of the outer container
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: selectedColor.value == color.color
                                          ? theme.colorScheme.primary
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Padding(
                                    // Add padding between the border and the color box
                                    padding: selectedColor.value == color.color
                                        ? const EdgeInsets.all(
                                            2) // Space between border and color when selected
                                        : EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: color.color,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                AppStrings.selectIcon,
                style: GoogleFonts.inter(
                  fontSize: 14,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 14,
                              runSpacing: 14,
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
                                          size: 20,
                                          icon,
                                          color: selectedIcon.value == icon
                                              ? theme.colorScheme.onBackground
                                              : theme.colorScheme.onSecondary,
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
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    textPadding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    onPressed: () => Get.back(),
                    text: AppStrings.buttonCancel,
                    color: theme.colorScheme.surface,
                    textColor: theme.colorScheme.onSecondary,
                  ),
                  const SizedBox(width: 8),
                  CustomButton(
                    textPadding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    onPressed: () {
                      if (nameController.text.isEmpty) {
                        errorText.value = "Enter the Category name";
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
                    text: AppStrings.buttonAdd,
                    color: theme.colorScheme.primary,
                    textColor: theme.colorScheme.onPrimary,
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
