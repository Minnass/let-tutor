import 'package:flutter/material.dart';
import 'package:lettutor/widgets/course_card.dart';
import 'package:lettutor/widgets/search_bar.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
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
      child: Scaffold(
        body: Column(
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
            Expanded(
              child: SingleChildScrollView(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CourseCard(),
                          CourseCard(),
                          CourseCard(),
                          CourseCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
