import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'choose_surat.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/Home' : (context) => HomePage(),
    '/Choose_surat' : (context) => ChooseSurat()
  },
  initialRoute: '/Home',
));
