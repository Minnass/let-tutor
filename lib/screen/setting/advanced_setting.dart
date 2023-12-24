import 'package:flutter/material.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/utils/language/english.dart';
import 'package:lettutor/utils/language/vietnam.dart';
import 'package:provider/provider.dart';

class AdvancedSettingPage extends StatefulWidget {
  const AdvancedSettingPage({super.key});

  @override
  State<AdvancedSettingPage> createState() => _AdvancedSettingPageState();
}

class _AdvancedSettingPageState extends State<AdvancedSettingPage> {
  late LanguageProvider languageProvider;
  late String choosenLanguage;
  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    choosenLanguage = languageProvider.language.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Advanced Settings',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                color: choosenLanguage == 'EN' ? Colors.blue : Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    languageProvider.setLanguage(English());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                  languageProvider.language.switchSuccessfully),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(languageProvider.en,
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ],
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            Container(
                color: choosenLanguage == 'VI' ? Colors.blue : Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    languageProvider.setLanguage(Vietnamese());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                  languageProvider.language.switchSuccessfully),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(languageProvider.vi,
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
