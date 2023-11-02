import 'package:flutter/material.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      surfaceTintColor: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.teacherDetail);
                    },
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
                      radius: 32,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Keegan',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '2022-10-20    10:00 - 10:55,',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_note_outlined,
                      size: 25,
                      color: Colors.blue[700],
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                    onPressed: () => {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.videoCall);
                      },
                      child: const Text(
                        'Go to meeting',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
