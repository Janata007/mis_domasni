import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lab3/login_page.dart';

import 'add_termin.dart';
import 'constants.dart';
import 'home_page.dart';
Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Термини на испити',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginScreen(),
    );
  }
}

