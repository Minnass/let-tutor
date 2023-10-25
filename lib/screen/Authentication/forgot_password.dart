import 'package:flutter/material.dart';
import 'package:lettutor/models/tuple.dart';
import 'package:lettutor/utils/validate_email.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  String _emailErrorText = '';
  _handleValidation() {
    Tuple _EmailValidation = validateEmail(_emailController.text);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo/lettutor.png',
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        ' LetTutor ',
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Enter registered Email',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Email',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onChanged: (value) {
                    _handleValidation();
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "abc@example.com",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: _emailErrorText.isEmpty
                          ? Colors.blue
                          : Colors.red[700],
                    ),
                    errorText: _emailErrorText.isEmpty ? null : _emailErrorText,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    _handleValidation();
                    if (_emailErrorText.isEmpty) {
                      print('No-Loi');
                    } else {
                      print('Co loi');
                    }
                  },
                  style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(56),
                      backgroundColor: Colors.blue),
                  child: Text(
                    'Send Recovery Email',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back to login',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )));
  }
}
