import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/schedule/response/booking_info.response.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_feedback.request.dart';
import 'package:lettutor/data/network/apis/tutor/tutor.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class FeedbackWritingScreen extends StatefulWidget {
  const FeedbackWritingScreen({super.key, required this.bookingInfo});
  final BookingInfoResponse bookingInfo;
  @override
  State<FeedbackWritingScreen> createState() => _FeedbackWritingScreenState();
}

class _FeedbackWritingScreenState extends State<FeedbackWritingScreen> {
  final textController = TextEditingController();
  String _error = '';
  TutorApi tutorApi = TutorApi(DioClient(Dio()));
  int star = 5;
  void _handleValidation() {
    if (textController.text.isEmpty) {
      _error = 'This field must not be empty';
    } else {
      _error = '';
    }
    setState(() {});
  }

  Future<void> _sendFeedback() async {
    _handleValidation();
    if (_error.isEmpty) {
      try {
        await tutorApi.writeFeedback(TutorFeedbackRequest(
            bookingId: widget.bookingInfo.id!,
            userId:
                widget.bookingInfo.scheduleDetailInfo!.scheduleInfo!.tutorId!,
            content: textController.text,
            rating: star));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Send successfully.'),
                ),
              ],
            ),
            duration: Duration(seconds: 1),
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    error.toString(),
                  ),
                ),
              ],
            ),
            duration: Duration(seconds: 1),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    tutorApi.setToken(authProvider.getToken());
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
                      star = index + 1;
                    });
                  },
                  child: Icon(
                    Icons.star,
                    color: index < star ? Colors.amber : Colors.grey,
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
            controller: textController,
            minLines: 5,
            maxLines: 10,
            decoration: InputDecoration(
                errorText: _error.isEmpty ? '' : _error,
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(height: 24),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {_sendFeedback()},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
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
