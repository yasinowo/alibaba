import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

const expandedCategoriesHeight = 160.0;
const collapsedCategoriesHeight = 50.0;
const spaceBelowCategories = 20.0;
final List<Map<String, dynamic>> navigationItems = [
  {'text': 'قطار', 'icon': 'assets/icons/train.png'},
  {'text': 'پرواز', 'icon': 'assets/icons/airplane.png'},
  {'text': 'هتل', 'icon': 'assets/icons/hotel.png'},
  {'text': 'اتوبوس', 'icon': 'assets/icons/bus.png'},
  {'text': 'ویلا و اقامتگاه', 'icon': 'assets/icons/vila.png'},
  {'text': 'تور', 'icon': 'assets/icons/tor.png'},
];

class _ExpandedCategories extends StatelessWidget {
  const _ExpandedCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: expandedCategoriesHeight + 10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics:
            const NeverScrollableScrollPhysics(), // برای غیرفعال کردن اسکرول داخلی GridView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // تعداد ستون‌ها
          childAspectRatio: 3 / 1, // نسبت عرض به ارتفاع هر آیتم
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemCount: navigationItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = navigationItems[index];
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(0.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(item['text'], style: MyFonts.titleSmall),
                  SizedBox(width: 5),
                  Image.asset(item['icon'], width: 30, height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CollapsedCategories extends StatelessWidget {
  const _CollapsedCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // تنظیم ارتفاع مناسب برای ردیف افقی
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.12),
          width: 1,
        ),
      ),
      child: GridView.builder(
        scrollDirection: Axis.horizontal, // تغییر جهت اسکرول به افقی
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        itemCount: navigationItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = navigationItems[index];
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                item['icon'],
                width: 30,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Appbar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const Appbar({required this.expandedHeight});

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 100;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double progress = shrinkOffset / expandedHeight;
    final bool showExpandedCategories =
        progress <
        0.35; // Adjust this value to control when to show expanded categories
    final bool showExpandedLogo =
        progress <
        0.30; // Adjust this value to control when to show expanded categories

    return ColoredBox(
      color: Color(0xffFDB713),
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: expandedCategoriesHeight / 2 + spaceBelowCategories,
                color: Colors.white,
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 0,
              height: 60,
              child: Container(
                color: Color(0xffFDB713),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/icons/alibaba_logo.png',
                    height: (showExpandedLogo) ? 50 : 37,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            if (!showExpandedCategories)
              Positioned(
                top: 40,
                left: 30,
                right: 30,
                child: Center(child: const _CollapsedCategories()),
              ),
            if (showExpandedCategories)
              Positioned(
                top: 30,
                left: 30,
                right: 30,
                bottom: spaceBelowCategories,
                child: Center(child: const _ExpandedCategories()),
              ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
