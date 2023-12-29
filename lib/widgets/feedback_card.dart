import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/domains/entity/feedback/feedback.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:provider/provider.dart';

class FeedbackCard extends StatefulWidget {
  final MyFeedback feedback;
  const FeedbackCard({super.key, required this.feedback});

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  late LanguageProvider languageProvider;
  String formatDatetime(String date, String format) {
    if (date.isEmpty) {
      return '';
    }
    DateTime apiDate = DateTime.parse(date);
    String formattedDate = DateFormat(format).format(apiDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = context.watch<LanguageProvider>();
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
                  child: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: widget.feedback.firstInfo!.avatar != null
                        ? Image.network(
                            widget.feedback.firstInfo!.avatar!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.red,
                              size: 32,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 50,
                            child: Text(
                              getFirstCharacters(
                                  widget.feedback.firstInfo!.name),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
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
                          '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          formatDatetime(widget.feedback.updatedAt ?? '',
                              languageProvider.language.dateFormat),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: List.generate(
                        (widget.feedback.rating ?? 0)
                            .toInt(), // Casting widget.tutor.rating to int
                        (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(widget.feedback.content!)
                  ],
                ))
              ],
            )));
  }
}
