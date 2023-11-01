import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Card(
          elevation: 1.5,
          surfaceTintColor: Colors.white,
          child: ListTile(
            title: Text(
              'The Internet',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            onTap: ()=>{},
          ),
        ));
  }
}
