import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/screen/tutors/feedback_write.dart';
import 'package:lettutor/utils/datetime_converter.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:lettutor/widgets/dialog/report_dialog.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, required this.bookingInfo}) : super(key: key);
  final BookingInfoResponse bookingInfo;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!
                              .tutorInfo!.avatar !=
                          null
                      ? Image.network(
                          widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!
                              .tutorInfo!.avatar!,
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
                            getFirstCharacters(widget
                                .bookingInfo
                                .scheduleDetailInfo!
                                .scheduleInfo!
                                .tutorInfo!
                                .name),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, Routes.teacherDetail);
                        },
                        child: Text(
                          widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!
                                  .tutorInfo!.name ??
                              '',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fromMilisecondToDateTime(widget.bookingInfo
                            .scheduleDetailInfo!.startPeriodTimestamp),
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.bookingInfo.studentRequest ?? 'No Requests For Lessons',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.bookingInfo.tutorReview ?? "Tutor haven't reviewed yet",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ReportDialog(
                          name: 'Keegan',
                        ),
                      );
                    },
                    child: const Text(
                      'Report',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackWritingScreen(
                            bookingInfo: widget.bookingInfo),
                      ));
                    },
                    child: const Text(
                      'Add A Review',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> showReportDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Report Lesson'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/keegan-avatar.png'),
                    radius: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keegan',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 4),
                        const Text('2022-10-20    10:00 - 10:55')
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Please tell us what went wrong',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 8),
              TextField(
                minLines: 3,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Additional Notes',
                    contentPadding: const EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
