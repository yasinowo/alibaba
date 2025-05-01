import 'package:alibaba/components/defult_appbar.dart';
import 'package:alibaba/components/navigationbar.dart';
import 'package:alibaba/screen/home_page.dart';
import 'package:alibaba/screen/mytravle_page.dart';
import 'package:alibaba/screen/notifications_page.dart';
import 'package:alibaba/screen/plus_page.dart';
import 'package:alibaba/screen/profile_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    PlusPage(),
    const MytravlePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defultAppbar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
