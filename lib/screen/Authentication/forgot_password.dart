import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/data/network/apis/auth/auth.api.dart';
import 'package:lettutor/data/network/apis/auth/request/forgot_password.request.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/domains/tuple.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/utils/validate_email.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  AuthApi authApi = AuthApi(DioClient(Dio()));
  String _emailErrorText = '';
  _handleValidation() {
    Tuple _EmailValidation = validateEmail(_emailController.text);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  Future<void> _handleForgotPassword() async {
    try {
      final res = await authApi
          .forgotPassword(ForgotPassword(email: _emailController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Expanded(
                child: Text('Email send success!'),
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
                  onPressed: () async {
                    _handleValidation();
                    if (_emailErrorText.isEmpty) {
                      await _handleForgotPassword();
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
