import 'package:flutter/material.dart';
import 'package:bancointer/screens/dashboard.dart';

class AppColors {
  static MaterialColor orange = MaterialColor(0xFFF17809, {
    50:Color.fromRGBO(241,120,9, .1),
    100:Color.fromRGBO(241,120,9, .2),
    200:Color.fromRGBO(241,120,9, .3),
    300:Color.fromRGBO(241,120,9, .4),
    400:Color.fromRGBO(241,120,9, .5),
    500:Color.fromRGBO(241,120,9, .6),
    600:Color.fromRGBO(241,120,9, .7),
    700:Color.fromRGBO(241,120,9, .8),
    800:Color.fromRGBO(241,120,9, .9),
    900:Color.fromRGBO(241,120,9, 1),
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Inter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}