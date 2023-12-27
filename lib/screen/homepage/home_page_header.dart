import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/data/network/apis/schedule/request/booked_tutor.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  late LanguageProvider languageProvider;
  late AuthProvider authProvider;
  late BookingInfoResponse? bookingInfo;
  late int totalTime;
  bool isLoading = true;
  String scheduleTime = '';
  bool isFirstLoading = true;
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));
  Future<void> _fetchData() async {
    try {
      final time = await scheduleApi.getTotalTime();
      totalTime = time;
      final res = await scheduleApi.getUpcomingSchedule(UpcomingScheduleRequest(
          page: 1,
          perPage: 1,
          dateTimeGte: DateTime.now().millisecondsSinceEpoch,
          orderBy: 'meeting',
          sortBy: 'asc'));
      bookingInfo = res.data?.rows?.first;
      if (bookingInfo != null) {
        scheduleTime =
            DateFormat(languageProvider.language.dateTimeFormat).format(
          DateTime.fromMillisecondsSinceEpoch(
              bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp ?? 0),
        );
      }
      isLoading = false;
      setState(() {});
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    authProvider = context.watch<AuthProvider>();
    scheduleApi.setToken(authProvider.getToken());
    if (isFirstLoading) {
      _fetchData();
    }
    return isLoading
        ? const Center(child: CircularProgressIndicator(color: Colors.blue))
        : Container(
            color: Colors.blue[700],
            width: double.maxFinite,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    languageProvider.language.upcomingLesson,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  scheduleTime,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          backgroundColor: Colors.white),
                      onPressed: () => {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.ondemand_video_rounded),
                          SizedBox(width: 12),
                          Text(languageProvider.language.inRoomButton,
                              style: TextStyle(fontSize: 14)),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 5),
                  child: Text(
                    '${languageProvider.language.totalTime}: ${(totalTime / 60).round() - 1} ${languageProvider.language.hours} ${totalTime.round() % 60} ${languageProvider.language.minues}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ));
  }
}
