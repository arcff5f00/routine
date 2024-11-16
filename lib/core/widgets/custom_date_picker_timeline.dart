import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDatePickerTimeline extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final ValueChanged<DateTime>? onDateSelected;

  const CustomDatePickerTimeline({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onDateSelected,
  });

  @override
  CustomDatePickerTimelineState createState() =>
      CustomDatePickerTimelineState();
}

class CustomDatePickerTimelineState extends State<CustomDatePickerTimeline> {
  DateTime _selectedDate = DateTime.now();
  late List<DateTime> _dates;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _dates = _generateDateRange(widget.startDate, widget.endDate);
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToToday();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<DateTime> _generateDateRange(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    DateTime currentDate = start;
    while (currentDate.isBefore(end) || currentDate.isAtSameMomentAs(end)) {
      dates.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    return dates;
  }

  void _scrollToToday() {
    DateTime today = DateTime.now();
    int index = _dates.indexWhere((date) => _isSameDay(date, today));
    if (index != -1) {
      double itemWidth = 40; // Width of each chip
      double spacing = 6.3; // Space between chips
      double viewportWidth = MediaQuery.of(context).size.width;

      // Calculate the offset to center the "today" chip
      double offset = (index * (itemWidth + spacing)) -
          (viewportWidth / 2) +
          (itemWidth / 2) +
          (spacing / 2);

      // Ensure we only scroll if the total width is greater than the viewport width
      double totalWidth = _dates.length * (itemWidth + spacing) -
          spacing; // Total width of the chips and spacing
      if (totalWidth > viewportWidth) {
        _scrollController.jumpTo(offset);
      } else {
        _scrollController.jumpTo(
            0); // If total width is less than viewport width, scroll to start
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    final theme = Theme.of(context);
    return SizedBox(
      height: 62,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _dates.length,
        itemBuilder: (context, index) {
          DateTime date = _dates[index];
          bool isSelected = _selectedDate.isAtSameMomentAs(date);
          bool isToday = _isSameDay(date, today);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
                if (widget.onDateSelected != null) {
                  widget.onDateSelected!(date);
                }
              });
            },
            child: Container(
              width: 40, // Overall chip width
              margin: const EdgeInsets.only(right: 6), // 4px space to the right
              child: Column(
                children: [
                  Container(
                    width: 40,
                    // Chip width
                    height: 52,
                    // Chip height
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : (isToday
                              ? theme.colorScheme.primary.withOpacity(0.15)
                              : theme.colorScheme.surface),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 32,
                          // Set a fixed width
                          height: 20,
                          // Set a fixed height
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.secondary.withOpacity(0.15)
                                : (isToday
                                    ? theme.colorScheme.primary
                                        .withOpacity(0.15)
                                    : theme.colorScheme.onSecondary
                                        .withOpacity(0.15)),
                            borderRadius: BorderRadius.circular(
                                3), // Set corner radius here
                          ),
                          alignment: Alignment.center,
                          // Center the text vertically and horizontally
                          child: Text(
                            DateFormat('EEE').format(date),
                            // Use 'MMM' for 3-letter month
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis, // Handle overflow
                          ),
                        ),
                        Text(
                          DateFormat('d').format(date), // Date format
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isToday)
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      // Space between chip and indicator
                      width: 40,
                      // Match chip width
                      height: 4,
                      // Adjusted height for the indicator
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
