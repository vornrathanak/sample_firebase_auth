import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Center(
          child: Column(
            children: [
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
              FavoriteBtnCard('images/iphone1.png', 'info', ' model', 200),
            ],
          ),
        )
      ],
    ));
  }

  Widget FavoriteBtnCard(
      String filePath, String info, String model, double price) {
    return Card(
      color: Colors.blue,
      child: ListTile(
        leading: Image.asset(filePath),
        title: Text(model),
        subtitle: Text(info),
        trailing: Text('\$ ${price}'),
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
                        'images/iphone1.png',
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
      ),
    );
  }
}
