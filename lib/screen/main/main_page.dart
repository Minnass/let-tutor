import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/screen/course/course_page.dart';
import 'package:lettutor/screen/homepage/home_page.dart';
import 'package:lettutor/screen/schedule/schedule.dart';
import 'package:lettutor/screen/setting/setting.dart';
import 'package:lettutor/screen/tutors/tutor_search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const HomePageScreen(),
    const TutorSearchScreen(),
    const ScheduleScreen(),
    const CourseScreen(),
    const SettingScreen(),
  ];

  int chosenScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[chosenScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            chosenScreenIndex = value;
          });
        },
        elevation: 20,
        currentIndex: chosenScreenIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Tutors'),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
