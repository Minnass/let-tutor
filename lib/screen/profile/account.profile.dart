import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/const/countries.dart';
import 'package:lettutor/const/courseLevels.dart';
import 'package:lettutor/const/testPreparation.dart';
import 'package:lettutor/const/topic.dart';
import 'package:lettutor/data/network/apis/user/request/update_info.request.dart';
import 'package:lettutor/data/network/apis/user/user.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/utils/country_convertor.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:provider/provider.dart';

class AccountProfileScreen extends StatefulWidget {
  const AccountProfileScreen({Key? key}) : super(key: key);
  @override
  State<AccountProfileScreen> createState() => _AccountProfileScreenState();
}

class _AccountProfileScreenState extends State<AccountProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  String _nameError = '';
  TextEditingController _studyScheduleController = TextEditingController();
  late LanguageProvider languageProvider;
  late AuthProvider authProvider;
  late User user;
  UserApi userApi = UserApi(DioClient(Dio()));
  final ImagePicker picker = ImagePicker();
  List<String> chosenTopics = [];
  List<String> chosenTestPreparations = [];
  late String country;
  late String level;
  bool firstLoad = true;
  void validateName() {
    if (_nameController.text.isEmpty) {
      _nameError = languageProvider.language.emptyRequest;
    } else {
      _nameError = '';
    }
  }

  Future<void> save() async {
    validateName();
    if (_nameError.isEmpty) {
      try {
        await userApi.updateInfor(UpdateRequest(
            name: _nameController.text,
            country: country,
            birthday: '202-232',
            level: level,
            studySchedule: _studyScheduleController.text,
            learnTopics: chosenTopics,
            testPreparations: chosenTestPreparations));
        authProvider.updateUser(
            _nameController.text,
            country,
            null,
            'da',
            level,
            _studyScheduleController.text,
            chosenTopics,
            chosenTestPreparations);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(languageProvider.language.updateSuccess),
                ),
              ],
            ),
            duration: Duration(seconds: 1),
          ),
        );
      } catch (error) {}
    }
    setState(() {});
  }

  void initValue(User user) {
    _nameController.text = user.name ?? '';
    _studyScheduleController.text = user.studySchedule ?? '';
    chosenTopics =
        user.learnTopics?.map((e) => e.id.toString() ?? '').toList() ?? [];
    chosenTestPreparations =
        user.testPreparations?.map((e) => e.id.toString() ?? '').toList() ?? [];
    level = user.level;
    country = user.country!;
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    authProvider = context.watch<AuthProvider>();
    user = authProvider.getCurrentUser();
    userApi.setToken(authProvider.getToken());
    if (firstLoad) {
      initValue(user);
      firstLoad = false;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(languageProvider.language.profile,
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
                    Container(
                      width: 70,
                      height: 70,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: user.avatar != null
                          ? Image.network(
                              user.avatar!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                Icons.error_outline_rounded,
                                color: Colors.red,
                                size: 32,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 50,
                              child: Text(
                                getFirstCharacters(user.name),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                    ),
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
              languageProvider.language.name,
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
                errorText: _nameError.isEmpty ? null : _nameError,
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
              languageProvider.language.email,
              style: TextStyle(fontSize: 16, color: Colors.grey[900]),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: TextEditingController(text: user.email),
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
              languageProvider.language.country,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 4),
            DropdownButtonFormField(
              isExpanded: true,
              value: country,
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
                country = value!;
              },
            ),
            const SizedBox(height: 16),
            Text(languageProvider.language.phoneNumber,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            TextField(
              controller: TextEditingController(text: user.phone),
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
            Text(languageProvider.language.birthDay,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            // SelectDate(initialDate: user.birthday),
            const SizedBox(height: 16),
            Text(languageProvider.language.level,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                )),
            const SizedBox(height: 4),
            DropdownButtonFormField(
              value: level,
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
                        value: entry.key,
                        child: Text(entry.value),
                      ))
                  .toList(),
              onChanged: (value) {
                level = value!;
              },
            ),
            const SizedBox(height: 16),
            Text(
              languageProvider.language.topic,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Wrap(
              spacing: 8,
              runSpacing: -4,
              children: topics.entries.map((entry) {
                final isSelected = chosenTopics.contains(entry.key);
                return ChoiceChip(
                  backgroundColor: Colors.grey[100],
                  selectedColor: Colors.lightBlue[100],
                  selected: isSelected,
                  label: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue[700] : Colors.black54,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        chosenTopics.add(entry.key);
                      } else {
                        chosenTopics.remove(entry.key);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(
              height: 4,
            ),
            Text(
              languageProvider.language.testPreparation,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[900],
              ),
            ),

            const SizedBox(
              height: 4,
            ),
            Wrap(
              spacing: 8,
              runSpacing: -4,
              children: testPreparation.entries.map((entry) {
                final isSelected = chosenTestPreparations.contains(entry.key);
                return ChoiceChip(
                  backgroundColor: Colors.grey[100],
                  selectedColor: Colors.lightBlue[100],
                  selected: isSelected,
                  label: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue[700] : Colors.black54,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        chosenTestPreparations.add(entry.key);
                      } else {
                        chosenTestPreparations.remove(entry.key);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(languageProvider.language.studySchedule,
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
                save();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                languageProvider.language.save,
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
