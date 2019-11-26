// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './unit.dart';

void main() => realRunApp();


void realRunApp() async {
  bool success = await SpUtil.getInstance();
  runApp(MaterialApp(home: WebViewExample()));
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String titleName = '登录';
  @override
  Widget build(BuildContext context) {
    var url = 'https://screen.cw100.com/login';
    int storeId = SpUtil.preferences.getInt('storeId');
    if (storeId != 0){//赋值
      url = 'https://screen.cw100.com/?storeId=$storeId';
      titleName = SpUtil.preferences.getString('storeName');
    }
    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.transparent,
//          elevation: 0,
//          title:Text(titleName),
//          centerTitle:true,
//          actions: <Widget>[
//            NavigationControls(_controller.future),
//          ],
//        ),
        // We're using a Builder here so we have a context that is below the Scaffold
        // to allow calling Scaffold.of(context) so we can show a snackbar.
        body: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
            navigationDelegate: (NavigationRequest request) {

            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          );
        }),
        backgroundColor:Color.fromRGBO(28, 28, 28, 1)
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
//写入storeid
Future<void>_incrementStoreId(id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('storeId', id);
}
Future<void>_inStoreName(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('storeName', name);
}


class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            FlatButton(
              child: Text("登出",style:TextStyle(fontSize:18),),
              textColor:Color.fromRGBO(255,255,255, 1),
              color:Color.fromRGBO(28, 28, 28, 1),
              onPressed:(){
                _incrementStoreId(0);
                controller
                    ?.evaluateJavascript('loginOut()')
                    ?.then((result) {
                  // You can handle JS result here.
                });
              },
            ),
          ],
        );
      },
    );
  }
}



