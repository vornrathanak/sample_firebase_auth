import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: Container(
        color: Colors.white,
        child: Image.asset('images/dog.jpg'),
      ),
    );
  }
}