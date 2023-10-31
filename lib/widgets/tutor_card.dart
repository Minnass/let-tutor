import 'package:flutter/material.dart';

class TutorSearchCard extends StatefulWidget {
  const TutorSearchCard({super.key});

  @override
  State<TutorSearchCard> createState() => _TutorSearchCardState();
}

class _TutorSearchCardState extends State<TutorSearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://img.washingtonpost.com/rw/2010-2019/WashingtonPost/2015/08/28/Editorial-Opinion/Images/DEM_2016_Biden_-08d5c-2005.jpg?uuid=MwRy3k27EeWE35I7PvGmSw',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Bidden',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Row(
                            children: [
                              Image.network(
                                'https://tse2.mm.bing.net/th?id=OIP.iMnXKOix_JvmgbMnjr7tbAHaFO&pid=Api&P=0&h=180', // Replace with the path to the flag image
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 8),
                              Text('United States',
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              const Icon(Icons.star, color: Colors.amber),
                              const Icon(Icons.star, color: Colors.amber),
                              const Icon(Icons.star, color: Colors.amber),
                              const Icon(Icons.star, color: Colors.amber)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: false
                          ? const Icon(
                              Icons.favorite_rounded,
                              color: Color.fromARGB(255, 65, 60, 60),
                            )
                          : Icon(Icons.favorite_border_rounded,
                              color: Colors.blue))
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 3,
                children: [
                  Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      'English',
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      'English for kid',
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      'IELTS',
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Chip(
                    backgroundColor: Colors.lightBlue[50],
                    label: Text(
                      'TOEIC',
                      style: const TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Hello, my name is David, I specialize in Software Enginereering. Nice to meet you, have good day, Good bye',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  // ... (other widgets)
                  Spacer(), // This pushes the TextButton to the right
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        const SizedBox(width: 8),
                        Text('Book'),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
