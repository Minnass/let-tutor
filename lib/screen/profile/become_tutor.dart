import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/user/request/become_tutor.request.dart';
import 'package:lettutor/data/network/apis/user/user.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/screen/profile/approval_step.dart';
import 'package:lettutor/screen/profile/profile_step.dart';
import 'package:lettutor/screen/profile/video_step.dart';
import 'package:lettutor/widgets/process_step.dart';
import 'package:provider/provider.dart';

class TutorRegisteringPage extends StatefulWidget {
  const TutorRegisteringPage({Key? key}) : super(key: key);

  @override
  _TutorRegisteringPageState createState() => _TutorRegisteringPageState();
}

class _TutorRegisteringPageState extends State<TutorRegisteringPage> {
  var currentStep = 1;
  late LanguageProvider languageProvider;
  late BecomeTutorRequest request;
  UserApi userApi = UserApi(DioClient(Dio()));
  late AuthProvider authProvider;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _becomeTutor(String videoPath) async {
    request.video = videoPath;
    request.name = authProvider.currentUser?.name;
    request.country = authProvider.currentUser?.country;
    request.phone = authProvider.currentUser?.phone;
    request.birthday = authProvider.currentUser?.birthday;
    try {
      await userApi.becomeTutor(request);
      return true;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  error.toString(),
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 1),
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    authProvider = context.watch<AuthProvider>();
    userApi.setToken(authProvider.getToken());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          languageProvider.language.tutorRegisterTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProcessStep(
                          order: 1,
                          content: languageProvider.language.profile,
                          isCurrentStep: currentStep == 1,
                          isDone: currentStep > 1,
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProcessStep(
                          order: 2,
                          content: languageProvider.language.videoIntroduction,
                          isCurrentStep: currentStep == 2,
                          isDone: currentStep > 2,
                        ),
                      )),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProcessStep(
                          order: 3,
                          content: languageProvider.language.approval,
                          isCurrentStep: currentStep == 3,
                          isDone: currentStep > 3,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              if (currentStep == 1)
                ProfileStep(onPressNext: (BecomeTutorRequest rq) {
                  request = rq;
                  setState(() {
                    currentStep++;
                  });
                })
              else if (currentStep == 2)
                VideoIntroductionStep(
                    onPressPrevious: () => setState(() => currentStep--),
                    onPressDone: (String videoPath) async {
                      final res = await _becomeTutor(videoPath);
                      if (res) {
                        setState(() => currentStep++);
                      } else {
                        Future.delayed(const Duration(seconds: 0), () {
                          Navigator.pop(context);
                        });
                      }
                    })
              else
                ApprovalStep()
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
