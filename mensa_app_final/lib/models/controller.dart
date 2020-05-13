import 'package:mensa_app_final/models/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  // Callback
  final void Function(String) callback;

  // URL Anfrage
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzWVAZ2PgHH4xA-MM-HxjpjwfzlKEw1CMNM2dPFUlbnVj3f0Gg/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    // Übertragung der Parameter
    try {
      await http.get(URL + feedbackForm.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
