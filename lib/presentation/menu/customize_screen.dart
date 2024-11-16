import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/colors.dart';
import '../../core/strings.dart';
import '../../core/widgets/custom_text_tile.dart';
import 'customize_screen_controller.dart';

class CustomizeScreen extends StatelessWidget {
  final CustomizeController controller = Get.put(CustomizeController());

  final List<Color> accentColors = [
    AppColors.redAccent,
    AppColors.orangeAccent,
    AppColors.yellowAccent,
    AppColors.greenAccent,
    AppColors.blueAccent, // Default accent color
    AppColors.cobaltAccent,
    AppColors.pinkAccent,
    AppColors.magentaAccent,
    AppColors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.customize,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showThemeDialog(context),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _showThemeDialog(context),
                  splashColor: theme.colorScheme.primary.withOpacity(0.2),
                  highlightColor: theme.colorScheme.primary.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                      children: [
                        Divider(color: theme.colorScheme.secondary),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.theme,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Obx(() {
                              return Text(
                                controller.selectedTheme.value,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: theme.colorScheme.onSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(color: theme.colorScheme.secondary),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.pitchBlack,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(() {
                      return Transform.scale(
                        scale: 0.75,
                        child: Switch(
                          value: controller.isPitchBlack.value,
                          onChanged: (bool newValue) {
                            controller.togglePitchBlack(newValue);
                            Fluttertoast.showToast(
                              msg: newValue
                                  ? "Pitch black theme is enabled!"
                                  : "Pitch black theme is disabled!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          activeColor: theme.colorScheme.primary,
                          inactiveThumbColor: theme.colorScheme.onBackground,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Divider(color: theme.colorScheme.secondary),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.accent,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: theme.colorScheme.onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: accentColors.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                              onTap: () {
                                controller.setAccentColor(accentColors[index]);
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                // Space around the box and the border
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color:
                                        controller.selectedAccentColor.value ==
                                                accentColors[index]
                                            ? theme.colorScheme.primary
                                            : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: accentColors[index],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ));
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: theme.colorScheme.background,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 14),
            // Remove padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      // Adjust padding for title
                      child: Text(
                        AppStrings.selectTheme,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: theme.colorScheme.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        size: 20,
                        Icons.cancel_outlined,
                        color: theme.colorScheme.onBackground,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Divider(color: theme.colorScheme.secondary),
                CustomTextTile(
                  title: AppStrings.system,
                  onTap: () {
                    controller.setTheme(AppStrings.system);
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                      msg: "📱 System theme is selected!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  icon: Icons.phone_android_rounded,
                ),
                Divider(color: theme.colorScheme.secondary),
                CustomTextTile(
                  title: AppStrings.light,
                  onTap: () {
                    controller.setTheme(AppStrings.light);
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                      msg: "☀️ Light theme is selected!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  icon: Icons.light_mode,
                ),
                Divider(color: theme.colorScheme.secondary),
                CustomTextTile(
                  title: AppStrings.dark,
                  onTap: () {
                    controller.setTheme(AppStrings.dark);
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                      msg: "🌙 Dark theme is selected!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  icon: Icons.dark_mode,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
