import 'package:flutter/material.dart';
import 'package:routine/presentation/mood/mood_screen.dart';

import '../menu/custom_drawer.dart';
import '../habit/habit_screen.dart';
import '../task/task_screen.dart';
import '../timetable/time_table_screen.dart';
import '../today/today_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const TodayScreen(),
    const HabitScreen(),
    const TaskScreen(),
    const MoodScreen(),
    const TimeTableScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openCustomDrawer() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: CustomDrawer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
            top: 54,
            right: 4,
            child: IconButton(
              icon: Icon(Icons.more_vert, size: 24),
              color: theme.colorScheme.primary,
              onPressed:
                  _openCustomDrawer, // Ensure this triggers the bottom sheet
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 64.0,
        child: BottomAppBar(
          color: theme.colorScheme.surface,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.today,
                    color: _selectedIndex == 0
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.workspace_premium,
                    color: _selectedIndex == 1
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(Icons.library_add_check_rounded,
                    color: _selectedIndex == 2
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.emoji_emotions_sharp,
                    color: _selectedIndex == 3
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: Icon(Icons.free_cancellation,
                    color: _selectedIndex == 4
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSecondary.withOpacity(0.5)),
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
