import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/models/tutor/tutor.dart';
import 'package:lettutor/providers/favorite.provider.dart';
import 'package:lettutor/screen/homepage/home_page_header.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';
import 'package:lettutor/widgets/tutor_card.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Tutor> tutors = [];
  List<String> favourites = [];
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favouriteRepository = context.watch<FavoriteProvider>();
    favourites = favouriteRepository.itemIds;
    tutors = context.watch<List<Tutor>>();
    tutors.sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));
    List<Tutor> favoriteTutors = [];
    List<Tutor> nonFavoriteTutors = [];

    // Splitting tutors into favorite and non-favorite lists
    tutors.forEach((tutor) {
      if (favourites.contains(tutor.id)) {
        favoriteTutors.add(tutor);
      } else {
        nonFavoriteTutors.add(tutor);
      }
    });
    tutors = [...favoriteTutors, ...nonFavoriteTutors];
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
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HomePageHeader(),
            Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recommended Tutors',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(tutors);
                              Navigator.pushNamed(context, Routes.tutors);
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
