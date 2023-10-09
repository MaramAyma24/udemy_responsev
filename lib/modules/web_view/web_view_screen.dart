import 'package:flutter/material.dart';
import 'package:news/shared/components/components.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebViewScreen extends StatelessWidget {

  final String url;
  // the type (string)

  WebViewScreen(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

}