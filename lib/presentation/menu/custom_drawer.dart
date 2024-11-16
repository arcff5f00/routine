import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../core/strings.dart';
import '../../core/widgets/custom_tile.dart';
import '../../routes/app_routes.dart';
import 'custom_drawer_controller.dart'; // Import the controller

class CustomDrawer extends StatelessWidget {
  final CustomDrawerController controller = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    final String logoPath =
        isDarkMode ? 'assets/svgs/5.svg' : 'assets/svgs/5_dark.svg';
    final Color backgroundColor = theme.colorScheme.surface;
    final Color onBackgroundColor = theme.colorScheme.onBackground;
    final Color onSurfaceColor = theme.colorScheme.onSurface;
    final Color primaryColor = theme.colorScheme.primary;
    final Color secondaryColor = theme.colorScheme.background;

    final DateTime date = DateTime.now();

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40),
                Text(
                  AppStrings.menu,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: onBackgroundColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    size: 24,
                    Icons.cancel_outlined,
                    color: onSurfaceColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 12, top: 6, bottom: 12),
                child: Obx(
                  () => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: onBackgroundColor,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: ClipOval(
                                  child: SvgPicture.asset(
                                    logoPath,
                                    width: 28,
                                    height: 28,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      if (controller.isEditing.value)
                                        SizedBox(
                                          width: 150,
                                          child: TextField(
                                            controller:
                                                controller.nameController,
                                            focusNode: controller.nameFocusNode,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: onBackgroundColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            onChanged: controller.validateInput,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true,
                                            ),
                                          ),
                                        )
                                      else
                                        Text(
                                          '${controller.username.value}\'s Routine',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: onBackgroundColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (!controller.localIsInputValid.value)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        controller.localErrorText.value,
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              size: 20,
                              controller.isEditing.value
                                  ? controller.localIsInputValid.value
                                      ? Icons.check_outlined
                                      : Icons.close_outlined
                                  : Icons.edit,
                              color: controller.localIsInputValid.value
                                  ? primaryColor
                                  : Colors.red,
                            ),
                            onPressed: controller.isEditing.value
                                ? controller.localIsInputValid.value
                                    ? controller.toggleEditing
                                    : controller.cancelEditing
                                : controller.toggleEditing,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          DateFormat('EEEE, d MMMM yyyy').format(date),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: theme.colorScheme.onSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.zero,
                  topEnd: Radius.zero,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: onBackgroundColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: ClipOval(
                        child: SvgPicture.asset(
                          logoPath,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.points,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: onBackgroundColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    size: 15,
                                    Icons.favorite,
                                    color: primaryColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '1000',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: onBackgroundColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: 0.01,
                            backgroundColor: Colors.grey[200],
                            color: primaryColor,
                            minHeight: 4,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '100 points to Bronze I',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: onBackgroundColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CustomTile(
                    title: AppStrings.categories,
                    icon: Icons.category,
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(AppRoutes.categories);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTile(
                    title: AppStrings.customize,
                    icon: Icons.style,
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(AppRoutes.customize);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTile(
                    title: AppStrings.settings,
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.pop(context);
                      Get.toNamed(AppRoutes.settings);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTile(
                    title: AppStrings.backup,
                    icon: Icons.backup_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomTile(
              title: AppStrings.faq,
              icon: Icons.help,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            CustomTile(
              title: AppStrings.rate,
              icon: Icons.star,
              onTap: () {},
            ),
            const SizedBox(height: 12),
            CustomTile(
              title: AppStrings.contact,
              icon: Icons.feedback,
              onTap: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
