import 'package:flutter/material.dart';

class FeedbackWritingScreen extends StatefulWidget {
  const FeedbackWritingScreen({super.key});

  @override
  State<FeedbackWritingScreen> createState() => _FeedbackWritingScreenState();
}

class _FeedbackWritingScreenState extends State<FeedbackWritingScreen> {
  int rate = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Write Review',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Rating',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List<Widget>.generate(
                5,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      rate = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < rate ? Colors.amber : Colors.grey,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            minLines: 5,
            maxLines: 10,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 24),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 14 ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Send',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
