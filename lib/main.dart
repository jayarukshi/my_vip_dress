import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color get color => Colors.black;

  @override
            //child: Image.asset('assets/logo.png')
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await widget.browser.open(
                  url: Uri.parse("https://vipdress.lk/app"),
                  options: ChromeSafariBrowserClassOptions(
                      android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false),
                      ios: IOSSafariOptions(barCollapsingEnabled: true)));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
            child: Text("continuously shop with vipdress.lk")),
        ),
      );
  }
}