import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/auth/auth.api.dart';
import 'package:lettutor/data/network/apis/auth/request/register.request.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/utils/tuple.dart';
import 'package:lettutor/utils/language/english.dart';
import 'package:lettutor/utils/language/vietnam.dart';
import 'package:lettutor/utils/validate_email.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String chosenLanguage;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  AuthApi authApi = AuthApi(DioClient(Dio()));
  late LanguageProvider languageProvider;
  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _confirmErrorText = '';

  void _handleEmailvalidation() {
    Tuple _EmailValidation =
        validateEmail(_emailController.text, languageProvider);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  void _handlePasswordValidation() {
    if (_passwordController.text.isEmpty) {
      _passwordErrorText = languageProvider.language.emptyPassword;
    } else if (_passwordController.text.length < 6) {
      _passwordErrorText = languageProvider.language.passwordTooShort;
    } else {
      _passwordErrorText = '';
    }
    setState(() {});
  }

  void _handleConfirmPasswordValidation() {
    if (_confirmPasswordController.text.isEmpty) {
      _confirmErrorText = languageProvider.language.confirmPasswordEmpty;
    } else if (_confirmPasswordController.text.length < 6) {
      _confirmErrorText = languageProvider.language.passwordTooShort;
    } else if (_confirmPasswordController.text != _passwordController.text) {
      _confirmErrorText = languageProvider.language.confirmPasswordNotMatch;
    } else {
      _confirmErrorText = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = context.watch<LanguageProvider>();
    chosenLanguage = languageProvider.language.id;
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    Text(
                      languageProvider.language.backButton,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButton<String>(
                value: chosenLanguage,
                items: [
                  DropdownMenuItem<String>(
                    value: 'EN',
                    child: Text(languageProvider.en),
                  ),
                  DropdownMenuItem<String>(
                    value: 'VI',
                    child: Text(languageProvider.vi),
                  ),
                ],
                onChanged: (String? language) {
                  if (language == 'VI') {
                    chosenLanguage = 'VI';
                    languageProvider.setLanguage(Vietnamese());
                  } else {
                    chosenLanguage = 'EN';
                    languageProvider.setLanguage(English());
                  }
                },
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: Image.asset(
                  'assets/logo/banner.png',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Email",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (value) {
                _handleEmailvalidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "abc@example.com",
                prefixIcon: Icon(
                  Icons.mail,
                  color:
                      _emailErrorText.isEmpty ? Colors.blue : Colors.red[700],
                ),
                errorText: _emailErrorText.isEmpty ? null : _emailErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              languageProvider.language.password,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              autocorrect: false,
              onChanged: (value) {
                _handlePasswordValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "******",
                prefixIcon: Icon(
                  Icons.lock,
                  color: _passwordErrorText.isEmpty
                      ? Colors.blue
                      : Colors.red[700],
                ),
                errorText:
                    _passwordErrorText.isEmpty ? null : _passwordErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              languageProvider.language.confirmPassword,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              autocorrect: false,
              onChanged: (value) {
                _handleConfirmPasswordValidation();
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: "******",
                prefixIcon: Icon(
                  Icons.lock,
                  color:
                      _confirmErrorText.isEmpty ? Colors.blue : Colors.red[700],
                ),
                errorText: _confirmErrorText.isEmpty ? null : _confirmErrorText,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () async {
                _handlePasswordValidation();
                _handleConfirmPasswordValidation();
                _handleEmailvalidation();
                if (_emailErrorText.isEmpty &&
                    _passwordErrorText.isEmpty &&
                    _confirmErrorText.isEmpty) {
                  final registerRequest = RegisterRequest(
                      email: _emailController.text,
                      password: _passwordController.text);
                  try {
                    final res = await authApi.register(registerRequest);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: Colors.green), // Success icon
                            SizedBox(
                                width:
                                    8), // Adjust spacing between icon and text
                            Expanded(
                              child: Text(
                                languageProvider.language.registerSuccess,
                                // Style the text as needed
                              ),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    Navigator.pushNamed(context, Routes.login);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            Icon(Icons.error, color: Colors.red), // Error icon
                            SizedBox(
                                width:
                                    8), // Adjust spacing between icon and text
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
              },
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  backgroundColor: Colors.blue),
              child: Text(
                languageProvider.language.register,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  languageProvider.language.alreadyHaveAccount,
                  style: const TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    languageProvider.language.login,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
