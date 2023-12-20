import 'package:flutter/material.dart';
import 'package:lettutor/domains/entity/feedback/feedback.dart';

class FeedbackCard extends StatefulWidget {
  final MyFeedback feedback;
  const FeedbackCard({super.key, required this.feedback});

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        surfaceTintColor: Colors.white,
        elevation: 2,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    // widget.feedback.firstInfo.avatar != null
                    //     ? widget.feedback.firstInfo.avatar
                    //     : "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                    'https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error_outline_rounded,
                      size: 32,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          // widget.feedback.content != null
                          //     ? widget.feedback.content
                          //     : '',
                          '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          // widget.feedback.updatedAt,
                          '',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const Icon(Icons.star, color: Colors.amber, size: 15)
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('Vui ve khong quao')
                  ],
                ))
              ],
            )));
  }
}
