import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:routine/core/colors.dart';
import '../../core/themes/app_theme.dart';

class CustomizeController extends GetxController {
  final box = Hive.box('settings');

  final Rx<String> selectedTheme = 'System Theme'.obs;
  final RxBool isPitchBlack = false.obs;
  final Rx<Color> selectedAccentColor = AppColors.blueAccent.obs;

  // Add WidgetsBinding observer
  late final WidgetsBindingObserver _observer;

  @override
  void onInit() {
    super.onInit();
    loadSavedSettings();

    // Initialize and add the observer
    _observer = _ThemeObserver(this);
    WidgetsBinding.instance.addObserver(_observer);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      applyCurrentTheme();
      update();
    });
  }

  @override
  void onClose() {
    // Remove the observer when controller is disposed
    WidgetsBinding.instance.removeObserver(_observer);
    super.onClose();
  }

  void loadSavedSettings() {
    isPitchBlack.value = box.get('isPitchBlack', defaultValue: false);

    String savedTheme = box.get('themeMode', defaultValue: 'system');
    selectedTheme.value = _convertThemeString(savedTheme);

    int? savedColor = box.get('accentColor');
    if (savedColor != null) {
      selectedAccentColor.value = Color(savedColor);
    }
  }

  String _convertThemeString(String theme) {
    switch (theme) {
      case 'light':
        return 'Light Theme';
      case 'dark':
        return 'Dark Theme';
      default:
        return 'System Theme';
    }
  }

  String _getStorageThemeString(String displayTheme) {
    switch (displayTheme) {
      case 'Light Theme':
        return 'light';
      case 'Dark Theme':
        return 'dark';
      default:
        return 'system';
    }
  }

  void setTheme(String theme) {
    // Store the new theme
    selectedTheme.value = theme;
    box.put('themeMode', _getStorageThemeString(theme));

    // When changing themes, ensure pitch black is disabled
    if (isPitchBlack.value) {
      isPitchBlack.value = false;
      box.put('isPitchBlack', false);
    }

    applyCurrentTheme();
    update();
  }

  void togglePitchBlack(bool value) {
    isPitchBlack.value = value;
    box.put('isPitchBlack', value);

    // Apply theme immediately
    applyCurrentTheme();
    update();
  }

  void applyCurrentTheme() {
    if (isPitchBlack.value) {
      // Apply pitch black theme
      Get.changeThemeMode(ThemeMode.dark);
      Get.changeTheme(AppTheme.pitchBlackTheme(selectedAccentColor.value));
      return;
    }

    // Apply normal themes
    switch (selectedTheme.value) {
      case 'Light Theme':
        Get.changeThemeMode(ThemeMode.light);
        Get.changeTheme(AppTheme.lightTheme(selectedAccentColor.value));
        break;
      case 'Dark Theme':
        Get.changeThemeMode(ThemeMode.dark);
        Get.changeTheme(AppTheme.darkTheme(selectedAccentColor.value));
        break;
      case 'System Theme':
        Get.changeThemeMode(ThemeMode.system);
        _applySystemTheme();
        break;
    }
  }

  void _applySystemTheme() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      Get.changeTheme(AppTheme.darkTheme(selectedAccentColor.value));
    } else {
      Get.changeTheme(AppTheme.lightTheme(selectedAccentColor.value));
    }
  }

  void setAccentColor(Color color) {
    selectedAccentColor.value = color;
    box.put('accentColor', color.value);
    applyCurrentTheme();
    update();
  }

  // Method to handle system theme changes
  void onSystemThemeChanged() {
    if (selectedTheme.value == 'System Theme' && !isPitchBlack.value) {
      _applySystemTheme();
      update();
    }
  }
}

// Separate class to handle system theme changes
class _ThemeObserver extends WidgetsBindingObserver {
  final CustomizeController controller;

  _ThemeObserver(this.controller);

  @override
  void didChangePlatformBrightness() {
    controller.onSystemThemeChanged();
  }
}