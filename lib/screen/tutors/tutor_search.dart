import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:lettutor/widgets/search_bar.dart';
import 'package:lettutor/widgets/tutor_card.dart';

class TutorSearchScreen extends StatefulWidget {
  const TutorSearchScreen({Key? key}) : super(key: key);

  @override
  _TutorSearchScreenState createState() => _TutorSearchScreenState();
}

const tags = [
  'All',
  'English for kids',
  'Business English',
  'Conversational English',
  'TOEIC',
  'TOEFL',
  'IELTS',
  'KET',
  'PET',
  'Movers',
  'Flyers',
  'Starters'
];

class _TutorSearchScreenState extends State<TutorSearchScreen> {
  var countryCode = 'VN';
  List<String> selectedTags = [];

  void handleSearchSubmit(String searchText) {
    print('Search submitted: $searchText');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Tutors',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomSearchBar(onSubmitted: handleSearchSubmit),
          ),
          const SizedBox(height: 1),
          Row(
            children: [
              CountryCodePicker(
                onChanged: (country) => {},
                initialSelection: 'VN',
                showCountryOnly: true,
                showOnlyCountryWhenClosed: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tags.map((tag) {
                      final isSelected = selectedTags.contains(tag);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: FilterChip(
                          label: Text(tag),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedTags.add(tag);
                              } else {
                                selectedTags.remove(tag);
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                TutorSearchCard(),
                TutorSearchCard(),
                TutorSearchCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
