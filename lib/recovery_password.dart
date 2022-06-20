import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_service.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  FirebaaseAuthService auth=FirebaaseAuthService();
  var emailCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Recovery Password',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Provide email you've registered",
                  style: TextStyle(
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(height: 1, thickness: 1),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailCon,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    hintText: 'Email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue), //Add Function error here
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Already have account ?'),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        ' Log In',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () async{
                    String? result=await auth.resetPassword(emailCon.text);
                    print('result : $result');
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.recycling),
                  label: const Text('Request Reset'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.blue[400],
                    minimumSize: const Size.fromHeight(50),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }
}
