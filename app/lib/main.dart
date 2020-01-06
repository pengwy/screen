// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

void main() => runApp(
    MaterialApp(home: WebViewExample()));

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    //跳转屏幕
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // // 竖直方向
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // // 水平方向
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft]);
    // // 多方向
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeLeft, DeviceOrientation.portraitUp]);
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'https://screen.cw100.com/login',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          );
        }),
        backgroundColor:Color.fromRGBO(28, 28, 28, 1)
    );
  }
}



