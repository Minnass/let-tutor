import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_pagination.request.dart';
import 'package:lettutor/data/network/apis/tutor/response/tutor_pagination.response.dart';
import 'package:lettutor/data/network/apis/tutor/tutor.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/favorite.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/widgets/search_bar.dart';
import 'package:lettutor/widgets/tutor_card.dart';
import 'package:provider/provider.dart';

class TutorSearchScreen extends StatefulWidget {
  bool hasBackButton;
  TutorSearchScreen({Key? key, required this.hasBackButton}) : super(key: key);

  @override
  _TutorSearchScreenState createState() => _TutorSearchScreenState();
}

const tags = [
  'All',
  'English for Kids',
  'English for Business',
  'Conversational',
  'TOEIC',
  'TOEFL',
  'IELTS',
  'KET',
  'PET',
  'MOVERS',
  'FLYERS',
  'STARTERS'
];

class _TutorSearchScreenState extends State<TutorSearchScreen> {
  var countryCode = 'VN';
  List<TutorResponse> tutors = [];
  List<TutorResponse> filteredTutor = [];
  List<String> favourites = [];
  TutorApi tutorApi = TutorApi(DioClient(Dio()));
  List<String> selectedTags = ['All'];
  String keyWord = '';
  bool _isLoading = true;
  late LanguageProvider languageProvider;
  @override
  void initState() {
    super.initState();
  }

  void filterTutor() {
    filteredTutor = tutors;
    if (!selectedTags.contains('All')) {
      filteredTutor = filteredTutor
          .where((tutor) => tutor.country.toString() == countryCode)
          .toList();
    }
    if (!(selectedTags.length == 1 && selectedTags.contains('All') ||
        selectedTags.length == 0)) {
      filteredTutor = filteredTutor.where((tutor) {
        return tutor.specialties
                ?.any((specialty) => selectedTags.contains(specialty)) ??
            false;
      }).toList();
    }
    if (!keyWord.isEmpty) {
      filteredTutor = filteredTutor
          .where((tutor) =>
              tutor.name?.toLowerCase().contains(keyWord.toLowerCase()) ??
              false)
          .toList();
    }
    setState(() {});
  }

  void handleSearchSubmit(String searchText) {
    keyWord = searchText;
    filterTutor();
  }

  void _sortTutor() {
    tutors.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    List<TutorResponse> favoriteTutors = [];
    List<TutorResponse> nonFavoriteTutors = [];
    late LanguageProvider languageProvider;
    tutors.forEach((tutor) {
      if (favourites.contains(tutor.id)) {
        favoriteTutors.add(tutor);
      } else {
        nonFavoriteTutors.add(tutor);
      }
    });
    tutors = [...favoriteTutors, ...nonFavoriteTutors];
    filteredTutor = tutors;
    _isLoading = false;
    setState(() {});
  }

  Future<void> _fetchTutor() async {
    try {
      final res = await tutorApi.getTutorsWithPagination(
          GetPaginatedTutorRequest(perPage: 10, page: 1));
      tutors = res.tutors?.rows ?? [];
      _sortTutor();
    } catch (error) {
      _isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  error.toString(),
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 1),
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    languageProvider = context.watch<LanguageProvider>();
    favourites = context.watch<FavoriteProvider>().itemIds;
    tutorApi.setToken(authProvider.getToken());
    if (_isLoading) {
      _fetchTutor();
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: widget.hasBackButton,
          elevation: 0,
          title:  Text(
            languageProvider.language.tutor,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
