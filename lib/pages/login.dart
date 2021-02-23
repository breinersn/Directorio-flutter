import 'package:directorio/widgets/alert.dart';
import 'package:directorio/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double taImg = 0.6;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: <Widget>[
              logo(context, height, width, taImg),
              MyCustomForm(),
              //_form(context, height, width),
              _labels(context, height, width),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

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
                    color: Colors.blue[500],
                    shape: StadiumBorder(),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.

                        if (emailCtrl.text == 'prueba@gmail.com' &&
                            passCtrl.text == '1234567') {
                          Navigator.pushNamed(context, 'home');
                        } else {
                          alertas(context, 'error', 'Datos Incorrectos',
                              'Ingrese usuario y contraseña.');
                          // print(emailCtrl.text);
                          // print(passCtrl.text);

                          // Scaffold.of(context).showSnackBar(
                          //   SnackBar(
                          //     // elevation: 20,
                          //     content: Center(

                          //         child: Text('Datos ingresados no validos!')),
                          //   ),
                          // );
                        }

                        // Scaffold.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('Processing Data'),
                        //   ),
                        // );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      child: Center(
                        child: Text('Ingresar',
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

Widget _labels(BuildContext context, double height, double width) {
  return Container(
    margin: EdgeInsets.only(top: height * 0.001),
    child: Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {
            // Navigator.pushNamed(context, 'home');
          },
          child: Text(
            'Olvide mi contraseña',
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
        ),
        // SizedBox(height: height * 0.2),
        // Text(
        //   'Crear una cuenta',
        //   style: TextStyle(
        //       color: Colors.blueAccent,
        //       fontSize: 17,
        //       fontWeight: FontWeight.w300),
        // ),
        SizedBox(height: height * 0.1),
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            'Crear una cuenta!',
            style: TextStyle(
              color: Colors.blue[500],
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
