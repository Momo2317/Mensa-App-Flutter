import 'package:flutter/material.dart';
import 'package:mensa_app_final/screens/homepage/text_section.dart';
import 'package:mensa_app_final/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mensa Hochschule Fulda',
          style: AppBarTextStyle,
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextSection("Herzlich Willkommen",
                "Liebe Studierende, lieber Studierender, mit dieser App kannst Du dir den Speiseplan anschauen, die Mensa mithilfe der Google Maps Funktion finden und wenn Dir das Essen gut gefallen hat, ein Feedback da lassen. Viel Spaß mit der Mensa App!"),
            Container(
              height: 300.0,
              child: new Image.asset("assets/images/HSFulda.jpg",
                  fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
