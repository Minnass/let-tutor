import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/models/course/course.dart';
import 'package:lettutor/models/tutor/tutor.dart';
import 'package:lettutor/providers/auth.provider.dart';
import 'package:lettutor/providers/favorite.provider.dart';
import 'package:lettutor/providers/schedule.provider.dart';
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
    loadTutors();
    loadCourse();
    Future.wait([loadTutors(), loadCourse()]).then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
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
            Routes.bookTutor: (context) => const BookTutorScreen(),
            Routes.setting: (context) => const SettingScreen(),
          },
        ));
  }

  Future<void> loadCourse() async {
    // Đọc dữ liệu từ file JSON
    String jsonString = await rootBundle.loadString('assets/data/course.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    // Lấy danh sách tutors từ dữ liệu JSON
    List<Map<String, dynamic>> courseList = [];
    if (jsonData['data'] != null && jsonData['data']['rows'] is List) {
      courseList = List<Map<String, dynamic>>.from(jsonData['data']['rows']);
    }
    listCourse = courseList.map((json) => Course.fromJson(json)).toList();
    // print(listCourse.length);
  }

  Future<void> loadTutors() async {
    // Đọc dữ liệu từ file JSON
    String jsonString =
        await rootBundle.loadString('assets/data/dataTutor.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    // Lấy danh sách tutors từ dữ liệu JSON
    List<Map<String, dynamic>> tutorList = [];
    List<Map<String, dynamic>> favoriteList = [];
    if (jsonData['tutors'] != null && jsonData['tutors']['rows'] is List) {
      tutorList = List<Map<String, dynamic>>.from(jsonData['tutors']['rows']);
    }
    // Chuyển đổi thành danh sách các đối tượng Tutor'
    listTutor = tutorList.map((json) => Tutor.fromJson(json)).toList();
    // print(listTutor);
    if (jsonData['tutors'] != null && jsonData['favoriteTutor'] is List) {
      favoriteList = List<Map<String, dynamic>>.from(jsonData['favoriteTutor']);
    }
    List<String> idindex = [];
    for (var tutor in favoriteList) {
      String secondId = tutor['secondId'];
      idindex.add(secondId);
    }
    setState(() {
      favouriteProvier.setListIds(idindex);
    });
  }
}
