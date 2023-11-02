import 'package:flutter/material.dart';
import 'package:lettutor/widgets/history_booking_card.dart';
import 'package:lettutor/widgets/tutor_card.dart';
import 'package:lettutor/widgets/upcoming_card.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Upcoming',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.history_outlined,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'History',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Here goes the first tab
                  SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      children: List<Widget>.generate(
                        count,
                        (index) => const UpcomingCard(),
                      ),
                    ),
                  ),
                  // Here goes the second tab
                  SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      children: List<Widget>.generate(
                        count,
                        (index) => const HistoryCard(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
