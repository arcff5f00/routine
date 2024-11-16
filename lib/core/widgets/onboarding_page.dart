import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/widgets/custom_button.dart';
import 'package:routine/core/widgets/permission_card.dart';

import '../../presentation/onboarding/onboarding_controller.dart';
import '../strings.dart';

class OnboardingPage extends StatelessWidget {
  final String lightIcon;
  final String darkIcon;
  final String title;
  final String lightImage;
  final String darkImage;
  final String description;
  final bool showSkip;
  final bool slideFive;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.lightImage,
    required this.darkImage,
    required this.description,
    required this.lightIcon,
    required this.darkIcon,
    this.showSkip = true,
    this.slideFive = false,
  });

  String getIconPath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkIcon : lightIcon;
  }

  String getImagePath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkImage : lightImage;
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the OnboardingController instance
    final OnboardingController controller = Get.find<OnboardingController>();

    final theme = Theme.of(context);
    final titleColor = theme.colorScheme.onBackground;
    final descriptionColor = theme.colorScheme.onBackground.withOpacity(0.4);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  getIconPath(context),
                  width: 36,
                  height: 36,
                ),
                if (showSkip)
                  CustomButton(
                    onPressed: controller.onSkipPage,
                    text: AppStrings.buttonSkip,
                    color: theme.colorScheme.surface,
                    textColor: theme.colorScheme.onSecondary,
                    textPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
              ],
            ),
            const SizedBox(height: 96),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: descriptionColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 64),
            if (!slideFive)
              Center(
                child: SvgPicture.asset(
                  getImagePath(context),
                  width: 200,
                  height: 200,
                ),
              ),
            if (slideFive)
              Column(
                children: [
                  PermissionCard(
                      cardTitle: AppStrings.permissionOne,
                      cardDescription: AppStrings.permissionDescOne,
                      permissionLightIcon: 'assets/svgs/notification.svg',
                      permissionDarkIcon: 'assets/svgs/notification_dark.svg'),
                  SizedBox(height: 18),
                  PermissionCard(
                      cardTitle: AppStrings.permissionTwo,
                      cardDescription: AppStrings.permissionDescTwo,
                      permissionLightIcon: 'assets/svgs/storage.svg',
                      permissionDarkIcon: 'assets/svgs/storage_dark.svg'),
                  SizedBox(height: 18),
                  PermissionCard(
                      cardTitle: AppStrings.permissionThree,
                      cardDescription: AppStrings.permissionDescThree,
                      permissionLightIcon: 'assets/svgs/habit.svg',
                      permissionDarkIcon: 'assets/svgs/habit_dark.svg')
                ],
              ),
          ],
        ),
      ),
    );
  }
}
