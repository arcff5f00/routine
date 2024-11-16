import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:routine/presentation/menu/customize_screen_controller.dart';
import 'package:routine/presentation/onboarding/name_controller.dart';
import 'package:routine/presentation/today/today_controller.dart';
import 'package:routine/routes/app_routes.dart';

import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');

  Get.put(NameController());
  Get.put(TodayController());
  Get.put(CustomizeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CustomizeController customizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          initialRoute: AppRoutes.onboarding,
          getPages: AppRoutes.routes,
          theme: AppTheme.lightTheme(
              customizeController.selectedAccentColor.value),
          darkTheme: customizeController.isPitchBlack.value
              ? AppTheme.pitchBlackTheme(
                  customizeController.selectedAccentColor.value)
              : AppTheme.darkTheme(
                  customizeController.selectedAccentColor.value),
          themeMode: _getThemeMode(customizeController.selectedTheme.value),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            final Brightness brightness = Theme.of(context).brightness;
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
            ));
            return child!;
          },
        ));
  }

  ThemeMode _getThemeMode(String theme) {
    switch (theme) {
      case 'Light Theme':
        return ThemeMode.light;
      case 'Dark Theme':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
