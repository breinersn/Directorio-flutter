import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textControler;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    Key key,
    @required this.icon,
    @required this.placeholder,
    @required this.textControler,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    void validar() {
      switch (this.placeholder) {
        case 'Password':
          {
            validator:
            (val) => !isEmail(val) ? "Ingrese un email valido" : null;
          }
          break;
      }
    }

    return Container(
      padding: EdgeInsets.only(top: 3, left: 5, bottom: 3, right: 20),
      margin: EdgeInsets.only(bottom: height * 0.1),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                //offset: Offset(0, 0.5),
                blurRadius: 5),
          ]),
      child: TextFormField(
        controller: this.textControler,
        autocorrect: false,
        keyboardType: this.keyboardType,
        obscureText: this.isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(this.icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.placeholder,
        ),
        //validator: (val) => !isEmail(val) ? "Ingrese un email valido" : null,
      ),
    );
  }
}
