import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/models/tuple.dart';
import 'package:lettutor/models/user/account.dart';
import 'package:lettutor/providers/auth.provider.dart';
import 'package:lettutor/utils/validate_email.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String chosenLanguage = 'English';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _emailErrorText = '';
  String _passwordErrorText = '';
  String _confirmErrorText = '';

  void _handleEmailvalidation() {
    Tuple _EmailValidation = validateEmail(_emailController.text);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  void _handlePasswordValidation() {
    if (_passwordController.text.isEmpty) {
      _passwordErrorText = "Password cannot be empty";
    } else if (_passwordController.text.length < 6) {
      _passwordErrorText = "Password must be at least 6 characters";
    } else {
      _passwordErrorText = '';
    }
    setState(() {});
  }

  void _handleConfirmPasswordValidation() {
    if (_confirmPasswordController.text.isEmpty) {
      _confirmErrorText = 'Confirm password cannot be empty';
    } else if (_confirmPasswordController.text.length < 6) {
      _confirmErrorText = 'Confirm password must be at least 6 characters';
    } else if (_confirmPasswordController.text != _passwordController.text) {
      _confirmErrorText = 'Confirm password does not match';
    } else {
      _confirmErrorText = '';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.fromLTRB(16, MediaQuery.of(context).padding.top, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        'Back',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                DropdownButton<String>(
                  value: chosenLanguage,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'English',
                      child: Text('English'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Tiếng Việt',
                      child: Text('Tiếng Việt'),
                    ),
                  ],
                  onChanged: (String? language) {
                    // Handle language selection
                    setState(() {
                      chosenLanguage = language ?? 'English';
                    });
                  },
                ),
              ],
            ),
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
              'Password',
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
              'Confirm Password',
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
              onPressed: () {
                _handlePasswordValidation();
                _handleConfirmPasswordValidation();
                _handleEmailvalidation();
                if (_emailErrorText.isEmpty &&
                    _passwordErrorText.isEmpty &&
                    _confirmErrorText.isEmpty) {
                  bool success =
                      Provider.of<AuthProvider>(context, listen: false)
                          .registerNewAccount(Account(
                              email: _emailController.text,
                              password: _passwordController.text));
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Register successfully.'),
                        duration: Duration(seconds: 1)));
                    Navigator.pushNamed(context, Routes.login);
                  }
                }
              },
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  backgroundColor: Colors.blue),
              child: Text(
                'Register',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already account',
                  style: const TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
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
