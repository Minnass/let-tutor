import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor/const/routes.dart';
import 'package:lettutor/data/network/apis/auth/auth.api.dart';
import 'package:lettutor/data/network/apis/auth/request/login.request.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/providers/language.provider.dart';
import 'package:lettutor/utils/tuple.dart';
import 'package:lettutor/data/providers/auth.provider.dart';
import 'package:lettutor/utils/enum/login_type.dart';
import 'package:lettutor/utils/language/english.dart';
import 'package:lettutor/utils/language/vietnam.dart';
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
  late AuthProvider authProvider;
  late LanguageProvider languageProvider;
  bool _isAuthenticating = false;
  String _emailErrorText = '';
  late String chosenLanguage;
  AuthApi authApi = AuthApi(DioClient(Dio()));
  void _handleEmailvalidation() {
    Tuple _EmailValidation =
        validateEmail(_emailController.text, languageProvider);
    _emailErrorText = _EmailValidation.error;
    setState(() {});
  }

  Future<void> _handleEmailLogin(LoginRequest request,
      AuthProvider authProvider, LanguageProvider languageProvider) async {
    try {
      setState(() {
        _isAuthenticating = true;
      });

      final res = await authApi.login(request);

      if (res.user != null) {
        setState(() {
          _isAuthenticating = false;
        });
        authProvider.login(
            res.user, res.tokens?.access, res.tokens?.refresh, LoginType.email);
        Future.delayed(const Duration(seconds: 0), () {
          Navigator.pushNamed(context, Routes.main);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(languageProvider.language.loginSuccess),
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

  Future<void> _handleFacebookLogin(AuthProvider authProvider) async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        try {
          setState(() {
            _isAuthenticating = true;
          });
          final res = await authApi.loginByFacebook(
              FacebookLoginRequest(access_token: result.accessToken!.token));
          if (res.user != null) {
            authProvider.login(res.user, res.tokens?.access,
                res.tokens?.refresh, LoginType.facebook);
            Future.delayed(const Duration(seconds: 0), () {
              Navigator.pushNamed(context, Routes.main);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(languageProvider.language.loginSuccess),
                    ),
                  ],
                ),
                duration: Duration(seconds: 1),
              ),
            );
          }
          setState(() {
            _isAuthenticating = false;
          });
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
    } catch (error) {
      print(error);
      print(error);
      print(error);
    }
  }

  Future<void> _handleGoolgeLogin(AuthProvider authProvider) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final String? accessToken = googleAuth?.accessToken;
    if (accessToken != null) {
      try {
        setState(() {
          _isAuthenticating = true;
        });
        final res = await authApi
            .loginByGoogle(GoogleLoginRequest(access_token: accessToken));
        if (res.user != null) {
          authProvider.login(res.user, res.tokens?.access, res.tokens?.refresh,
              LoginType.google);
          Future.delayed(const Duration(seconds: 0), () {
            Navigator.pushNamed(context, Routes.main);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(languageProvider.language.loginSuccess),
                  ),
                ],
              ),
              duration: Duration(seconds: 1),
            ),
          );
        }
        setState(() {
          _isAuthenticating = false;
        });
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
  }

  @override
  Widget build(BuildContext context) {
    authProvider = context.watch<AuthProvider>();
    languageProvider = context.watch<LanguageProvider>();
    chosenLanguage = languageProvider.language.id;
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
                    languageProvider.language.password,
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
                        await _handleEmailLogin(
                            request, authProvider, languageProvider);
                      }
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                        backgroundColor: Colors.blue),
                    child: Text(
                      languageProvider.language.login,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgotPassword);
                    },
                    child: Text(
                      languageProvider.language.forgotPassword,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    languageProvider.language.loginWith,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              _handleFacebookLogin(authProvider);
                            },
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
                            onPressed: () {
                              _handleGoolgeLogin(authProvider);
                            },
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
                        languageProvider.language.registerQuestion,
                        style: const TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(
                          languageProvider.language.register,
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
