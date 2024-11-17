import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../routes/app_routes.dart';
import '../../core/strings.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  var currentProgress = 0.0.obs;
  final PageController pageController = PageController();

  final List<Map<String, dynamic>> pages = [
    {
      'title': AppStrings.slideOneTitle,
      'lightImage': 'assets/svgs/1.svg',
      'darkImage': 'assets/svgs/1_dark.svg',
      'description': AppStrings.slideOneDescription,
      'lightIcon': 'assets/svgs/routine.svg',
      'darkIcon': 'assets/svgs/routine_dark.svg',
      'showSkip': true,
      'slideFive': false
    },
    {
      'title': AppStrings.slideTwoTitle,
      'lightImage': 'assets/svgs/2.svg',
      'darkImage': 'assets/svgs/2_dark.svg',
      'description': AppStrings.slideTwoDescription,
      'lightIcon': 'assets/svgs/task.svg',
      'darkIcon': 'assets/svgs/task_dark.svg',
      'showSkip': true,
      'slideFive': false
    },
    {
      'title': AppStrings.slideThreeTitle,
      'lightImage': 'assets/svgs/3.svg',
      'darkImage': 'assets/svgs/3_dark.svg',
      'description': AppStrings.slideThreeDescription,
      'lightIcon': 'assets/svgs/habit.svg',
      'darkIcon': 'assets/svgs/habit_dark.svg',
      'showSkip': true,
      'slideFive': false
    },
    {
      'title': AppStrings.slideFourTitle,
      'lightImage': 'assets/svgs/4.svg',
      'darkImage': 'assets/svgs/4_dark.svg',
      'description': AppStrings.slideFourDescription,
      'lightIcon': 'assets/svgs/privacy.svg',
      'darkIcon': 'assets/svgs/privacy_dark.svg',
      'showSkip': true,
      'slideFive': false
    },
    {
      'title': AppStrings.slideFiveTitle,
      'lightImage': 'assets/svgs/1.svg',
      'darkImage': 'assets/svgs/1_dark.svg',
      'description': AppStrings.slideFiveDescription,
      'lightIcon': 'assets/svgs/routine.svg',
      'darkIcon': 'assets/svgs/routine_dark.svg',
      'showSkip': false,
      'slideFive': true
    },
  ];

  @override
  void onInit() {
    super.onInit();
    updateProgress();
  }

  void updateProgress() {
    currentProgress.value = (currentPage.value + 1) / pages.length;
  }

  void onNextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
      updateProgress();
    }
  }

  void onBackPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage.value--;
      updateProgress();
    }
  }

  void onSkipPage() {
    currentPage.value = pages.length - 1;
    pageController.jumpToPage(currentPage.value);
    updateProgress();
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.notification,
      Permission.calendarFullAccess,
    ].request();

    statuses.forEach((permission, status) {
      if (status.isGranted) {
        Fluttertoast.showToast(
            msg: "🚀 Permissions are granted!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);

        Get.toNamed(AppRoutes.name);
      } else if (status.isDenied) {
        print('Permission $permission is denied');
      }
    });
  }
}
