import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Center(child: Text('صفحه خانه')),
    const Center(child: Text('صفحه پلاس')),
    const Center(child: Text('صفحه سفرهای من')),
    const Center(child: Text('صفحه اعلان ها')),
    const Center(child: Text('صفحه حساب کاربری')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
        type: BottomNavigationBarType.fixed, // برای نمایش تمام عنوان‌ها
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/un_home.png',
              width: 24, // تنظیم عرض دلخواه
              height: 24, // تنظیم ارتفاع دلخواه
            ),
            activeIcon: Image.asset(
              'assets/icons/home.png',
              color: Colors.blue, // مسیر عکس غیرفعال
              width: 24, // تنظیم عرض دلخواه
              height: 24, // تنظیم ارتفاع دلخواه
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
