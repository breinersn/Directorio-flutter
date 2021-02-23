import 'package:directorio/data/data-usuarios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVersion = 'Unknown';
  var dataUser = DatosUser.getData;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          appBar: AppBar(
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
          body: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            height: height * 0.875,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: dataUser.length,
                itemBuilder: (context, index) {
                  // print(dataUser);
                  // child: Container(
                  return Container(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        const EdgeInsets.only(left: 3, top: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            appIcon(),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            nameSymbol(
                                                '${dataUser[index]["nombre"]}',
                                                '${dataUser[index]["apellidos"]}',
                                                '${dataUser[index]["oficio"]}'),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 0),
                                          child: Row(
                                            children: <Widget>[
                                              icono('phone',
                                                  '${dataUser[index]["telefono"]}'),
                                              texto('telefono',
                                                  '${dataUser[index]["telefono"]}'),
                                              icono('whatsapp',
                                                  '${dataUser[index]["telefono"]}'),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              //Spacer(),
                                              icono('torre', ''),
                                              texto('torre',
                                                  '${dataUser[index]["torre"]}'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              //Spacer(),
                                              icono('apartamento', ''),
                                              texto('apartamento',
                                                  '${dataUser[index]["aparamento"]}'),
                                              // SizedBox(
                                              //   width: 5,
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  );
                  // );
                }),
          ),
        ),
      ),
    );
  }
}

Widget appIcon() {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 8),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.account_circle_rounded,
          color: Colors.amber[200],
          size: 40,
        )),
  );
}

Widget nameSymbol(String nombre, String apellidos, String oficio) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: nombre + ' ' + apellidos,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\n$oficio',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

icono(String icono, String numero) {
  switch (icono) {
    case 'phone':
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: IconButton(
            icon: Icon(
              Icons.phone,
              color: Colors.green[600],
              size: 18,
            ),
            onPressed: () {
              _callPhone(numero);
            },
          ),
        ),
      );
      break;

    case 'torre':
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Icon(
            Icons.apartment,
            color: Colors.grey[500],
            size: 18,
          ),
        ),
      );
      break;

    case 'apartamento':
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Icon(
            Icons.house,
            color: Colors.grey[500],
            size: 18,
          ),
        ),
      );
      break;

    case 'whatsapp':
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green[600],
                size: 18,
              ),
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage("+57 $numero",
                    "Hola, me e puesto en contacto contigo atravez de la app Directorio!");
              },
              // child: Text('Running on: $_platformVersion\n'),
            )),
      );
      break;
    default:
  }
}

texto(String item, String parametro) {
  switch (item) {
    case 'telefono':
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 0),
          child: TextButton(
            onPressed: () {
              _callPhone(parametro);
            },
            child: Text(parametro,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                )),
          ),
        ),
      );
      break;
    case 'torre':
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 0),
          child: Text(parametro,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
        ),
      );
      break;

    case 'apartamento':
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 0),
          child: Text(parametro,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
        ),
      );
      break;

    default:
  }
}

Future<void> _callPhone(String numero) async {
  var url = 'tel://$numero';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
