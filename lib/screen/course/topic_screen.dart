import 'package:flutter/material.dart';
import 'package:lettutor/models/course/topic.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({Key? key, required this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          topic.name != null ? topic.name : '',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: topic.nameFile == null
          ? Center(
              child: Text(
                'No materials found',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : SfPdfViewer.network(
              topic.nameFile!,
            ),
    );
  }
}
