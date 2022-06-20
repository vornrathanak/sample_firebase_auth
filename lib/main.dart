import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/lib/Home.dart';
import 'package:flutter_firebase_auth/recovery_password.dart';
import 'package:flutter_firebase_auth/registerScreen.dart';
import 'HomePageScreen.dart';
import 'LoginScreen.dart';
import 'favorite_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/reg': (context) =>  RegisterScreen(),
        '/home': (context) => const HomePage(),
        '/fav': (context) => const FavoriteScreen(),
        '/recover': (context) => const RecoverPassword(),
      },
    );
  }
}
