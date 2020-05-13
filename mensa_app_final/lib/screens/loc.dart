import 'package:flutter/material.dart';
import 'package:mensa_app_final/style.dart';
import 'homepage/text_section.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // falls mehrere Markierungen im Array
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        print('Marker Tapped');
      },
      // Mensa
      position: LatLng(50.565443, 9.687014),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unser Standort',
          style: AppBarTextStyle,
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TextSection("Hier kannst Du uns finden!",
                "1. Drücke auf die rote Markierung auf der Karte. \n2. Rechts unten auf der Karte erscheinen Aktionen, die Du durchführen kannst. \n3. Drücke auf den weißen Richtungspfeil mit dem blauen Hintergrund, um ganz einfach zu uns zu gelangen. \n\n!! Achtung Du wechselst automatisch zur Google Maps App !!"),
            Container(
              padding: EdgeInsets.all(15.0),
              height: 450.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(50.565443, 9.687014),
                  zoom: 16.0,
                ),
                markers: Set.from(allMarkers),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
