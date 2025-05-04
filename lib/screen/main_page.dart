import 'package:alibaba/components/defult_appbar.dart';
import 'package:alibaba/components/navigationbar.dart';
import 'package:alibaba/screen/home_page.dart';
import 'package:alibaba/screen/mytravle_page.dart';
import 'package:alibaba/screen/notifications_page.dart';
import 'package:alibaba/screen/plus_page.dart';
import 'package:alibaba/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  bool _isNavBarVisible = true;

  final List<Widget> _pages = [
    const HomePage(),
    PlusPage(),
    const MytravlePage(),
    const NotificationsPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _handleScroll(ScrollNotification notification) {
    if (notification is UserScrollNotification) {
      final direction = notification.direction;
      if (direction == ScrollDirection.forward && !_isNavBarVisible) {
        setState(() => _isNavBarVisible = true);
      } else if (direction == ScrollDirection.reverse && _isNavBarVisible) {
        setState(() => _isNavBarVisible = false);
      }
    }
  }

  Widget _buildBody() {
    Widget currentPage = _pages[_currentIndex];

    // فقط برای Home و Plus
    if (_currentIndex == 0 || _currentIndex == 1) {
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _handleScroll(notification);
          return false;
        },
        child: currentPage,
      );
    }

    return currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defultAppbar(),
      body: _buildBody(),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isNavBarVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          // جلوگیری از overflow
          children: [
            MyNavigationBar(currentIndex: _currentIndex, onTap: _onTabTapped),
          ],
        ),
      ),
    );
  }
}
