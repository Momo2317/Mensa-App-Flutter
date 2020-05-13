import 'package:flutter/material.dart';
import 'package:mensa_app_final/style.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class Essensplan extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Speiseplan',
          style: AppBarTextStyle,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: WebView(
        initialUrl:
            "https://www.mensaplan.de/fulda/mensa-hochschule-fulda/index.html",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
