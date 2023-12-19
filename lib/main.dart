import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/domains/course/course.dart';
import 'package:lettutor/domains/tutor/tutor.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/favorite.provider.dart';
import 'package:lettutor/data/providers/schedule.provider.dart';
import 'package:lettutor/screen/Authentication/forgot_password.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/Authentication/registration.dart';
import 'package:lettutor/screen/main/main_page.dart';
import 'package:lettutor/screen/profile/account.profile.dart';
import 'package:lettutor/screen/room/room.dart';
import 'package:lettutor/screen/setting/setting.dart';
import 'package:lettutor/screen/tutors/feedback_write.dart';
import 'package:lettutor/screen/tutors/feedbacks.dart';
import 'package:lettutor/screen/tutors/tutor_search.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(LettutorApp());
}

class LettutorApp extends StatefulWidget {
  LettutorApp({super.key});

  @override
  State<LettutorApp> createState() => _LettutorAppState();
}

class _LettutorAppState extends State<LettutorApp> {
  final authProvider = AuthProvider();
  final schedulesProvider = ScheduleProvider();
  final favouriteProvier = FavoriteProvider();
  List<Tutor> listTutor = [];
  List<Course> listCourse = [];
  @override
  void initState() {
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => authProvider,
          ),
          ChangeNotifierProvider(create: (_) => schedulesProvider),
          ChangeNotifierProvider(create: (_) => favouriteProvier),
          Provider(create: (context) => listTutor),
          Provider(create: (context) => listCourse),
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
            // Routes.courseDetail: (context) => const CourseDetailScreen(),
            // Routes.teacherDetail: (context) => const TutorDetailScreen(),
            Routes.review: (context) => const TutorFeedBackScreen(),
            Routes.writeReview: (context) => const FeedbackWritingScreen(),
            Routes.videoCall: (context) => const RoomScreen(),
            Routes.setting: (context) => const SettingScreen(),
            Routes.profile: (context) => const AccountProfileScreen(),
          },
        ));
  }
}
