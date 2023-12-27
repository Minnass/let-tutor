import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/domains/entity/user/user.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/screen/Authentication/login.dart';
import 'package:lettutor/screen/profile/account.profile.dart';
import 'package:lettutor/screen/profile/become_tutor.dart';
import 'package:lettutor/screen/setting/advanced_setting.dart';
import 'package:lettutor/utils/enum/login_type.dart';
import 'package:lettutor/utils/first_character.dart';
import 'package:lettutor/widgets/setting_item.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late LanguageProvider languageProvider;
  late AuthProvider authProvider;
  Future<void> signout(AuthProvider authProvider) async {
    if (authProvider.loginType == LoginType.google) {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
    }
    authProvider.logout();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Expanded(
              child: Text(languageProvider.language.signoutSuccessfully),
            ),
          ],
        ),
        duration: Duration(seconds: 1),
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  late User user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of<LanguageProvider>(context);
    authProvider = context.watch<AuthProvider>();
    user = authProvider.getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          languageProvider.language.setting,
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
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0, right: 10.0),
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 70,
                          height: 70,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: user.avatar != null
                              ? Image.network(
                                  user.avatar!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.error_outline_rounded,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 50,
                                  child: Text(
                                    getFirstCharacters(user.name),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Text(
                        user.name ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AccountProfileScreen()));
                        },
                        child: Text(languageProvider.language.editProfile),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: SettingItem(
                        text: languageProvider.language.viewFeedback,
                        iconData: Icons.person_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                        onTap: () => {},
                        child: SettingItem(
                            text: languageProvider.language.bookingHistory,
                            iconData: Icons.list)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () => {},
                      child: SettingItem(
                          text: languageProvider.language.courses,
                          iconData: Icons.school),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const AdvancedSettingPage())),
                      child: SettingItem(
                          text: languageProvider.language.advancedSetting,
                          iconData: Icons.settings_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                        onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      const TutorRegisteringPage())),
                            },
                        child: SettingItem(
                            text: languageProvider.language.becomeTutor,
                            iconData: Icons.emoji_people)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () {
                        launch('https://sandbox.app.lettutor.com/');
                      },
                      child: SettingItem(
                          text: languageProvider.language.website,
                          iconData: Icons.language),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const Text('Version 1.0.0'),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _showLogoutConfirmation(authProvider);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Background color for Submit
                      minimumSize: Size(double.infinity,
                          50), // Set the minimum width and height
                    ),
                    child: Text(languageProvider.language.logout),
                  )
                ],
              ))),
    );
  }

  Future<void> _showLogoutConfirmation(AuthProvider authProvider) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildLogoutDialog(context);
      },
    ).then((value) => {
          if (value) {signout(authProvider)}
        });
  }

  AlertDialog _buildLogoutDialog(BuildContext context) {
    return AlertDialog(
      title: Text(languageProvider.language.logoutTitle,
          style: TextStyle(fontWeight: FontWeight.normal)),
      actions: <Widget>[
        ElevatedButton(
          child: Text(languageProvider.language.ok),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.blue), // Border color
          ),
          child: Text(languageProvider.language.cancel),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
  