import 'package:dro_hometest/app.dart';
import 'package:dro_hometest/core/global/screen_utils/screen_util_setup.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilSetup(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HomeTest App',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple, fontFamily: 'Proxima Nova'),
        home: const HomeTestApp(),
      ),
    );
  }
}
