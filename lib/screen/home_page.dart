import 'package:alibaba/components/appbar.dart';
import 'package:alibaba/components/banner.dart';
import 'package:alibaba/components/footer.dart';
import 'package:alibaba/font/font.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> travelList = [
      {
        'image': 'assets/images/screen_app.png',
        'title': 'مجموعه کتاب سفر علی‌بابا',
        'description':
            'جامع ترین راهنمای گردش و تفریح در شهرهای پرطرفدار به صورت رایگان',
      },
      {
        'image': 'assets/images/screen_app.png',
        'title': 'پادکست رادیو دور دنیا',
        'description': 'درباره هرچیزی که مربوط به سفر ، ماجراجویی و تفریح باشه',
      },
    ];
    List<Map<String, String>> magPost = [
      {
        'image': 'assets/images/armanestan.jpg',
        'title': 'جاهای دیدنی ارمنستان; تاریخ را ورق بزنید',
        'description': '',
      },
      {
        'image': 'assets/images/dubai.jpg',
        'title': 'بهترین جاهای دیدنی که نباید انهارا از دست داد',
        // 'description': 'درباره هرچیزی که مربوط به سفر ، ماجراجویی و تفریح باشه',
      },
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: Appbar(expandedHeight: 300),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                'سایر خدمات علی‌بابا',
                textAlign: TextAlign.right,
                style: MyFonts.titleSmall,
              ),
            ),
          ),
          OtherServicesContent(),
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
          ReadtravleList(travelData: travelList),
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
          ReadtravleList(travelData: magPost),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          FooterIcon(),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}

class OtherServicesContent extends StatelessWidget {
  const OtherServicesContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(50),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        width: 60.0,
                        height: 60.0,
                        child: Image.asset('assets/icons/cart.png'),
                      ),
                      Positioned(
                        top: 0,
                        left: 3,
                        child: Image.asset(
                          'assets/icons/new.png',
                          width: 35,
                          height: 32,
                        ),
                      ),
                    ],
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
}

class FooterIcon extends StatelessWidget {
  const FooterIcon({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset('assets/icons/platform2.png'),
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
}

class ReadtravleList extends StatelessWidget {
  const ReadtravleList({super.key, required this.travelData});

  final List<Map<String, String>> travelData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (travelData[0]['description'] != null) ? 195 : 220,
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
                    padding: EdgeInsets.only(right: 5, top: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 240,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
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
}
