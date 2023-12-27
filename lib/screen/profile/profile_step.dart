import 'package:dio/dio.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettutor/const/countries.dart';
import 'package:lettutor/const/specialities.dart';
import 'package:lettutor/data/network/apis/user/request/become_tutor.request.dart';
import 'package:lettutor/data/network/apis/user/user.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/utils/country_convertor.dart';
import 'package:provider/provider.dart';

enum Level { beginer, intermediate, advanced }

class ProfileStep extends StatefulWidget {
  const ProfileStep({Key? key, required this.onPressNext}) : super(key: key);
  final onPressNext;

  @override
  _ProfileStepState createState() => _ProfileStepState();
}

class _ProfileStepState extends State<ProfileStep> {
  Level? chosenLevel = Level.beginer;
  String chosenCountry = 'VI';
  late LanguageProvider languageProvider;
  DateTime selectedDate = DateTime.now();
  UserApi userApi = UserApi(DioClient(Dio()));
  late AuthProvider authProvider;
  final _interestController = TextEditingController();
  String _interestError = '';
  final _educationController = TextEditingController();
  String _educationError = '';
  final _experienceController = TextEditingController();
  String _experienceError = '';
  final _professionController = TextEditingController();
  String _professionError = '';
  List<String> chosenCountries = [];
  String _contriesError = '';
  final _introductionController = TextEditingController();
  String _introductionError = '';
  List<String> chosenSpecialities = [];
  String _specialitiesError = '';
  final _priceController = TextEditingController();
  String _priceError = '';
  void validate() {
    if (_interestController.text.isEmpty) {
      _interestError = languageProvider.language.requiredField;
    } else {
      _interestError = '';
    }
    if (_educationController.text.isEmpty) {
      _educationError = languageProvider.language.requiredField;
    } else {
      _educationError = '';
    }
    if (_experienceController.text.isEmpty) {
      _experienceError = languageProvider.language.requiredField;
    } else {
      _experienceError = '';
    }
    if (_professionController.text.isEmpty) {
      _professionError = languageProvider.language.requiredField;
    } else {
      _professionError = '';
    }
    if (chosenCountries.isEmpty) {
      _contriesError = languageProvider.language.requiredField;
    } else {
      _contriesError = '';
    }
    if (_introductionController.text.isEmpty) {
      _introductionError = languageProvider.language.requiredField;
    } else {
      _introductionError = '';
    }
    if (chosenSpecialities.isEmpty) {
      _specialitiesError = languageProvider.language.requiredField;
    } else {
      _specialitiesError = '';
    }
    if (_introductionController.text.isEmpty) {
      _introductionError = languageProvider.language.requiredField;
    } else {
      _introductionError = '';
    }
    if (_priceController.text.isEmpty) {
      _priceError = languageProvider.language.requiredField;
    } else {
      _priceError = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    authProvider = context.watch<AuthProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/become_tutor/lettutor.png',
              height: 60,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider.language.introduction,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ExpandableText(
                    languageProvider.language.setupContent,
                    expandText: languageProvider.language.more,
                    collapseText: languageProvider.language.less,
                    maxLines: 2,
                    linkColor: Colors.blue,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ),
        Row(children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 4,
          ),
          Text(
            languageProvider.language.basicInfo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 16,
        ),
        const Row(children: [
          const Expanded(child: Divider()),
          Text(
            'CV',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 16,
        ),
        Text(
          languageProvider.language.profileInfoForStudents,
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFE6F7FF),
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            languageProvider.language.privacyWarning,
            style: TextStyle(fontSize: 12),
          )),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.interests,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _interestController,
          maxLines: 3,
          decoration: InputDecoration(
            errorText: _interestError.isEmpty ? null : _interestError,
            hintText: languageProvider.language.profileSharePrompt,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.education,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _educationController,
          maxLines: 3,
          decoration: InputDecoration(
            errorText: _educationError.isEmpty ? null : _educationError,
            hintText: languageProvider.language.educationHint,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.experience,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _experienceController,
          maxLines: 3,
          decoration: InputDecoration(
            errorText: _experienceError.isEmpty
                ? null
                : _experienceError, // Use null instead of empty string
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue), // Set the default border color to blue
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Text(
          languageProvider.language.professionInfo,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _professionController,
          maxLines: 3,
          decoration: InputDecoration(
            errorText: _professionError.isEmpty ? null : _professionError,
            isDense: true,
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.blue), // Set the color to red
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 4,
          ),
          Text(
            languageProvider.language.spokenLanguage,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 8,
        ),
        Text(
          '${languageProvider.language.example} ${languageProvider.en}',
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          value: chosenCountry,
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
            chosenCountries.add(convertFromCodeToName(value!));
            chosenCountry = value!;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        ),
        _contriesError.isEmpty
            ? Container()
            : Text(
                languageProvider.language.requiredField,
                style: TextStyle(color: Colors.red),
              ),
        Wrap(
          spacing: 8,
          runSpacing: -4,
          children: chosenCountries.map((country) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChoiceChip(
                  backgroundColor: Colors.grey[100],
                  selectedColor: Colors.lightBlue[100],
                  selected: true,
                  label: Text(
                    country,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                    ),
                  ),
                  onSelected: (_) {
                    setState(() {
                      chosenCountries.remove(country);
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      chosenCountries.remove(country);
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.clear,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(children: [
          const Expanded(child: Divider()),
          const SizedBox(
            width: 4,
          ),
          Text(
            languageProvider.language.taughtAudience,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          const Expanded(child: Divider()),
        ]),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFE6F7FF),
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            languageProvider.language.firstImpressionForStudents,
            style: TextStyle(fontSize: 12),
          )),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.introduction,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _introductionController,
          maxLines: 3,
          decoration: InputDecoration(
            errorText: _introductionError.isEmpty ? null : _introductionError,
            hintText: languageProvider.language.teachingExample,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.idealStudentProfile,
        ),
        const SizedBox(
          height: 8,
        ),
        ListTile(
          title: const Text('Beginer'),
          leading: Radio<Level>(
            value: Level.beginer,
            groupValue: chosenLevel,
            onChanged: (value) => setState(() {
              chosenLevel = value;
            }),
          ),
        ),
        ListTile(
          title: const Text('Intermediate'),
          leading: Radio<Level>(
            value: Level.intermediate,
            groupValue: chosenLevel,
            onChanged: (value) => setState(() {
              chosenLevel = value;
            }),
          ),
        ),
        ListTile(
          title: const Text('Advanced'),
          leading: Radio<Level>(
            value: Level.advanced,
            groupValue: chosenLevel,
            onChanged: (value) => setState(() {
              chosenLevel = value;
            }),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          languageProvider.language.mySpecialties,
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: specialties.entries
              .map((e) => CheckboxListTile(
                    title: Text(e.value),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        chosenSpecialities.add(e.key);
                      } else if (value != null && !value) {
                        chosenSpecialities.remove(e.key);
                      }
                      setState(() {
                        // specialities[e] = value ?? false;
                      });
                    },
                    value: chosenSpecialities.contains(e.key),
                  ))
              .toList(),
        ),
        _specialitiesError.isEmpty
            ? Container()
            : Text(
                languageProvider.language.requiredField,
                style: TextStyle(color: Colors.red),
              ),
        SizedBox(
          height: 16,
        ),
        Text(
          languageProvider.language.price,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: _priceController,
          maxLines: 1,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]')), // Allow only numbers
          ],
          decoration: InputDecoration(
            errorText: _priceError.isEmpty ? null : _priceError,
            hintText: languageProvider.language.price,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        TextButton(
          onPressed: () async {
            validate();
            if (_educationError.isEmpty &&
                _contriesError.isEmpty &&
                _interestError.isEmpty &&
                _experienceError.isEmpty &&
                _introductionError.isEmpty &&
                _specialitiesError.isEmpty) {
              widget.onPressNext(BecomeTutorRequest(
                interests: _interestController.text,
                education: _educationController.text,
                experience: _experienceController.text,
                profession: _professionController.text,
                languages: chosenCountries.join(', '),
                bio: _introductionController.text,
                targetStudent: chosenLevel.toString(),
                specialties: chosenSpecialities.join(', '),
                price: _priceController.text,
              ));
            }
          },
          style: TextButton.styleFrom(
              minimumSize: const Size.fromHeight(56),
              backgroundColor: Colors.blue),
          child: Text(
            languageProvider.language.next,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
