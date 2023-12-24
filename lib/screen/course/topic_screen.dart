import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/course/response/topic.response.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicScreen extends StatelessWidget {
  final TopicResponse topic;
  const TopicScreen({Key? key, required this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = context.watch<LanguageProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          topic.name ?? '',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: topic.nameFile == null
          ? Center(
              child: Text(
                languageProvider.language.noMaterial,
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
