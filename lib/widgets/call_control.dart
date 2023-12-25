import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallControl extends StatefulWidget {
  const CallControl({super.key});

  @override
  State<CallControl> createState() => _CallControlState();
}

class _CallControlState extends State<CallControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
                color: Colors.black54.withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: 2)
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white.withOpacity(0.2)),
            child: Center(
                child: Icon(
              true ? Icons.mic_off_outlined : Icons.mic_outlined,
              color: Colors.white,
            )),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white.withOpacity(0.2)),
            child: Center(
                child: Icon(
              true ? Icons.videocam_outlined : Icons.videocam_off_outlined,
              color: Colors.white,
            )),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
              padding: const EdgeInsets.all(4),
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  Icons.thumb_up,
                  color: true ? Colors.white : Colors.red,
                ),
              )),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 40,
            height: 40,
            child: const Center(
              child: Icon(
                Icons.more_horiz_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
            onTap: () => {Navigator.pop(context)},
            child: Container(
                padding: const EdgeInsets.all(4),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.red,
                ),
                child: const Center(
                    child: Icon(
                  Icons.call_end,
                  color: Colors.white,
                ))))
      ]),
    );
  }
}
