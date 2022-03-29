import 'package:flutter/material.dart';

class Themes {
  ThemeData get darkTheme => ThemeData(
    primarySwatch: const MaterialColor(0xff14213D, {
      50:Color.fromRGBO(20, 33, 61, .1),
      100:Color.fromRGBO(20, 33, 61, .2),
      200:Color.fromRGBO(20, 33, 61, .3),
      300:Color.fromRGBO(20, 33, 61, .4),
      400:Color.fromRGBO(20, 33, 61, .5),
      500:Color.fromRGBO(20, 33, 61, .6),
      600:Color.fromRGBO(20, 33, 61, .7),
      700:Color.fromRGBO(20, 33, 61, .8),
      800:Color.fromRGBO(20, 33, 61, .9),
      900:Color.fromRGBO(20, 33, 61, 1),
    }),
    bottomAppBarColor: const Color(0xff14213D),
    backgroundColor: const Color(0xff14213D),
    scaffoldBackgroundColor: const Color(0xff191528),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xffE5E5E5),
      ),
    ),
  );
}
