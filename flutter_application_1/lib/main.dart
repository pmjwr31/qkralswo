//ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'firebase_options.dart';
import 'package:kakao_flutter_sdk/user.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var defaultFirebaseOptions;
  // await Firebase.initializeApp(
  //   options: defaultFirebaseOptions.currentPlatform,
  // );
  KakaoContext.clientId = '71c004e121e337a95b8db8d73f8df969';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // late String _title = 'Please Login';
  // late Widget _screen;
  // late Login _login;
  // late Settings _settings;
  // late bool _authenticated;
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
