import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routine/core/widgets/onboarding_page.dart';
import '../../core/strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/progress_bar.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 72),
              CustomProgressBar(progress: controller.currentProgress.value),
              const SizedBox(height: 40),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.pages.length,
                  onPageChanged: (int page) {
                    controller.currentPage.value = page;
                    controller.updateProgress();
                  },
                  itemBuilder: (context, index) {
                    final page = controller.pages[index];
                    return OnboardingPage(
                      title: page['title'],
                      lightImage: page['lightImage'],
                      darkImage: page['darkImage'],
                      description: page['description'],
                      lightIcon: page['lightIcon'],
                      darkIcon: page['darkIcon'],
                      showSkip: page['showSkip'],
                      slideFive: page['slideFive'],
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              _buildNavigationButtons(context, theme),
              const SizedBox(height: 72),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons(BuildContext context, ThemeData theme) {
    final controller = Get.find<OnboardingController>();
    final isLastPage =
        controller.currentPage.value == controller.pages.length - 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isLastPage) ...[
          if (controller.currentPage.value > 0)
            CustomButton(
              onPressed: controller.onBackPage,
              text: AppStrings.buttonBack,
              color: theme.colorScheme.surface,
              textColor: theme.colorScheme.onSecondary,
            ),
          const Spacer(),
          CustomButton(
            onPressed: controller.onNextPage,
            text: AppStrings.buttonNext,
            color: theme.colorScheme.primary,
            textColor: theme.colorScheme.onPrimary,
          ),
        ],
        if (isLastPage)
          Expanded(
            child: CustomButton(
              onPressed: controller.requestPermissions,
              text: AppStrings.buttonGrant,
              color: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
              textPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
      ],
    );
  }
}
