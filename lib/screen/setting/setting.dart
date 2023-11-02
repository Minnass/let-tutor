import 'package:flutter/material.dart';
import 'package:lettutor/widgets/setting_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
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
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.red,
                              size: 32,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Phan Nhat Trieu',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'phannhattrieu012@gmail.com',
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: SettingItem(
                        text: 'View Feedbacks',
                        iconData: Icons.person_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                        onTap: () => {},
                        child: const SettingItem(
                            text: 'Booking History', iconData: Icons.list)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () => {},
                      child: const SettingItem(
                          text: 'Courses', iconData: Icons.school),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: SettingItem(
                        text: 'Advanced Settings',
                        iconData: Icons.settings_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                        onTap: () => {},
                        child: const SettingItem(
                            text: 'Become a tutor',
                            iconData: Icons.emoji_people)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: SettingItem(
                        text: 'Our Website', iconData: Icons.language),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Text('Version 1.0.0'),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Background color for Submit
                      minimumSize: Size(double.infinity,
                          50), // Set the minimum width and height
                    ),
                    child: Text('Logout'),
                  )
                ],
              ))),
    );
  }
}