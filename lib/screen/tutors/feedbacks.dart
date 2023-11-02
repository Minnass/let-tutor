import 'package:flutter/material.dart';
import 'package:lettutor/widgets/feedback_card.dart';

class TutorFeedBackScreen extends StatefulWidget {
  const TutorFeedBackScreen({super.key});

  @override
  State<TutorFeedBackScreen> createState() => _TutorFeedBackScreenState();
}

class _TutorFeedBackScreenState extends State<TutorFeedBackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Reviews',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Center(
                child: TextButton(
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(12)),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.edit, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Write Review',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              FeedbackCard(),
              FeedbackCard(),
              FeedbackCard(),
            ],
          )),
    );
  }
}
