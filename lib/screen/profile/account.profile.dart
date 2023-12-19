import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/const/countries.dart';
import 'package:lettutor/const/courseLevels.dart';
import 'package:lettutor/domains/tutor/tutor.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/utils/country_convertor.dart';
import 'package:lettutor/widgets/custom_circle_avatar.dart';
import 'package:lettutor/widgets/date_selector.dart';
import 'package:provider/provider.dart';

class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({Key? key}) : super(key: key);
  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _studyScheduleController = TextEditingController();
  late Tutor account;
  final ImagePicker picker = ImagePicker();
  void Save() {
    account.name = _nameController.text;
    account.studySchedule = _studyScheduleController.text;
  }

  @override
  Widget build(BuildContext context) {
    account = Provider.of<AuthProvider>(context).tutor;
    _nameController.text = account.name;
    _studyScheduleController.text = account.studySchedule ?? '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(children: [
                Stack(
                  children: [
                    CustomCircleAvatar(
                        dimension: 120, avatarUrl: account.avatar ?? ''),
                    Positioned(
                      child: GestureDetector(
                        onTap: () async {
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.grey,
                            child: const Center(
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                      ),
                      bottom: 0,
                      right: 0,
                    )
                  ],
                )
              ]),
            ),
            const SizedBox(height: 16),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _nameController,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Email Address',
              style: TextStyle(fontSize: 16, color: Colors.grey[900]),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: TextEditingController(text: account.email),
              enabled: false,
              autocorrect: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Country',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField(
              isExpanded: true,
              value: account.country,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              items: countryList.keys
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        convertFromCodeToName(e),
                        overflow: TextOverflow.ellipsis,
                      )))
                  .toList(),
              onChanged: (value) {
                account.country = value;
              },
            ),
            const SizedBox(height: 16),
            Text('Phone Number',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            TextField(
              controller: TextEditingController(text: account.phone),
              enabled: false,
              autocorrect: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Birthday',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            SelectDate(initialDate: account.birthday),
            const SizedBox(height: 16),
            Text('Level',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            DropdownButtonFormField(
              value: account.level,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              items: courseLevels.entries
                  .map((entry) => DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.value),
                      ))
                  .toList(),
              onChanged: (value) {
                account.level = value;
              },
            ),
            const SizedBox(height: 16),
            Text('Study Schedule',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            TextField(
              controller: _studyScheduleController,
              autocorrect: false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Provider.of<AuthProvider>(context)
                    .updateAccount('ad', 'da', 'da', 'ad');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Row(
                //       children: [
                //         Icon(Icons.check_circle, color: Colors.green),
                //         SizedBox(width: 8),
                //         Expanded(
                //           child: Text(
                //             'Update profile successfully',
                //           ),
                //         ),
                //       ],
                //     ),
                //     duration: Duration(seconds: 1),
                //   ),
                // );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'SAVE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
