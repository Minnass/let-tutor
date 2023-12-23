import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/schedule/request/booked_tutor.request.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/schedule/schedule.api.dart';
import 'package:lettutor/data/network/constants/pagination.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/widgets/history_booking_card.dart';
import 'package:provider/provider.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  int page = 1;
  bool _isLoading = true;
  bool hasNext = true;
  late List<BookingInfoResponse> bookingInfoList;
  ScheduleApi scheduleApi = ScheduleApi(DioClient(Dio()));
  final controller = ScrollController();
  Future<void> _fetchHistorySchedule() async {
    final now = DateTime.now()
        .subtract(const Duration(minutes: 35))
        .millisecondsSinceEpoch;
    try {
      final res = await scheduleApi.getBookedTutors(BookedTutorRequest(
          page: 1,
          perPage: Pagination.pageSize * page,
          dateTimeLte: now,
          orderBy: 'meeting',
          sortBy: 'desc'));
      bookingInfoList = res.data?.rows ?? [];
      hasNext = res.data!.count! > bookingInfoList.length;
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  error.toString(),
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        page++;
        _fetchHistorySchedule();
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
      _fetchHistorySchedule();
    }
    return Expanded(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                controller: controller,
                itemBuilder: (context, index) {
                  if (index < bookingInfoList.length) {
                    final item = bookingInfoList[index];
                    return HistoryCard(bookingInfo: item);
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
