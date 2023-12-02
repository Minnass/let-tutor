import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:lettutor/models/tutor/tutor.dart';
import 'package:lettutor/widgets/search_bar.dart';
import 'package:lettutor/widgets/tutor_card.dart';
import 'package:provider/provider.dart';

class TutorSearchScreen extends StatefulWidget {
  const TutorSearchScreen({Key? key}) : super(key: key);

  @override
  _TutorSearchScreenState createState() => _TutorSearchScreenState();
}

const tags = [
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
  List<Tutor> tutors = [];
  List<Tutor> filteredTutor = [];
  List<String> selectedTags = [];
  bool isFirstBuild = true;
  void handleSearchSubmit(String searchText) {
    print('Search submitted: $searchText');
  }

  @override
  void initState() {
    super.initState();
  }

  void filterTutor() {
    filteredTutor = tutors
        .where((tutor) => tutor.country.toString() == countryCode)
        .toList();
    if (selectedTags.length > 0) {
      filteredTutor = filteredTutor.where((tutor) {
        return tutor.specialties
            .any((specialty) => selectedTags.contains(specialty));
      }).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    tutors = context.watch<List<Tutor>>();
    if (isFirstBuild) {
      filteredTutor = List.from(tutors); // Assign tutors to filteredTutor
      isFirstBuild = false; // Update the flag
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Tutors',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomSearchBar(onSubmitted: handleSearchSubmit),
              ),
              const SizedBox(height: 1),
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (CountryCode country) {
                      countryCode = country.code ?? "";
                      filterTutor();
                    },
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
                                if (selectedTags.contains(tag)) {
                                  selectedTags.remove(tag);
                                } else {
                                  selectedTags.add(tag);
                                }
                                filterTutor();
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredTutor.length,
                      itemBuilder: (context, index) {
                        return TutorSearchCard(
                          tutor: filteredTutor[index],
                        );
                      }))
            ],
          ),
        ));
  }
}
