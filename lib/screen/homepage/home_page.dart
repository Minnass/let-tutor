import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/screen/homepage/home_page_header.dart';
import 'package:lettutor/screen/tutors/tutor_detail.dart';
import 'package:lettutor/widgets/tutor_card.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
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
                              Navigator.pushNamed(context, Routes.tutors);
                            },
                            child: const Text(
                              'See all',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ]),
                    TutorSearchCard(),
                    TutorSearchCard(),
                    TutorSearchCard(),
                    TutorSearchCard(),
                  ],
                ))
          ]),
        ));
  }
}
