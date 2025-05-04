import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MyNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: MyFonts.displaySmall,
        unselectedLabelStyle: MyFonts.displaySmall,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/un_home.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              'assets/icons/home.png',
              width: 24,
              height: 24,
              color: Colors.blue,
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
