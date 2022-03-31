import 'package:flutter/material.dart';
import 'package:gpstracking/pages/home_page.dart';
import 'package:gpstracking/pages/settings_page.dart';
import 'package:gpstracking/provider/run_provider.dart';
import 'package:gpstracking/provider/theme_provider.dart';
import 'package:gpstracking/domain/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(Themes().darkTheme),
        ),
        ChangeNotifierProvider(
          create: (_) => RunProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 1;

  var pages = [
    HomePage(),
    Center(child: Text('Page add')),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeProvider.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GPS Tracking'),
        ),
        body: pages[_pageIndex],
        floatingActionButton: CircleAvatar(
          radius: 25,
          backgroundColor: themeProvider.themeData.bottomAppBarColor,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _pageIndex = 0;
              });
            },
          ),
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _pageIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _pageIndex = 2;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
