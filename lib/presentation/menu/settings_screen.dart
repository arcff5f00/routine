import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart'; // Import package_info_plus
import '../../core/strings.dart';
import '../../routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _appVersion = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _appVersion = 'Version ${packageInfo.version}';
      });
    } catch (e) {
      setState(() {
        _appVersion = 'Version info not available';
      });
    }
  }

  void _openNotificationSettings() async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.notification);
    } catch (e) {
      debugPrint('Error opening notification settings: $e');
    }
  }

  void _openAlarmSettings() async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.alarm);
    } catch (e) {
      debugPrint('Error opening alarm settings: $e');
    }
  }

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
          AppStrings.settings,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Divider(color: theme.colorScheme.secondary),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _openNotificationSettings,
                      splashColor: theme.colorScheme.primary.withOpacity(0.2),
                      highlightColor:
                          theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 20,
                              Icons.notifications_active,
                              color: theme.colorScheme.primary.withOpacity(1),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              AppStrings.notification,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: theme.colorScheme.secondary),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _openAlarmSettings,
                      splashColor: theme.colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      highlightColor:
                          theme.colorScheme.primary.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 20,
                              Icons.alarm,
                              color: theme.colorScheme.primary.withOpacity(1),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              AppStrings.alarm,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: theme.colorScheme.secondary),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.customize);
                      },
                      splashColor: theme.colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      highlightColor:
                          theme.colorScheme.primary.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 20,
                              Icons.style,
                              color: theme.colorScheme.primary.withOpacity(1),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              AppStrings.customize,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: theme.colorScheme.secondary),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: theme.colorScheme.primary.withOpacity(0.2),
                      highlightColor:
                          theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 20,
                              Icons.backup_rounded,
                              color: theme.colorScheme.primary.withOpacity(1),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              AppStrings.backup,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: theme.colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: theme.colorScheme.secondary),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              _appVersion,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: theme.colorScheme.onSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
