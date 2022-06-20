import 'dart:io';

import 'package:flutter/material.dart';

import 'btn_home.dart';
import 'btn_user.dart';
import 'favorite_screen.dart';

var deffaultIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          // Icon(Icons.home)
        ],
        title: const Text(''),
      ),
      body: getSelectedIndex(deffaultIndex),
      //Bottom NavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'User'),
        ],
        currentIndex: deffaultIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            deffaultIndex = index;
          });
        },
      ),
      drawer: buildDrawer(),
    );
  }

  Widget buildDrawer() {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(children: [
        DrawerHeader(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(
                Icons.account_balance,
                size: 50,
              ),
              radius: 50,
            ),
            const SizedBox(height: 15),
            const Text(
              'Vorn Rathank',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ],
        )),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            setState(() {
              deffaultIndex = 0;
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Favorite'),
          onTap: () {
            setState(() {
              deffaultIndex = 1;
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Setting'),
          onTap: () {
            setState(() {
              deffaultIndex = 2;
              Navigator.pop(context);
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Exit'),
          onTap: () {
            showExitDialog();
          },
        )
      ]),
    ));
  }

  Widget getSelectedIndex(int deffaultIndex) {
    switch (deffaultIndex) {
      case 0:
        return const BtnHomeScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const BtnUserScreen();
      default:
        return const Text("Other");
    }
  }

  showExitDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Colors.yellow[700],
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Warning'),
              ],
            ),
            content: const Text('Do you want to Exit?'),
            actions: [
              TextButton(onPressed: () => exit(0), child: const Text('Yes')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('No')),
            ],
          );
        });
  }
}
