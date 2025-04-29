import 'package:flutter/material.dart';

const expandedCategoriesHeight = 160.0;
const collapsedCategoriesHeight = 50.0;
const spaceBelowCategories = 20.0;

class _ExpandedCategories extends StatelessWidget {
  const _ExpandedCategories();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, height: expandedCategoriesHeight);
  }
}

class _CollapsedCategories extends StatelessWidget {
  const _CollapsedCategories();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, height: collapsedCategoriesHeight);
  }
}

class Appbar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const Appbar({required this.expandedHeight});

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 180;

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
                  child: Text(
                    "Alibaba",
                    style: TextStyle(
                      fontSize: showExpandedCategories ? 20 : 14,
                    ),
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
