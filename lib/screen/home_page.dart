import 'package:alibaba/components/banner.dart';
import 'package:alibaba/components/foter.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _bottomContainerHeight = 80.0; // ارتفاع کانتینر میانی
    var theme = Theme.of(context);
    List<Map<String, String>> travelList = [
      {
        'image': 'assets/images/image1.png',
        'title': 'مجموعه کتاب سفر علی بابا',
        'description':
            'جامع ترین راهنمای گردش و تفریح در شهرهای پرطرفدار به صورت رایگان',
      },
      {
        'image': 'assets/images/image1.png',
        'title': 'پادکست رادیو دور دنیا',
        'description': 'درباره هرچیزی که مربوط به سفر ، ماجراجویی و تفریح باشه',
      },
    ];
    List<Map<String, String>> magPost = [
      {
        'image': 'assets/images/mag1.png',
        'title': 'جاهای دیدنی ارمنستان; تاریخ را ورق بزنید',
        // 'description':
        //     'جامع ترین راهنمای گردش و تفریح در شهرهای پرطرفدار به صورت رایگان',
      },
      {
        'image': 'assets/images/mag2.png',
        'title': 'بهترین جاهای دیدنی که نباید انهارا از دست داد',
        // 'description': 'درباره هرچیزی که مربوط به سفر ، ماجراجویی و تفریح باشه',
      },
    ];
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
          readTravleList(travelList),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'پست های مگ',
                textAlign: TextAlign.right,
                style: MyFonts.titleMedium,
              ),
            ),
          ),
          readTravleList(magPost),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          footerIcon(),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }

  SliverPadding footerIcon() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset('assets/icons/ticket.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رتبه یک سفر', style: MyFonts.titleSmall),
                      Text(
                        'معتبرترین عرضه کننده محصولات گردشگری در ایران',
                        style: MyFonts.displaySmall.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset('assets/icons/platform.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رتبه یک سفر', style: MyFonts.titleSmall),
                      Text(
                        'ارائه تمامی خدمات سفر(پرواز،قطار،اتوبوس،هتل و تور)',
                        style: MyFonts.displaySmall.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset('assets/icons/chat.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رتبه یک سفر', style: MyFonts.titleSmall),
                      Text(
                        'پشتیبانی و همراهی 24 ساعته در تمامی مراحل سفر',
                        style: MyFonts.displaySmall.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////////////////////////
  SliverToBoxAdapter readTravleList(List<Map<String, String>> travelData) {
    return SliverToBoxAdapter(
      child: SizedBox(
        // برای تعیین ارتفاع کلی لیست افقی
        height: 200, // ارتفاع مشابه کانتینرها
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: travelData.length,
              itemBuilder: (BuildContext context, int index) {
                final item = travelData[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                  ), // فاصله بین آیتم‌ها
                  child: Container(
                    width: 250,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.only(right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(item['image']!, fit: BoxFit.cover),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['title']!,
                              style: MyFonts.titleSmall,
                              textAlign: TextAlign.right,
                            ),
                            (item['description'] != null)
                                ? Text(
                                  softWrap: true,
                                  item['description']!,
                                  style: MyFonts.bodyMedium.copyWith(
                                    color: Colors.blueGrey,
                                  ),
                                  textAlign: TextAlign.right,
                                )
                                : Text(''),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
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
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey.withAlpha(50),
                  //     borderRadius: BorderRadius.all(Radius.circular(12)),
                  //   ),
                  //   width: 60.0,
                  //   height: 60.0,
                  //   child: Center(
                  //     child: SvgPicture.asset('assets/icons/cart.svg'),
                  //   ),
                  // ),
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
