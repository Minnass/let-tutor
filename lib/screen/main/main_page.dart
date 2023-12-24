import 'package:flutter/material.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/screen/course/course_page.dart';
import 'package:lettutor/screen/homepage/home_page.dart';
import 'package:lettutor/screen/schedule/schedule.dart';
import 'package:lettutor/screen/setting/setting.dart';
import 'package:lettutor/screen/tutors/tutor_search.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late LanguageProvider languageProvider;
  List<Widget> screens = [
    HomePageScreen(),
    TutorSearchScreen(hasBackButton: false),
    ScheduleScreen(),
    CourseScreen(),
    SettingScreen(),
  ];

  int chosenScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: languageProvider.language.home),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: languageProvider.language.tutor),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: languageProvider.language.schedule),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: languageProvider.language.course),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: languageProvider.language.setting),
        ],
      ),
    );
  }
}
