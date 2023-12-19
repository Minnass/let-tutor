import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/domains/course/course.dart';
import 'package:lettutor/screen/course/course_detail.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CourseDetailScreen(course: course),
        ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.network(
                course.imageUrl != null
                    ? course.imageUrl
                    : 'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name != null ? course.name : '',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      course.description != null ? course.description : '',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          course.level != null ? course.level : '',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                        Text(
                            course.topics != null
                                ? course.topics.length.toString() + ' Lessons'
                                : '',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600))
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
