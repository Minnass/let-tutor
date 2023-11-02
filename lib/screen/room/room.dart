import 'package:flutter/material.dart';
import 'package:lettutor/widgets/avatar_name.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:lettutor/widgets/call_controll.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  var _remainingTime = 0;
  var _elapsedTime = 0;
  late Timer _countDownTimer;
  late Timer _countUpTimer;
  late final DateTime startDate;

  void startCountDownTimer() {
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        setState(() {
          _countDownTimer.cancel();
        });
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void startCountUpTimer() {
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _remainingTime = DateTime.fromMillisecondsSinceEpoch(1637131800000)
        .difference(DateTime.now())
        .inSeconds;
    startCountDownTimer();
    startCountUpTimer();
    startDate = DateTime.fromMillisecondsSinceEpoch(1637131800000);
  }

  @override
  void dispose() {
    super.dispose();
    _countDownTimer.cancel();
    _countUpTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black.withOpacity(0.7),
        child: Stack(
          children: [
            Positioned(
                top: 16,
                left: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Set MainAxisAlignment to space the items apart
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/logo/lettutor.png',
                            width: 36,
                            height: 36,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Lettutor',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(0.5)),
                  child: Text(
                    '${_elapsedTime ~/ 3600}:${(_elapsedTime % 3600 / 60).floor()}:${_elapsedTime % 60}',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const AvatarName(
                  name: 'Trieu Phan',
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black.withOpacity(0.5)),
                    child: Text(
                      '10:0:46 until lesson start (Sunday 16 January 10:30)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ))
              ]),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CallControl(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
