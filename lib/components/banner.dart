import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  final List<String> assetImagePaths;

  const BannerSlider({super.key, required this.assetImagePaths});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // برای اسکرول خودکار حلقوی (اختیاری)
    // Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (_pageController.page != null &&
    //       _pageController.page!.round() == widget.assetImagePaths.length - 1) {
    //     _pageController.jumpToPage(0);
    //   } else {
    //     _pageController.nextPage(
    //       duration: Duration(milliseconds: 500),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: null,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage =
                          page %
                          widget.assetImagePaths.length; // برای اندیکاتورها
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final int realIndex = index % widget.assetImagePaths.length;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.assetImagePaths[realIndex],
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: 200,
                      ),
                    );
                  },
                ),
              ),
              if (widget.assetImagePaths.length > 1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        widget.assetImagePaths.map((path) {
                          int index = widget.assetImagePaths.indexOf(path);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  _currentPage == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                            ),
                          );
                        }).toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
