import 'package:directorio/pages/home.dart';
import 'package:directorio/pages/loading.dart';
import 'package:directorio/pages/login.dart';
import 'package:directorio/pages/register.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage()
};
