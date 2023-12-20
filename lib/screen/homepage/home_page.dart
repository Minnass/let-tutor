import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/tutor/request/tutor_pagination.request.dart';
import 'package:lettutor/data/network/apis/tutor/response/tutor_pagination.response.dart';
import 'package:lettutor/data/network/apis/tutor/tutor.api.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/favorite.provider.dart';
import 'package:lettutor/screen/homepage/home_page_header.dart';
import 'package:lettutor/widgets/tutor_card.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<TutorResponse> tutors = [];
  List<String> favourites = [];
  bool _isLoading = true;
  TutorApi tutorApi = TutorApi(DioClient(Dio()));
  Future<void> _fetchRecommendedTutors(
      FavoriteProvider favoriteProvider) async {
    try {
      final res = await tutorApi.getTutorsWithPagination(
          GetPaginatedTutorRequest(perPage: 10, page: 1));
      tutors = res.tutors?.rows ?? [];
      favourites =
          res.favoriteTutors?.map((e) => e.secondId ?? '').toList() ?? [];
      favoriteProvider.setListIds(favourites);
      _sortTutor();
    } catch (error) {
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
    }
  }

  void _sortTutor() {
    tutors.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    List<TutorResponse> favoriteTutors = [];
    List<TutorResponse> nonFavoriteTutors = [];

    tutors.forEach((tutor) {
      if (favourites.contains(tutor.id)) {
        favoriteTutors.add(tutor);
      } else {
        nonFavoriteTutors.add(tutor);
      }
    });
    tutors = [...favoriteTutors, ...nonFavoriteTutors];
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    tutorApi.setToken(authProvider.getToken());
    FavoriteProvider favouriteRepository = context.watch<FavoriteProvider>();
    if (_isLoading) {
      _fetchRecommendedTutors(favouriteRepository);
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white10,
            leading: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo/lettutor.png',
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      ' LetTutor ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            leadingWidth: 200),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomePageHeader(),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Recommended Tutors',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, Routes.tutors);
                                      },
                                      child: const Text(
                                        'See all',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ]),
                              Visibility(
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: tutors.length,
                                      itemBuilder: (context, index) {
                                        return TutorSearchCard(
                                          tutor: tutors[index],
                                        );
                                      }))
                            ],
                          ))
                    ]),
              ));
  }
}
