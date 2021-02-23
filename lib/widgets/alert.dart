import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

alertas(context, String tipo, String titulo, String desc) {
  switch (tipo) {
    case 'error':
      Alert(
        context: context,
        type: AlertType.error,
        title: titulo,
        desc: desc,
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      break;

    case 'warning':
      Alert(
        context: context,
        type: AlertType.warning,
        title: titulo,
        desc: desc,
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      break;
    case 'warning':
      Alert(
        context: context,
        type: AlertType.info,
        title: titulo,
        desc: desc,
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      break;
    default:
  }
}
