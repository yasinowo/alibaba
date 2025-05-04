import 'package:alibaba/font/font.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key, required bool isFabExpanded})
    : _isFabExpanded = isFabExpanded;

  final bool _isFabExpanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child:
          _isFabExpanded
              ? FloatingActionButton.extended(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                key: ValueKey('extended'),
                onPressed: () {},
                label: Text(
                  'اشتراک تجربه',
                  style: MyFonts.bodyMedium.copyWith(color: Colors.white),
                ),
                icon: Image.asset(
                  'assets/icons/comment.png',
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromARGB(255, 56, 165, 255),
              )
              // ignore: dead_code
              : FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                key: ValueKey('iconOnly'),
                onPressed: () {},
                backgroundColor: Colors.blue,
                child: Image.asset(
                  'assets/icons/comment.png',
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
    );
  }
}
