import 'package:flutter/material.dart';
import 'package:mensa_app_final/models/controller.dart';
import 'package:mensa_app_final/models/feedback_form.dart';
import 'package:mensa_app_final/screens/homepage/text_section.dart';
import 'package:mensa_app_final/style.dart';

class Feedbackk extends StatefulWidget {
  @override
  _FeedbackkState createState() => _FeedbackkState();
}

class _FeedbackkState extends State<Feedbackk> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController feedbackController = TextEditingController();

  // die Funktion
  void _submitForm() {
    // Falls Validierung == true
    if (_formKey.currentState.validate()) {
      // Konstruktor FeedbackForm bekommt den Text
      FeedbackForm feedbackForm = FeedbackForm(feedbackController.text);
      // Meldung, ob eingereicht wurde oder nicht
      FormController formController = FormController((String response) {
        print(response);
        if (response == FormController.STATUS_SUCCESS) {
          _showSnackBar("Dein Feedback wurde eingereicht. Vielen Dank!");
        } else {
          _showSnackBar("Fehler!");
        }
      });
      _showSnackBar("Dein Feedback wird eingereicht... einen Moment bitte!");
      formController.submitForm(feedbackForm);
    }
  }

  // Meldung
  _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: AppBarTextStyle,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextSection("Dein Feedback ist uns wichtig!",
              "Liebe Studierende, lieber Studierender, auf dieser Seite kannst du das Essen bewerten und an uns einreichen. Wir freuen uns auf jedes Feedback!"),
          new Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    maxLength: 50,
                    controller: feedbackController,
                    decoration: InputDecoration(
                      labelText: "Dein Feedback",
                      labelStyle: BodyTextStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Textfeld darf nicht leer sein!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitForm();
                      feedbackController.clear();
                    },
                    child: Text(
                      "Einreichen",
                      style: BodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
