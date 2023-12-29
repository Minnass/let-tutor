import 'package:flutter/material.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';

class RequestDialog extends StatefulWidget {
  final Future<bool> Function(String request) requestForLesson;
  const RequestDialog({super.key, required this.requestForLesson});

  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  final _textController = TextEditingController();
  late LanguageProvider languageProvider;
  String _error = '';
  void _validateText(LanguageProvider languageProvider) {
    if (_textController.text.isEmpty) {
      _error = languageProvider.language.emptyRequest;
    } else {
      _error = '';
    }
  }

  Future<void> _sendRequest() async {
    _validateText(languageProvider);
    if (_error.isEmpty) {
      final res = await widget.requestForLesson(_textController.text);
      if (res) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child:
                      Text(languageProvider.language.sendRequestSuccessfully),
                ),
              ],
            ),
            duration: Duration(seconds: 1),
          ),
        );
      }
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(children: [
            Text(
              languageProvider.language.requestTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                errorText: _error.isEmpty ? null : _error,
                border: OutlineInputBorder(),
                hintText: languageProvider.language.requestHint,
              ),
              maxLines: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cancel button action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, // Background color for Cancel
                    onPrimary: Colors.blue, // Border color for Cancel
                  ),
                  child: Text(languageProvider.language.cancel),
                ),
                const SizedBox(width: 8), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () async {
                    await _sendRequest();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color for Submit
                  ),
                  child: Text(languageProvider.language.submit),
                ),
              ],
            ),
          ]),
        ));
  }
}
