import 'package:flutter/material.dart';

class ReportDialog extends StatefulWidget {
  const ReportDialog({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  int selectedOption = 0; // Initialize the selected option

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Report ${widget.name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close_sharp),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.report,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Help us understand what's happening",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedOption == 1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value! ? 1 : 0;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    const Expanded(child: Text('This tutor is annoying me')),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedOption == 2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value! ? 2 : 0;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                          'This profile is pretending to be someone or is fake'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedOption == 3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value! ? 3 : 0;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text('This tutor is violating our policies'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: selectedOption == 4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value! ? 4 : 0;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text('Another'),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Let us know details about your problem',
                  ),
                  maxLines: 1,
                ),
                const Divider(),
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
                    const SizedBox(
                        width: 8), // Add some spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: Colors.green), // Success icon
                                SizedBox(
                                    width:
                                        8), // Adjust spacing between icon and text
                                Expanded(
                                  child: Text(
                                    'Report was sent successfully.',
                                    // Style the text as needed
                                  ),
                                ),
                              ],
                            ),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color for Submit
                      ),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
