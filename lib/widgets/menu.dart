import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 35,
              ),
              onPressed: () => print('Menu'),
            );
          },
        ),
        title: Center(child: Text('Directorio')),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search, size: 25),
            onPressed: () => print('Buscanr'),
          ),
        ],
      ),
    );
  }
}
