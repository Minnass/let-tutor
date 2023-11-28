import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/providers/auth.provider.dart';
import 'package:lettutor/screen/Authentication/forgot_password.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/Authentication/registration.dart';
import 'package:lettutor/screen/course/course_detail.dart';
import 'package:lettutor/screen/main/main_page.dart';
import 'package:lettutor/screen/room/room.dart';
import 'package:lettutor/screen/setting/setting.dart';
import 'package:lettutor/screen/tutors/book_tutor.dart';
import 'package:lettutor/screen/tutors/feedback_write.dart';
import 'package:lettutor/screen/tutors/feedbacks.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';
import 'package:lettutor/screen/tutors/tutor_search.dart';
import 'package:lettutor/widgets/feedback_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Inter'),
          home: const LoginScreen(),
          routes: {
            Routes.login: (context) => const LoginScreen(),
            Routes.register: (context) => const RegisterScreen(),
            Routes.forgotPassword: (context) => const ForgotPasswordScreen(),
            Routes.tutors: (context) => const TutorSearchScreen(),
            Routes.main: (context) => const MainScreen(),
            Routes.courseDetail: (context) => const CourseDetailScreen(),
            Routes.teacherDetail: (context) => const TutorDetailScreen(),
            Routes.review: (context) => const TutorFeedBackScreen(),
            Routes.writeReview: (context) => const FeedbackWritingScreen(),
            Routes.videoCall: (context) => const RoomScreen(),
            Routes.bookTutor: (context) => const BookTutorScreen(),
            Routes.setting: (context) => const SettingScreen(),
          },
        ));
  }
}
