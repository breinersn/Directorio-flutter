import 'package:flutter/material.dart';

class BotonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RaisedButton(
          elevation: 2,
          highlightElevation: 5,
          color: Colors.lightBlueAccent,
          shape: StadiumBorder(),
          onPressed: () {
            print('');
          },
          child: Container(
            width: double.infinity,
            height: 55,
            child: Center(
              child: Text('Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ),
      ),
    );
  }
}
