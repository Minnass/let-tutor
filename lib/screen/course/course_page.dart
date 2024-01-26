import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/const/categories.dart';
import 'package:lettutor/data/network/apis/course/course.api.dart';
import 'package:lettutor/data/network/apis/course/request/course_pagination.request.dart';
import 'package:lettutor/data/network/apis/course/response/course_pagination.response.dart';
import 'package:lettutor/data/network/constants/pagination.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/utils/level_converter.dart';
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
  PagedCourseRequest request =
      PagedCourseRequest(page: 1, size: Pagination.pageSize);
  final _searchController = TextEditingController();
  final List<String> levels = [
    "Any Level",
    "Beginner",
    "Intermediate",
    "Advanced"
  ];
  late String? selectedTopics = '';
  late String? selectedLevel = '';
  bool _isFirstLoading = true;
  int page = 1;
  late LanguageProvider languageProvider;
  CourseApi courseApi = CourseApi(DioClient(Dio()));

  void handleSearchSubmit(String searchText) {
    request.keyword = searchText;
    _fetchCourse();
  }

  Future<void> _fetchCourse() async {
    try {
      final res = await courseApi.getPagedCourse(request);
      courses = res.data?.rows ?? [];
      hasNext = res.data!.count! > courses.length;
      setState(() {
        _isFirstLoading = false;
      });
    } catch (error) {
      setState(() {
        _isFirstLoading = false;
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
      if (controller.position.maxScrollExtent == controller.position.pixels &&
          hasNext) {
        request.page = 1;
        page++;
        request.size = (page  ) * 10;
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
    languageProvider = context.watch<LanguageProvider>();
    final authProvider = context.watch<AuthProvider>();
    courseApi.setToken(authProvider.getToken());
    if (_isFirstLoading) {
      _fetchCourse();
    }
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 1),
                    Text(
                      languageProvider.language.allCourse,
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
                            children: categories.entries.map((category) {
                              final bool isSelected = selectedTopics ==
                                  category.key; // Check if level is selected
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  label: Text(category.value),
                                  selected: isSelected,
                                  onSelected: (selected) async {
                                    setState(() {
                                      page = 1;
                                      if (selected) {
                                        selectedTopics =
                                            category.key; // Set selected level
                                      } else {
                                        selectedTopics =
                                            null; // Deselect level if already selected
                                      }
                                    });
                                    request.categoryId = selectedTopics;
                                    await _fetchCourse();
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
                              final bool isSelected = selectedLevel ==
                                  level; // Check if level is selected
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChoiceChip(
                                  label: Text(level),
                                  selected: isSelected,
                                  onSelected: (selected) async {
                                    setState(() {
                                      page = 1;
                                      if (selected) {
                                        selectedLevel =
                                            level; // Set selected level
                                      } else {
                                        selectedLevel =
                                            null; // Deselect level if already selected
                                      }
                                    });
                                    request.level =
                                        convertStringToLevel(selectedLevel!);

                                    await _fetchCourse();
                                  },
                                ),
                              );
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
              child: _isFirstLoading
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
