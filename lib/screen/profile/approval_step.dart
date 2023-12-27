import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';

class ApprovalStep extends StatefulWidget {
  const ApprovalStep({Key? key}) : super(key: key);

  @override
  _ApprovalStepState createState() => _ApprovalStepState();
}

class _ApprovalStepState extends State<ApprovalStep> {
  late LanguageProvider languageProvider;
  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        SvgPicture.asset(
          'assets/become_tutor/approval_step.svg',
          height: 75,
          color: Colors.blue,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          languageProvider.language.stepsCompleted,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Text(
          languageProvider.language.operatorApprovalWait,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue), // Border color
          ),
          child: Text(languageProvider.language.done),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                          languageProvider.language.tutorRegistrationSuccess),
                    ),
                  ],
                ),
                duration: Duration(seconds: 1),
              ),
            );
            Future.delayed(const Duration(seconds: 0), () {
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
