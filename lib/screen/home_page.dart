import 'package:alibaba/components/banner.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _bottomContainerHeight = 80.0; // ارتفاع کانتینر میانی
    var theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xffFDB713),
            elevation: 0,
            pinned: true,
            expandedHeight: 190,
            collapsedHeight: kToolbarHeight + 8,

            // bottom: PreferredSize(
            //   preferredSize: Size.fromHeight(_bottomContainerHeight),
            //   child: Container(
            //     width: 200,
            //     height: _bottomContainerHeight,
            //     color: Colors.black,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: <Widget>[],
            //       ),
            //     ),
            //   ),
            // ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              centerTitle: true,
              titlePadding: EdgeInsetsDirectional.only(
                // start: 20.0,
                // end: 20.0,
                // top: 12.0,
                // bottom: 12.0,
              ),
              title: SizedBox(
                height: 200,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 5),
                      // Text('alibaba'),
                      // Stack(
                      //   alignment: Alignment.bottomCenter,
                      //   children: [
                      //     Container(
                      //       width: double.infinity,
                      //       height: 50,
                      //       color: Colors.white,
                      //     ),
                      //     Container(
                      //       width: double.infinity,
                      //       height: 50,
                      //       color: Colors.red,
                      //       // Color(0xffFDB713),
                      //     ),
                      //     Container(
                      //       color: Colors.black,
                      //       width: 300,
                      //       height: 50,
                      //     ),
                      //   ],
                      // ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     CircleAvatar(radius: 16),
                      //     Row(
                      //       children: [
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white10,
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(12),
                      //             ),
                      //           ),
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Icon(Icons.person),
                      //         ),
                      //         SizedBox(width: 8),
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white10,
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(12),
                      //             ),
                      //           ),
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Icon(Icons.menu),
                      //         ),
                      //         SizedBox(width: 8),
                      //         Container(
                      //           decoration: BoxDecoration(
                      //             color: Colors.white10,
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(12),
                      //             ),
                      //           ),
                      //           padding: EdgeInsets.all(8.0),
                      //           child: Icon(Icons.message),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              background: SafeArea(
                child: SizedBox(
                  height: 300,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.red,
                        // Color(0xffFDB713),
                      ),
                      Container(color: Colors.black, width: 300, height: 100),

                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         // iconContent(),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((
          //     BuildContext context,
          //     int index,
          //   ) {
          //     return Container(
          //       color: index.isOdd ? Colors.white : Colors.black12,
          //       height: 100.0,
          //       child: Center(child: Text('$index', textScaleFactor: 5)),
          //     );
          //   }, childCount: 20),
          // ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'سایر حدمات علی بابا',
                textAlign: TextAlign.right,
                style: MyFonts.titleSmall,
              ),
            ),
          ),
          otherServicesContent(),
          SliverToBoxAdapter(child: SizedBox(height: 15)),
          BannerSlider(
            assetImagePaths: [
              'assets/images/banner1.png',
              'assets/images/banner2.png',
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'سفر را بخوانید و بشنوید',
                textAlign: TextAlign.right,
                style: MyFonts.titleMedium,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .end, // تراز کلی Column را به راست تغییر می‌دهیم
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween, // فضا بین تصویر و متن‌ها
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // تراز عمودی را از بالا شروع می‌کنیم
                              children: [
                                SizedBox(
                                  width:
                                      100, // عرض دلخواه برای تصویر (تغییر دهید)
                                  height:
                                      100, // ارتفاع دلخواه برای تصویر (تغییر دهید)
                                  child: Image.asset(
                                    'assets/images/image1.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Expanded(
                                  // برای اشغال فضای باقی مانده توسط متن‌ها
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .end, // تراز متن‌ها به راست
                                    children: [
                                      Text(
                                        'مجموعه کتاب سفر علی بابا',
                                        style: MyFonts.titleMedium,
                                        textAlign:
                                            TextAlign
                                                .right, // اطمینان از تراز متن به راست
                                      ),
                                      Text(
                                        softWrap: true,
                                        'جامع ترین راهنمای گردش و تفریح در شهرهای پرطرفدار به صورت رایگان',
                                        style: MyFonts.bodyMedium.copyWith(
                                          color: Colors.blueGrey,
                                        ),
                                        textAlign:
                                            TextAlign
                                                .right, // اطمینان از تراز متن به راست
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // می‌توانید ویجت‌های دیگری را در زیر Row (تصویر و متن‌ها) در Column قرار دهید
                          ],
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 150.0,
                        color: Colors.green,
                        margin: const EdgeInsets.all(8.0),
                        child: const Center(child: Text('کانتینر دوم')),
                      ),
                      // می‌توانید کانتینرهای بیشتری را در اینجا اضافه کنید
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding otherServicesContent() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/travl.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('تور گردشگری', style: MyFonts.displaySmall),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/viza.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('ویزای سفر', style: MyFonts.displaySmall),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/cart.svg',
                        semanticsLabel: 'Dart Logo',
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('سفر اقتصادی', style: MyFonts.displaySmall),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/travl.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('سفر کارت\n سازمانی', style: MyFonts.displaySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Row iconContent() {
  //   return Row(
  //     children: [
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white10,
  //           borderRadius: BorderRadius.all(Radius.circular(12)),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 34, vertical: 12),
  //         child: Icon(Icons.menu),
  //       ),
  //       SizedBox(width: 4),
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white10,
  //           borderRadius: BorderRadius.all(Radius.circular(12)),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 34, vertical: 12),
  //         child: Icon(Icons.person),
  //       ),
  //       SizedBox(width: 4),
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white10,
  //           borderRadius: BorderRadius.all(Radius.circular(12)),
  //         ),
  //         padding: EdgeInsets.symmetric(horizontal: 34, vertical: 12),
  //         child: Icon(Icons.message),
  //       ),
  //     ],
  //   );
  // }
}
