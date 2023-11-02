import 'package:flutter/material.dart';
import 'dart:math';

class AvatarName extends StatelessWidget {
  const AvatarName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    List<String> seperatedName = name.split(' ');
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      child: Text(
        '${seperatedName[0][0]}${seperatedName[seperatedName.length - 1][0]}',
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 56),
      ),
    );
  }
}
