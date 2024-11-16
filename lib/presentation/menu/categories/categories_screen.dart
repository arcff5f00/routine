import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/show_add_category_dialog.dart';
import '../../../core/widgets/show_edit_category_dialog.dart';
import 'categories_controller.dart';
import 'categories_model.dart';

class CategoriesScreen extends GetView<CategoryController> {
  final CategoryController controller = Get.put(CategoryController());

  Widget buildCategoryChips(List<CategoryModel> categories, ThemeData theme,
      ScrollController scrollController, bool isDefault) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              showEditCategoryDialog(
                context,
                category,
                (editedCategory) {
                  // Handle category editing
                  if (isDefault) {
                    controller.updateDefaultCategory(editedCategory);
                  } else {
                    controller.updateCustomCategory(editedCategory);
                  }
                },
                (categoryId) {
                  // Handle category deletion
                  if (!isDefault) {
                    controller.removeCustomCategory(categoryId);
                  }
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.onSecondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              width: 64,
              margin: const EdgeInsets.only(right: 8),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: controller
                            .getColorFromHex(category.color)
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        size: 40,
                        controller.getIconData(category.icon),
                        color: controller.getColorFromHex(category.color),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          category.name,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: theme.colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        if (category.usage != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Usage',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: theme.colorScheme.onBackground
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                category.usage.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: theme.colorScheme.onBackground
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultScrollController = ScrollController();
    final customScrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          AppStrings.categories,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      // Default Categories Section
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.defaultCategories,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.defaultCategories.length
                                        .toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: theme.colorScheme.onSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                      Obx(() => buildCategoryChips(
                            controller.defaultCategories,
                            theme,
                            defaultScrollController,
                            true, // isDefault
                          )),
                      const SizedBox(height: 32),
                      Divider(
                        color: theme.colorScheme.secondary,
                      ),
                      const SizedBox(height: 32),

                      // Custom Categories Section
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.customCategories,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: theme.colorScheme.onBackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.customCategories.length
                                        .toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      color: theme.colorScheme.onSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                      Obx(
                        () => controller.customCategories.isEmpty
                            ? GestureDetector(
                                onTap: () =>
                                    showAddCategoryDialog(context, (category) {
                                  controller.addCustomCategory(category);
                                }),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surface,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          size: 24,
                                          Icons.category,
                                          color: theme.colorScheme.onSecondary
                                              .withOpacity(0.5),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          AppStrings.addCategories,
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            color: theme.colorScheme.onSecondary
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : buildCategoryChips(
                                controller.customCategories,
                                theme,
                                customScrollController,
                                false, // isDefault
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: CustomButton(
              onPressed: () => showAddCategoryDialog(context, (category) {
                controller.addCustomCategory(category);
              }),
              text: AppStrings.buttonCategory,
              color: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 72),
        ],
      ),
    );
  }
}
