import 'package:flutter/material.dart';

class RequestDialog extends StatefulWidget {
  const RequestDialog({super.key});

  @override
  State<RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(children: [
            Text(
              'What do you want from this tutor?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Let us know details about your desire',
              ),
              maxLines: 15,
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
                  child: Text('Cancel'),
                ),
                const SizedBox(width: 8), // Add some spacing between buttons
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Background color for Submit
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ]),
        ));
  }
}
