// routes/app_routes.dart

import 'package:get/get.dart';
import 'package:routine/presentation/home/home_screen.dart';
import 'package:routine/presentation/menu/customize_screen.dart';
import 'package:routine/presentation/menu/settings_screen.dart';
import 'package:routine/presentation/onboarding/name_screen.dart';

import '../core/custom_transition.dart';
import '../presentation/menu/categories/categories_screen.dart';
import '../presentation/onboarding/onboarding_screen.dart';

class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String name = '/name';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String customize = '/customize';
  static const String settings = '/settings';

  static List<GetPage> routes = [
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: name,
      page: () => NameScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: categories,
      page: () => CategoriesScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: customize,
      page: () => CustomizeScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
    GetPage(
      name: settings,
      page: () => SettingsScreen(),
      preventDuplicates: true,
      customTransition: MyCustomTransition(),
    ),
  ];
}
