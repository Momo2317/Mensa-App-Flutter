import 'package:flutter/material.dart';
import 'package:mensa_app_final/screens/essensplan.dart';
import 'package:mensa_app_final/screens/feedback.dart';
import 'package:mensa_app_final/screens/homepage/homepage.dart';
import 'package:mensa_app_final/screens/loc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    Essensplan(),
    Feedbackk(),
    Location(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: tabs[_currentIndex],
        // Bottom Nav Bar
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 10, bottom: 15, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 10.0)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  backgroundColor: Colors.lightGreen,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood),
                  title: Text('Speiseplan'),
                  backgroundColor: Colors.lightBlue,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feedback),
                  title: Text('Feedback'),
                  backgroundColor: Colors.orange,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text('Standort'),
                  backgroundColor: Colors.purple,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
