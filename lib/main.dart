import 'package:alibaba/screen/home_page.dart';
import 'package:alibaba/screen/mytravle_page.dart';
import 'package:alibaba/screen/notifications_page.dart';
import 'package:alibaba/screen/plus_page.dart';
import 'package:alibaba/screen/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPage(),
    );
  }
}
