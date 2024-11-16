import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../routes/app_routes.dart';
import 'name_controller.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  NameScreenState createState() => NameScreenState();
}

class NameScreenState extends State<NameScreen> {
  final NameController controller = Get.put(NameController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final descriptionColor = theme.colorScheme.onBackground.withOpacity(0.4);
    final String smileyPath =
        isDarkMode ? 'assets/svgs/5_dark.svg' : 'assets/svgs/5.svg';
    final String logoPath =
        isDarkMode ? 'assets/svgs/routine_dark.svg' : 'assets/svgs/routine.svg';

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 116),
                  SvgPicture.asset(logoPath, width: 36, height: 36),
                  SizedBox(height: 16),
                  Center(
                      child: SvgPicture.asset(smileyPath,
                          width: 104, height: 104)),
                  SizedBox(height: 40),
                  Text(
                    AppStrings.name,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 8),
                  Obx(
                    () => CustomTextField(
                      controller: controller.nameController,
                      hintText: AppStrings.nameHint,
                      fillColor: Colors.transparent,
                      borderColor: theme.colorScheme.secondary,
                      textColor: theme.colorScheme.onBackground,
                      focusedBorderColor: theme.colorScheme.primary,
                      enabledBorderColor: theme.colorScheme.secondary,
                      hintTextColor:
                          theme.colorScheme.onBackground.withOpacity(0.4),
                      errorText: controller.errorText.value.isEmpty
                          ? null
                          : controller.errorText.value,
                      isInputValid: controller.isInputValid.value,
                      errorBorderColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppStrings.nameDescription,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: descriptionColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  onPressed: controller.isButtonEnabled.value
                      ? () {
                          // Show toast message
                          Fluttertoast.showToast(
                              msg: "Welcome ${controller.username} ! 🎉",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16.0);

                          // Navigate to the next screen
                          Get.toNamed(AppRoutes.home);
                        }
                      : null,
                  text: AppStrings.buttonComplete,
                  color: controller.isButtonEnabled.value
                      ? theme.colorScheme.primary
                      : theme.colorScheme.primary.withOpacity(0.5),
                  textColor: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          SizedBox(height: 72),
        ],
      ),
    );
  }
}
