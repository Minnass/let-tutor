import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/schedule/request/book_class.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/tutor_schedule.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/schedule.response.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/widgets/dialog/book_tutor_dialog.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Booking extends StatefulWidget {
  Booking({super.key, required this.tutorId});
  String tutorId;
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  List<ScheduleResponse> listScheduleOfTutor = [];
  late LanguageProvider languageProvider;
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));
  bool isLoading = true;

  Future<bool> _bookClass(String scheduleId, String note) async {
    try {
      await scheduleApi.bookClass(
          BookClassRequest(scheduleDetailIds: [scheduleId], note: note));

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> fetchTutorSchedule() async {
    try {
      final res = await scheduleApi.getScheduleWithTutorId(
          GetTutorSchduleRequest(tutorId: widget.tutorId));
      setState(() {
        listScheduleOfTutor = res.data!;
        setState(() {
          isLoading = false;
        });
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<TimeRegion> _getTimeRegions() {
    final List<TimeRegion> regions = <TimeRegion>[];

    for (int i = 0; i < listScheduleOfTutor.length; i++) {
      int timestamp = listScheduleOfTutor[i].startTimestamp!;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day,
          dateTime.hour, dateTime.minute, dateTime.second);
      regions.add(TimeRegion(
        startTime: date,
        endTime: date.add(Duration(minutes: 30)),
        enablePointerInteraction: true,
        color: Colors.grey.withOpacity(0.2),
        text: listScheduleOfTutor[i].isBooked! ? "Booked" : 'Book',
      ));
    }
    return regions;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    scheduleApi.setToken(authProvider.getToken());
    languageProvider = context.watch<LanguageProvider>();
    if (isLoading) {
      fetchTutorSchedule();
    }
    return isLoading
        ? const Center(child: CircularProgressIndicator(color: Colors.blue))
        : Container(
            height: 2520,
            child: SfCalendar(
              view: CalendarView.week,
              firstDayOfWeek: 1,
              showNavigationArrow: true,
              showCurrentTimeIndicator: false,
              timeSlotViewSettings: TimeSlotViewSettings(
                timeInterval: Duration(minutes: 30), timeFormat: 'h:mm a',
                timeIntervalHeight: 50,
                dateFormat: 'd', dayFormat: 'EEE',
                startHour: 0, // Set the start hour (24-hour format)
                endHour: 24, numberOfDaysInView: 5,
                // Set the end hour (24-hour format)
              ),
              specialRegions: _getTimeRegions(),
              timeRegionBuilder:
                  (BuildContext context, TimeRegionDetails details) {
                if (details.region.text == 'Book') {
                  return Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(18, 18)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {},
                        child: Text(
                          languageProvider.language.book,
                          style: TextStyle(color: Colors.white),
                        )),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      languageProvider.language.booked,
                      style: TextStyle(color: Colors.green),
                    ),
                  );
                }
              },
              onTap: (CalendarTapDetails details) async {
                if (details.targetElement == CalendarElement.calendarCell) {
                  // Check if the tap is within a time region
                  DateTime tappedTime = details.date!;
                  List<TimeRegion> timeRegions = _getTimeRegions();
                  for (int i = 0; i < timeRegions.length; i++) {
                    if (tappedTime.isAtSameMomentAs(timeRegions[i].startTime) &&
                        tappedTime.isBefore(timeRegions[i].endTime) &&
                        !listScheduleOfTutor[i].isBooked!) {
                      DateTime timestart = DateTime.fromMillisecondsSinceEpoch(
                          listScheduleOfTutor[i].startTimestamp!);
                      DateTime timeend = DateTime.fromMillisecondsSinceEpoch(
                          listScheduleOfTutor[i].endTimestamp!);

                      final result = await showDialog(
                        context: context,
                        builder: (context) => BookTutorDialog(
                          start: timestart,
                          end: timeend,
                          scheduleId:
                              listScheduleOfTutor[i].scheduleDetails![0].id!,
                          bookClass: _bookClass,
                        ),
                      );
                      if (result) {
                        setState(() {
                          listScheduleOfTutor[i].isBooked = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      languageProvider.language.bookSuccess),
                                ),
                              ],
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    }
                  }
                }
              },
            ),
          );
  }
}
