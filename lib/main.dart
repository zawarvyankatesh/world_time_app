import 'package:flutter/material.dart';
import 'package:projectofdream/pages/home.dart';
import 'package:projectofdream/pages/loding.dart';
import 'package:projectofdream/pages/choose_location.dart';
import 'package:http/http.dart';

void main() {
  return runApp (MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}