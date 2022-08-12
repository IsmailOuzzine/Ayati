import 'package:ayati/choose_mushaf.dart';
import 'package:ayati/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'choose_surat.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/' : (context) => Loading(),
    '/Home' : (context) => HomePage(),
    '/Choose_surat' : (context) => ChooseSurat(),
    '/ChooseMushaf' : (context) => ChooseMushaf()
  },
  // initialRoute: '/Home',
  initialRoute: '/',
));
