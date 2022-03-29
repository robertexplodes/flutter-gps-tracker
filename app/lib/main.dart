import 'package:flutter/material.dart';
import 'package:gpstracking/widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _pageIndex = 1;

  var pages = [
    Center(child: Text('Page home')),
    Center(child: Text('Page add')),
    Center(child: Text('Page settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes().darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GPS Tracking'),
        ),
        body: pages[_pageIndex],
        floatingActionButton: CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xff14213D),
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
                icon: Icon(Icons.home,color: Colors.white,),
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
