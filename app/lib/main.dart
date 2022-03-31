import 'package:flutter/material.dart';
import 'package:gpstracking/pages/home_page.dart';
import 'package:gpstracking/pages/new_run_page.dart';
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
  var pageController = PageController(initialPage: 1);

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
        body: PageView(
          controller: pageController,
          children: [
            HomePage(),
            NewRunPage(),
            const SettingsPage(),
          ],
        ),
        floatingActionButton: CircleAvatar(
          radius: 25,
          backgroundColor: themeProvider.themeData.bottomAppBarColor,
          child: IconButton(
            icon: const Icon(
              Icons.directions_run,
              color: Colors.white,
            ),
            onPressed: () {
              pageController.jumpToPage(1);
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
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  pageController.jumpToPage(0);
                },
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  pageController.jumpToPage(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
