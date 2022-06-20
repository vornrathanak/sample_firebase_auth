import 'package:flutter/material.dart';

class BtnHomeScreen extends StatefulWidget {
  const BtnHomeScreen({Key? key}) : super(key: key);

  @override
  State<BtnHomeScreen> createState() => _BtnHomeScreenState();
}

class _BtnHomeScreenState extends State<BtnHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: ListView(
        children: [
          CardWidget('images/iphone1.png', 'Iphone 8 plus', 'info', 200),
          CardWidget('images/iphone2.png', 'Iphone 12 pro', 'info', 400),
          CardWidget('images/samsung.png', 'Samsung Galaxy Note', 'info', 700),
          CardWidget('images/iphone1.png', 'Iphone 8 plus', 'info', 200),
          CardWidget('images/iphone2.png', 'Iphone 12 pro', 'info', 400),
          CardWidget('images/samsung.png', 'Samsung Galaxy Note', 'info', 700),
          CardWidget('images/iphone1.png', 'Iphone 8 plus', 'info', 200),
          CardWidget('images/iphone2.png', 'Iphone 12 pro', 'info', 400),
          CardWidget('images/samsung.png', 'Samsung Galaxy Note', 'info', 700),
          CardWidget('images/iphone1.png', 'Iphone 8 plus', 'info', 200),
          CardWidget('images/iphone2.png', 'Iphone 12 pro', 'info', 400),
          CardWidget('images/samsung.png', 'Samsung Galaxy Note', 'info', 700),
        ],
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget CardWidget(String filePath, String model, String info, double price) {
    return Card(
        color: Colors.blue,
        child: ListTile(
          title: Text(model),
          leading: Image(
            image: AssetImage(filePath),
          ),
          trailing: Text('\$ ${price}'),
          subtitle: Text(info),
          onTap: () {
            setState(() {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text(model),
                      content: ListTile(
                        title: Image.asset(
                          '${filePath}',
                        ),
                        trailing: Text('\$ ${price}'),
                        subtitle: Text(info),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Favorite'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Ok'),
                        )
                      ],
                    );
                  });
            });
          },
        ));
  }
}
