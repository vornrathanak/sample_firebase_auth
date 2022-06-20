import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page3')),
      body: Container(
        color: Colors.white,
        child: Image.asset('images/dog.jpg'),
      ),
    );
  }
}