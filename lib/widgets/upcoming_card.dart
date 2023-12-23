import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/schedule/request/request_lesson.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/utils/datetime_converter.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:lettutor/widgets/dialog/request_dialog.dart';
import 'package:provider/provider.dart';

class UpcomingCard extends StatefulWidget {
  const UpcomingCard({Key? key, required this.bookingInfo}) : super(key: key);
  final BookingInfoResponse bookingInfo;

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard> {
  late String? request = widget.bookingInfo.studentRequest;
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));
  Future<bool> _requestForLesson(String content) async {
    try {
      await scheduleApi.requestForLesson(LessonRequest(
          studentRequest: content, bookingId: widget.bookingInfo.id!));
      request = content;
      setState(() {});
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    scheduleApi.setToken(authProvider.getToken());
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      surfaceTintColor: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                          onTap: () {},
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
                  Expanded(
                      child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => RequestDialog(
                                requestForLesson: _requestForLesson,
                              ));
                    },
                    icon: Icon(
                      Icons.edit_note_outlined,
                      size: 25,
                      color: Colors.blue[700],
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Request for lesson",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(request ?? 'No request for this lesson',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () => {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.videoCall);
                      },
                      child: const Text(
                        'Go to meeting',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
