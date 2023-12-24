import 'package:flutter/material.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:provider/provider.dart';

class ReportDialog extends StatefulWidget {
  const ReportDialog({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  _ReportDialogState createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  late LanguageProvider languageProvider;
  int selectedOption = 0; // Initialize the selected option
  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
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
                  '${languageProvider.language.report} ${widget.name}',
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
                  children: [
                    Icon(
                      Icons.report,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        languageProvider.language.reportTitle,
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
                    Expanded(child: Text(languageProvider.language.annoy)),
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
                    Expanded(
                      child: Text(languageProvider.language.pretend),
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
                    Expanded(
                      child: Text(languageProvider.language.violate),
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
                    Expanded(
                      child: Text(languageProvider.language.another),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: languageProvider.language.reportHint,
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
                      child: Text(languageProvider.language.cancel),
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
                                    languageProvider
                                        .language.reportSuccessfully,
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
                      child: Text(languageProvider.language.submit),
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
