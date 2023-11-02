import 'package:flutter/material.dart';
import 'package:lettutor/widgets/course_card.dart';
import 'package:lettutor/widgets/ebook_card.dart';
import 'package:lettutor/widgets/search_bar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key});

  @override
  State<CourseScreen> createState() => _CoursePageState();
}

class _CoursePageState extends State<CourseScreen> {
  final _searchController = TextEditingController();
  final List<String> topics = [
    "For Studying Abroad",
    "English for Traveling",
    "Business English",
    // Add more topics here
  ];
  final List<String> levels = ["Beginner", "Intermediate", "Proficiency"];
  List<String> selectedTopics = [];
  List<String> selectedLevels = [];
  void handleSearchSubmit(String searchText) {
    print('Search submitted: $searchText');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.school_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 1),
                    Text(
                      'All Courses',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.book_online_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 1),
                    Text(
                      'E-Books',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.book_online,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 1),
                    Text(
                      'Interactive Book',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
            onTap: (index) {
              print('Current Tab: $index');
            },
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CustomSearchBar(onSubmitted: handleSearchSubmit),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Text(
                        'Topics',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: topics.map((topic) {
                              final bool isSelected =
                                  selectedTopics.contains(topic);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  label: Text(topic),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        selectedTopics.add(topic);
                                      } else {
                                        selectedTopics.remove(topic);
                                      }
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Levels',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: levels.map((level) {
                              final bool isSelected =
                                  selectedLevels.contains(level);
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ChoiceChip(
                                    label: Text(level),
                                    selected: isSelected,
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedLevels.add(level);
                                          print(selectedLevels);
                                        } else {
                                          selectedLevels.remove(level);
                                        }
                                      });
                                    },
                                  ));
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CourseCard(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 8),
                        itemCount: 10),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => EbookCard(),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(height: 8),
                        itemCount: 10),
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
