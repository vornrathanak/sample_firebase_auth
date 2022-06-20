// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/registerScreen.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_service.dart';

import 'HomePageScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

const String username = 'admin';
const String password = '1234';

class _LoginScreenState extends State<LoginScreen> {
  FirebaaseAuthService authService = FirebaaseAuthService();
  final _txtEmailController = TextEditingController();
  final _txtPassController = TextEditingController();
  bool _validate = false;
  bool _validateEmail = false;
  @override
  void dispose() {
    _txtPassController.dispose();
    _txtEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(children: [
        SafeArea(
          child: Padding(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_balance,
                    size: 100,
                    color: Colors.blue[600],
                  ),
                  const Text(
                    'Phone Store',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Schyler',
                        color: Colors.blue,
                        letterSpacing: 2.0),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Welcome Back',
                      style: TextStyle(fontSize: 18, color: Colors.blue)),
                  const Divider(
                    height: 15,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _txtEmailController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        hintText: 'Input Username / Email',
                        labelText: (_validateEmail)
                            ? 'User/Email can not Empty'
                            : 'Username /Email',
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue), //Add Function error here
                        ),
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _txtPassController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      prefixIcon: const Icon(Icons.security),
                      hintText: 'Input Password',
                      labelText: (_validate)
                          ? 'Password field can not Empty'
                          : 'Password',
                      //errorText:(_validate) ? 'Password field is Empty' : '',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, '/recover'),
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String? result = await authService.signIn(
                          _txtEmailController.text, _txtPassController.text);
                      print('result : $result');
                      if (result != null && result.contains('@')) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        print('Error : $result');
                      }
                      // setState(() {
                      //   if (!(_txtPassController.text.isEmpty &&
                      //       _txtEmailController.text.isEmpty)) {
                      //     if ((_txtEmailController.text == username) &&
                      //         (_txtPassController.text == password)) {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const HomePage()));
                      //     } else if (_txtEmailController.text != username ||
                      //         _txtPassController.text != password) {
                      //       showDialog(
                      //           barrierDismissible: true,
                      //           context: context,
                      //           builder: (BuildContext context) {
                      //             return AlertDialog(
                      //               title: Row(children: [
                      //                 Icon(
                      //                   Icons.warning_rounded,
                      //                   color: Colors.yellow[700],
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 const Text('Warning'),
                      //               ]),
                      //               content: const Text(
                      //                   'Username or Password Might Incorrect Please Try again'),
                      //               actions: [
                      //                 TextButton(
                      //                     onPressed: () =>
                      //                         Navigator.pop(context),
                      //                     child: const Text('Ok')),
                      //               ],
                      //             );
                      //           });
                      //     }
                      //   } else {
                      //     if (_txtEmailController.text.isEmpty &&
                      //         _txtPassController.text.isEmpty) {
                      //       _validateEmail = true;
                      //       _validate = true;
                      //     } else if (_txtEmailController.text.isEmpty) {
                      //       _validateEmail = true;
                      //     } else if (_txtPassController.text.isEmpty) {
                      //       _validate = true;
                      //     }
                      //   }
                      // });
                    },
                    child: const Text(
                      '   Login   ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Colors.blue[400],
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Row(
                        children: [
                          const Text("Already have an account ?"),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: InkWell(
                              onTap: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen())),
                              },
                              child: const Text(
                                'Sign UP',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      )),
                  //const Image(image: AssetImage('images/Wave.gif')),
                ],
              ),
            ),
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          ),
        ),
      ]),
    );
  }
}
