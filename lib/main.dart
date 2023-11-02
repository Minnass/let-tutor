import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/screen/Authentication/forgot_password.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/Authentication/registration.dart';
import 'package:lettutor/screen/course/course_detail.dart';
import 'package:lettutor/screen/main/main_page.dart';
import 'package:lettutor/screen/room/room.dart';
import 'package:lettutor/screen/tutors/feedback_write.dart';
import 'package:lettutor/screen/tutors/feedbacks.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      home: const LoginScreen(),
      routes: {
        Routes.login: (context) => const LoginScreen(),
        Routes.register: (context) => const RegisterScreen(),
        Routes.forgotPassword: (context) => const ForgotPasswordScreen(),
        Routes.main: (context) => const MainScreen(),
        // Routes.becomeTutor: (context) => const BecomeTutorView(),
        // Routes.userProfile: (context) => const UserProfileView(),
        Routes.courseDetail: (context) => const CourseDetailScreen(),
        Routes.teacherDetail: (context) => const TutorDetailScreen(),
        // Routes.bookingDetail: (context) => const BookingDetailView(),
        Routes.review: (context) => const FeedbackWritingScreen(),
        Routes.writeReview: (context) => const TutorFeedBackScreen(),
        Routes.videoCall: (context) => const RoomScreen(),
      },
    );
  }
}
