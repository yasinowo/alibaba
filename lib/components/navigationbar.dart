import 'package:alibaba/screen/home_page.dart';
import 'package:alibaba/screen/mytravle_page.dart';
import 'package:alibaba/screen/notifications_page.dart';
import 'package:alibaba/screen/plus_page.dart';
import 'package:alibaba/screen/profile_page.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  final ValueChanged<int>? onTabChange; // کال‌بک برای اطلاع رسانی تغییر تب

  const MyNavigationBar({super.key, this.onTabChange});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;
  static final List<Widget> _pages = <Widget>[
    HomePage(),
    PlusPage(),
    MytravlePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (widget.onTabChange != null) {
      widget.onTabChange!(index); // فراخوانی کال‌بک با اندیس تب انتخاب شده
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        unselectedLabelStyle: MyFonts.displaySmall,
        selectedLabelStyle: MyFonts.displaySmall,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/un_home.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              'assets/icons/home.png',
              color: Colors.blue,
              width: 24,
              height: 24,
            ),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/plus.png',
              width: 30,
              height: 30,
              color: Colors.black,
            ),
            activeIcon: Image.asset(
              'assets/icons/plus.png',
              width: 30,
              height: 30,
              color: Colors.blue,
            ),
            label: 'پلاس',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bag.png', width: 24, height: 24),
            activeIcon: Image.asset(
              'assets/icons/bag.png',
              width: 24,
              height: 24,
              color: Colors.blue,
            ),
            label: 'سفرهای من',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/inbox.png', width: 24, height: 24),
            activeIcon: Image.asset(
              'assets/icons/inbox.png',
              width: 24,
              height: 24,
              color: Colors.blue,
            ),
            label: 'اعلان ها',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png', width: 24, height: 24),
            activeIcon: Image.asset(
              'assets/icons/user.png',
              width: 24,
              height: 24,
              color: Colors.blue,
            ),
            label: 'حساب کاربری',
          ),
        ],
      ),
    );
  }
}
