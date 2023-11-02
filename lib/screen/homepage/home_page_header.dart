import 'package:flutter/material.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[700],
        width: double.maxFinite,
        height: 120,
        child: false
            ? Center(
                child: false
                    ? const Text(
                        'Error: Cannot get upcoming class',
                        style: TextStyle(color: Colors.white),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
              )
            : Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'Upcoming Lesson',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '2023-10-21 18:30-18:55',
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
                          children: const [
                            Icon(Icons.ondemand_video_rounded),
                            SizedBox(width: 12),
                            Text('Enter Lesson Room',
                                style: TextStyle(fontSize: 14)),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 5),
                    child: Text(
                      'Total Lesson Time 4 hours 30 minutes',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )
                ],
              ));
  }
}
