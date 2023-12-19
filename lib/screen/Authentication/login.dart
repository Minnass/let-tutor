import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/auth/auth.api.dart';
import 'package:lettutor/data/network/apis/auth/request/login.request.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/domains/tuple.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/utils/validate_email.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isAuthenticating = false;
  String _emailErrorText = '';
  String chosenLanguage = 'English';
  AuthApi authApi = AuthApi(DioClient(Dio()));
  void _handleEmailvalidation() {
    Tuple _EmailValidation = validateEmail(_emailController.text);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  Future<void> _handleEmailLogin(
      LoginRequest request, AuthProvider authProvider) async {
    try {
      setState(() {
        _isAuthenticating = true;
      });

      final res = await authApi.login(request);

        if (res.user != null) {
        setState(() {
          _isAuthenticating = false;
        });
        authProvider.login(res.user, res.tokens?.access, res.tokens?.refresh);
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamed(context, Routes.main);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Login successfully.'),
                ),
              ],
            ),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (error) {
      setState(() {
        _isAuthenticating = false;
      });

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
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: _isAuthenticating
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: DropdownButton<String>(
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
                      onChanged: (String? language) {},
                    ),
                  ),
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Email',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
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
                      hintText: 'abc@example.com',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: _emailErrorText.isEmpty
                            ? Colors.blue
                            : Colors.red[700],
                      ),
                      errorText:
                          _emailErrorText.isEmpty ? null : _emailErrorText,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Password',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    autocorrect: false,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      hintText: '******',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () async {
                      if (_emailErrorText.isEmpty &&
                          !_passwordController.text.isEmpty) {
                        final request = LoginRequest(
                            email: _emailController.text,
                            password: _passwordController.text);
                        await _handleEmailLogin(request, authProvider);
                      }
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                        backgroundColor: Colors.blue),
                    child: Text(
                      'Login',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgotPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Or continue with',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image.asset(
                                'assets/logo/facebook.png',
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Image.asset(
                                'assets/logo/google.png',
                              ),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Icon(
                                Icons.smartphone,
                                size: 24.0,
                                color: Colors.blue,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member yet?',
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(
                          'Sign up',
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
