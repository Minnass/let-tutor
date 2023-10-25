import 'package:flutter/material.dart';
import 'package:lettutor/utils/validate_email.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String message = '';
  late bool isSuccess = false;
  @override
  Widget build(BuildContext context) {
    //   final appProvider = Provider.of<AppProvider>(context);
    // final lang = appProvider.language;
    TextEditingController _nameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _repasswordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                // lang.signUp,
                'Sign up',
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                // labelText: lang.email,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                // labelText: lang.password,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextField(
              obscureText: true,
              controller: _repasswordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                // labelText: lang.confirmPassword,
              ),
            ),
          ),
          // message != ''
          //     ? Container(
          //         margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          //         alignment: Alignment.centerLeft,
          //         child: Text(
          //           message,
          //           style:
          //               TextStyle(color: isSuccess ? Colors.green : Colors.red),
          //         ),
          //       )
          //     : Container(),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: Text('Sign up'),
              onPressed: () async {
                if (_nameController.text == '' ||
                    _passwordController.text == '' ||
                    _repasswordController.text == '') {
                  setState(() {
                    isSuccess = false;
                    message = 'Empty';
                  });
                } else if (!validateEmail(_nameController.text)) {
                  setState(() {
                    isSuccess = false;
                    message = 'Invalid Email';
                  });
                } else if (_passwordController.text.length < 6) {
                  setState(() {
                    isSuccess = false;
                    message = 'Short password';
                  });
                } else if (_repasswordController.text !=
                    _passwordController.text) {
                  setState(() {
                    isSuccess = false;
                    message = 'Passwords do not match';
                  });
                } else {
                  // var response = await AuthFunctions.register(
                  //     User(nameController.text, passwordController.text));
                  // setState(() {
                  //   isSuccess = response['isSuccess'] as bool;
                  //   message = isSuccess
                  //       ? lang.registerSuccess
                  //       : response['message'] as String;
                  // });
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            alignment: Alignment.center,
            child: Text('Continue with'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // handleSingInFacebook();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(
                          side: BorderSide(width: 1, color: Color(0xff007CFF))),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(5)),
                  child: Image.asset(
                    'assets/logo/google.png',
                    height: 40,
                    width: 40,
                  ),
                  //  SvgPicture.asset("asset/svg/ic_facebook.svg",
                  //     width: 30, height: 30, color: const Color(0xff007CFF))
                ),
                ElevatedButton(
                  onPressed: () {
                    // handleSignInGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(
                          side: BorderSide(width: 1, color: Color(0xff007CFF))),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(5)),
                  child: Image.asset(
                    'assets/logo/google.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login Question'),
              TextButton(
                child: Text(
                  // lang.signIn,
                  'Sign In',
                  style: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
