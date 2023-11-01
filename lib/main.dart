import 'package:flutter/material.dart';
import 'package:lettutor/screen/Authentication/forgot_password.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/Authentication/registration.dart';
import 'package:lettutor/screen/course/course_detail.dart';
import 'package:lettutor/screen/course/course_page.dart';
import 'package:lettutor/screen/homepage/home_page.dart';
import 'package:lettutor/screen/tutors/feedback_write.dart';
import 'package:lettutor/screen/tutors/feedbacks.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';
import 'package:lettutor/widgets/course_card.dart';
import 'package:lettutor/widgets/tutor_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: CourseDetail()),
      ),
    );
  }
}
