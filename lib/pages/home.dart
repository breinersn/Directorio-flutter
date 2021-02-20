import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
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
          height: 135,
          width: double.maxFinite,
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
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  appIcon(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  nameSymbol(),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 8),
                                child: Row(
                                  children: <Widget>[
                                    icono('phone'),
                                    texto('telefono', '300 7821086'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    //Spacer(),
                                    icono('torre'),
                                    texto('torre', '2'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    //Spacer(),
                                    icono('apartamento'),
                                    texto('apartamento', '201'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    icono('whatsapp'),
                                    // torreApartamentoIcon(),
                                    // torreApartamento(),
                                    // SizedBox(
                                    //   width: 5,
                                    // ),
                                    // SizedBox(
                                    //   width: 5,
                                    // )
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
          color: Colors.amber,
          size: 40,
        )),
  );
}

Widget nameSymbol() {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        text: 'Breiner suarez navarro',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
              text: '\nIngeniero de Sistemas',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

// Widget torreApartamento() {
//   return Align(
//     alignment: Alignment.topRight,
//     child: Padding(
//       padding: const EdgeInsets.only(left: 20.0),
//       child: Row(
//         children: <Widget>[
//           RichText(
//             textAlign: TextAlign.left,
//             text: TextSpan(
//               text: '\n\Torre: 2:',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//               ),
//               children: <TextSpan>[
//                 TextSpan(
//                     text: '\nApto 202',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontStyle: FontStyle.italic,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget icono(String ico) {
  switch (ico) {
    case 'phone':
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Icon(
            Icons.phone,
            color: Colors.grey[500],
            size: 18,
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
                ),
                onPressed: () {
                  // whatsAppOpen();
                })),
      );
      break;
    default:
  }
}

Widget texto(String a, String b) {
  switch (a) {
    case 'telefono':
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 0),
          child: Text(b,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              )),
        ),
      );
      break;
    case 'torre':
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 0),
          child: Text(b,
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
          child: Text(b,
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

// void whatsAppOpen() async {
//   await FlutterLaunch.launchWathsApp(phone: "3007821086", message: "Hello");
// }
