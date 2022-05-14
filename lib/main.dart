import 'package:flutter/material.dart';
import 'home.dart';
import 'choose_surat.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/Home' : (context) => HomePage(),
    '/Choose_surat' : (context) => ChooseSurat()
  },
  initialRoute: '/Home',
));
