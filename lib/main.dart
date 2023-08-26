import 'dart:io';

import 'package:flutter/material.dart';
import 'package:art/login_screen.dart';

import 'package:dio/dio.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(){
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void getHttp() async {
  Dio dio = new Dio();
  Response response;
  response = await dio.get("https://192.168.1.67");
  print(response.data);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art',
      home: LoginScreen(), // Affiche le LoginScreen dès le lancement
    );
  }
}