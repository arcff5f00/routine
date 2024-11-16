import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:routine/core/strings.dart';
import 'package:routine/presentation/today/today_controller.dart';
import '../../core/widgets/custom_date_picker_timeline.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  TodayScreenState createState() => TodayScreenState();
}

class TodayScreenState extends State<TodayScreen> {
  final TodayController controller = Get.put(TodayController());
  DateTime selectedDate = DateTime.now();

  String _getDateDisplayText(DateTime date) {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime tomorrow = today.add(const Duration(days: 1));

    if (_isSameDay(date, today)) {
      return AppStrings.today;
    } else if (_isSameDay(date, yesterday)) {
      return AppStrings.yesterday;
    } else if (_isSameDay(date, tomorrow)) {
      return AppStrings.tomorrow;
    } else {
      return DateFormat('EEE, d MMM yyyy').format(date);
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final String name = controller.username.value;
        final theme = Theme.of(context);
        final isDarkMode = theme.brightness == Brightness.dark;
        final String logoPath =
            isDarkMode ? 'assets/svgs/5.svg' : 'assets/svgs/5_dark.svg';

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: ClipOval(
                        child:
                            SvgPicture.asset(logoPath, width: 28, height: 28),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$name\'s Routine',
                          style: GoogleFonts.inter(
                            color: theme.colorScheme.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _getDateDisplayText(selectedDate),
                          style: GoogleFonts.inter(
                            color:
                                theme.colorScheme.onBackground.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(), // Pushes the icons to the right side
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search, size: 24),
                          color: theme.colorScheme.onBackground,
                          onPressed: () {
                            // Implement search action
                          },
                        ),
                        const SizedBox(width: 0), // Space between icons
                        IconButton(
                          icon: Icon(Icons.calendar_month, size: 24),
                          color: theme.colorScheme.onBackground,
                          onPressed: () {
                            // Implement calendar action
                          },
                        ),
                        const SizedBox(width: 26),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomDatePickerTimeline(
                  startDate: DateTime.now().subtract(const Duration(days: 60)),
                  endDate: DateTime.now().add(const Duration(days: 60)),
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('Content for the selected date will go here.'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
