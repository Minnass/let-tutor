import 'package:flutter/material.dart';
import 'package:lettutor/domains/entity/feedback/feedback.dart';
import 'package:lettutor/widgets/feedback_card.dart';

class FeedbackDialog extends StatefulWidget {
  final List<MyFeedback> feedbacks;
  const FeedbackDialog({Key? key, required this.feedbacks});
  @override
  _FeedbackDialogState createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  int selectedOption = 0; // Initialize the selected option

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Review',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close_sharp))
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ListView.builder(
                  itemCount: widget.feedbacks.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: FeedbackCard(
                        feedback: widget.feedbacks[index],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
