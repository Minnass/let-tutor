import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String chosenLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              'EMAIL',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[400]),
                hintText: 'abc@example.com',
                prefixIcon: Icon(
                  Icons.mail,
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'PASSWORD',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
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
              onPressed: () => {},
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
              onPressed: () {},
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
                    // Navigator.pushNamed(context, Routes.register);
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
