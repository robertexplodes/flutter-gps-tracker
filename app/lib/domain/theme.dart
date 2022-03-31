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
    scaffoldBackgroundColor: const Color(0xff2D3142),
    cardColor: const Color(0xffe79514),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xffE5E5E5),
      ),
      bodyText2: TextStyle(
        color: Color(0xffE5E5E5),
      ),
      headline4: TextStyle(
        color: Color(0xffE5E5E5),
      ),
      headline6: TextStyle(
        color: Color(0xffE5E5E5),
      ),
      headline1: TextStyle(
        color: Color(0xffE5E5E5),
      ),
    ),
  );

  ThemeData get lightTheme => ThemeData(
    primarySwatch: const MaterialColor(0xff8ECAE6, {
      50:Color.fromRGBO(142, 202, 230, .1),
      100:Color.fromRGBO(142, 202, 230, .2),
      200:Color.fromRGBO(142, 202, 230, .3),
      300:Color.fromRGBO(142, 202, 230, .4),
      400:Color.fromRGBO(142, 202, 230, .5),
      500:Color.fromRGBO(142, 202, 230, .6),
      600:Color.fromRGBO(142, 202, 230, .7),
      700:Color.fromRGBO(142, 202, 230, .8),
      800:Color.fromRGBO(142, 202, 230, .9),
      900:Color.fromRGBO(142, 202, 230, 1),
    }),
    bottomAppBarColor: const Color(0xff219EBC),
    backgroundColor: const Color(0xff219EBC),
    scaffoldBackgroundColor: const Color(0xffE5E5E5),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Color(0xffE5E5E5),
      ),
      bodyText2: TextStyle(
        color: Color(0xff000000),
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xffE5E5E5),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    )
  );
}
