import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

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
          'The Internet',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SfPdfViewer.network('https://www.pdf995.com/samples/pdf.pdf'),
    );
  }
}
