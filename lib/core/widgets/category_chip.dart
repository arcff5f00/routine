// lib/app/views/widgets/category_chip.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/menu/categories/categories_controller.dart';

class CategoryChip extends GetView<CategoryController> {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ScrollController scrollController = ScrollController();

    return SizedBox(
      height: 100,
      child: Obx(() => ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: controller.defaultCategories.length,
            itemBuilder: (context, index) {
              final category = controller.defaultCategories[index];

              return GestureDetector(
                onTap: () {},
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
                            color: theme.colorScheme.surface.withOpacity(1),
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
          )),
    );
  }
}
