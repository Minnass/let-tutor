import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/schedule/request/booked_tutor.request.dart';
import 'package:lettutor/data/network/apis/schedule/request/request_lesson.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/constants/pagination.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/widgets/history_booking_card.dart';
import 'package:lettutor/widgets/upcoming_card.dart';
import 'package:provider/provider.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  final controller = ScrollController();
  bool hasNext = true;
  int page = 1;
  bool _isLoading = true;
  late List<BookingInfoResponse> bookingInfoList;
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));

  Future<void> _fetchUpcomingSchedule() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    try {
      final res = await scheduleApi.getUpcomingSchedule(UpcomingScheduleRequest(
          page: 1,
          perPage: Pagination.pageSize * page,
          dateTimeGte: now,
          orderBy: 'meeting',
          sortBy: 'asc'));
      bookingInfoList = res.data?.rows ?? [];
      hasNext = res.data!.count! > bookingInfoList.length;
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        page++;
        _fetchUpcomingSchedule();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    scheduleApi.setToken(authProvider.getToken());
    if (_isLoading) {
      _fetchUpcomingSchedule();
    }
    return Expanded(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                controller: controller,
                itemBuilder: (context, index) {
                  if (index < bookingInfoList.length) {
                    final item = bookingInfoList[index];
                    return UpcomingCard(bookingInfo: item);
                  } else if (hasNext) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 8),
                itemCount: bookingInfoList.length + 1,
              ));
  }
}
