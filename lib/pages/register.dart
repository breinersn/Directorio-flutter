import 'package:directorio/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double taImg = 0.4;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: <Widget>[
              logo(context, height, width, taImg),
              //_form(context, height, width),
              _Form(),
              _Labels(context, height, width)
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();

  final nombreCtrl = TextEditingController();
  final apellidosCtrl = TextEditingController();
  final idCtrl = TextEditingController();
  final telefonoCtrl = TextEditingController();
  final torreCtrl = TextEditingController();
  final apartamentoCtrl = TextEditingController();
  final profecionCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nombreCtrl,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Nombre',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 3) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: apellidosCtrl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Apellidos',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 6) {
                    return 'Ingrese sus apellidos';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: idCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Numero Identificación',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 6) {
                    return 'Ingrese sus Numero de identificación';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: telefonoCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Telefono',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 7) {
                    return 'Ingrese su numero de telefono';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: profecionCtrl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.work_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Oficio u profeción',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 4) {
                    return 'Ingrese su oficio u profeción';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: torreCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Torre',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Ingrese el numero de la torre en la que vive';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: apartamentoCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.house),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Apartamento',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 1) {
                    return 'Ingrese el numero de apartamento';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Email',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (val) =>
                    !isEmail(val) ? "Ingrese un email valido" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // border: InputBorder.none,
                  hintText: 'Password',
                  // icon: Icon(
                  //   Icons.mail_outline,
                  //   color: Colors.grey,
                  // ),
                ),
                validator: (String value) {
                  if (value.length < 6) {
                    return 'La cantraseña minima es de 6 caracteres';
                  }
                  return null;
                },
              ),
            ),
            // CustomInput(
            //   icon: Icons.lock,
            //   placeholder: 'Password',
            //   textControler: passCtrl,
            //   isPassword: true,
            // ),
            Container(
              padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: RaisedButton(
                    elevation: 2,
                    highlightElevation: 5,
                    color: Colors.green[700],
                    shape: StadiumBorder(),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.

                        print(emailCtrl.text);
                        print(passCtrl.text);

                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Procesando Datos...'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: Text('Registrar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget _form(BuildContext context, double height, double width) {
//   final nombresCtrl = TextEditingController();
//   final ccCtrl = TextEditingController();
//   final passCtrl = TextEditingController();

//   return Container(
//     margin: EdgeInsets.only(top: height * 0.02),
//     padding: EdgeInsets.symmetric(horizontal: width * 0.02),

//     child: Row(
//       children: <Widget>[
//         Expanded(
//           flex: 2,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.01),
//             child: CustomInput(
//               icon: Icons.person,
//               placeholder: 'Nombres',
//               textControler: nombresCtrl,
//               keyboardType: TextInputType.name,
//             ),
//             height: 60,
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.01),
//             child: CustomInput(
//               icon: Icons.person,
//               placeholder: 'CC',
//               textControler: ccCtrl,
//               keyboardType: TextInputType.number,
//             ),
//             height: 60,
//           ),
//         ),
//         //BotonApp()
//       ],
//     ),
//     // Column(child: ,)
//   );
// }

Widget _Labels(BuildContext context, double height, double width) {
  return Container(
    // margin: EdgeInsets.only(top: height * 0.001),
    child: Column(
      children: <Widget>[
        SizedBox(height: height * 0.0001),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Tengo una cuenta!',
            style: TextStyle(
              color: Colors.green[400],
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
