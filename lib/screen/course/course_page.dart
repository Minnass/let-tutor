import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/course/course.api.dart';
import 'package:lettutor/data/network/apis/course/request/course_pagination.request.dart';
import 'package:lettutor/data/network/apis/course/response/course_pagination.response.dart';
import 'package:lettutor/data/network/constants/pagination.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/widgets/course_card.dart';
import 'package:lettutor/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key});

  @override
  State<CourseScreen> createState() => _CoursePageState();
}

class _CoursePageState extends State<CourseScreen> {
  final controller = ScrollController();
  bool hasNext = true;
  List<CourseResponse> courses = [];
  int page = 1;
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
  bool _isLoading = true;

  CourseApi courseApi = CourseApi(DioClient(Dio()));

  void handleSearchSubmit(String searchText) {}
  Future<void> _fetchCourse() async {
    try {
      final res = await courseApi.getPagedCourse(
          PagedCourseRequest(page: 1, size: page * Pagination.pageSize));
      courses = res.data?.rows ?? [];
      hasNext = res.data!.count! > courses.length;
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
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

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        page++;
        _fetchCourse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    courseApi.setToken(authProvider.getToken());
    _fetchCourse();
    return DefaultTabController(
      length: 2,
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
            ],
            onTap: (index) {},
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
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8),
                          child: ListView.separated(
                            controller: controller,
                            itemBuilder: (context, index) {
                              if (index < courses.length) {
                                final item = courses[index];
                                return CourseCard(course: item);
                              } else if (hasNext) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 8),
                            itemCount: courses.length + 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                CourseCard(course: courses[index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(height: 8),
                            itemCount: courses.length,
                          ),
                        ),
                      ],
                    ))
        ],
      ),
    );
  }
}
