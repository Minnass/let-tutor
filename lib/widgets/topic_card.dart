import 'package:flutter/material.dart';
import 'package:lettutor/domains/course/topic.dart';
import 'package:lettutor/screen/course/topic_screen.dart';

class TopicCard extends StatelessWidget {
  final Topic topic;
  const TopicCard({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: Card(
          elevation: 1.5,
          surfaceTintColor: Colors.white,
          child: ListTile(
            title: Text(
              topic.name != null ? topic.name : '',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TopicScreen(topic: topic),
              ))
            },
          ),
        ));
  }
}
