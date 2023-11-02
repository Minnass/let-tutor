import 'package:flutter/material.dart';

class EbookCard extends StatelessWidget {
  const EbookCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Image.network(
              'https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afilelets_go.jpeg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What  a word 1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Let\'s go starter',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Beginner',
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
