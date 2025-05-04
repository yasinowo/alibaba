import 'package:alibaba/components/footer.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class PlusPage extends StatefulWidget {
  const PlusPage({super.key});

  @override
  State<PlusPage> createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {
  final ScrollController controller = ScrollController();
  bool _isFabExpanded = true;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> kermanshah = [
      {
        'image': 'assets/images/kermanshah1.jpg',
        'title': 'بازار توپخانه',
        'description':
            'بازار بزرگ کرمان شاه هجده راسته دارد که بازار توپخانه یکی از راسته های اصلی این بازار...',
      },
      {
        'image': 'assets/images/kermanshah2.jpg',
        'title': 'بام کرمانشاه',
        'description':
            'بازار بزرگ کرمان شاه هجده راسته دارد که بازار توپخانه یکی از راسته های اصلی این بازار...',
      },
      {
        'image': 'assets/images/kermanshah_gh.jpg',
        'title': 'غار قوری قلعه',
        'description':
            'برای ماجراجویان هیچ چیزی نمیتواند مانند یک غار طولانی و پرپیچ و خم در میان کوه ...',
      },
    ];
    List<Map<String, String>> bandarabbas = [
      {
        'image': 'assets/images/bandarabbas1.jpg',
        'title': 'ساحل',
        'description':
            'بندرعباس، با سواحلی که گرمای جنوب و آبی خلیج فارس را به هم می‌آمیزند...',
      },
      {
        'image': 'assets/images/bandarabbas2.jpg',
        'title': 'ساحل',
        'description':
            'بندرعباس، با سواحلی که گرمای جنوب و آبی خلیج فارس را به هم می‌آمیزند...',
      },
      {
        'image': 'assets/images/bandarabbas_store.jpg',
        'title': 'بازار بزرگ بندرعباس',
        'description':
            'بازار بزرگ بندرعباس، نبض تپنده تجارت و فرهنگ این شهر ساحلی است. با قدم گذاشتن...',
      },
    ];
    List<Map<String, String>> yazd = [
      {
        'image': 'assets/images/yazd1.jpg',
        'title': 'امیر چقماق',
        'description':
            'معماری باشکوه و منحصربه‌فرد، یکی از شاخص‌ترین و زیباترین مجموعه‌های...',
      },
      {
        'image': 'assets/images/yazd2.jpg',
        'title': 'شهر خشت',
        'description':
            'شهر بادگیرها و خشت‌های کهن، گنجینه‌ای از معماری منحصربه‌فرد و اصیل ایرانی...',
      },
      {
        'image': 'assets/images/yazd3.jpg',
        'title': 'موزه',
        'description':
            'موزه آب یزد، که در خانه تاریخی کلاهدوزها قرار دارد، نگاهی جذاب به سیستم...',
      },
    ];
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(
        isFabExpanded: _isFabExpanded,
      ),

      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            final currentOffset = scrollNotification.metrics.pixels;
            if (currentOffset > lastOffset && _isFabExpanded) {
              // اسکرول به پایین

              setState(() => _isFabExpanded = false);
            } else if (currentOffset < lastOffset && !_isFabExpanded) {
              // اسکرول به بالا
              setState(() => _isFabExpanded = true);
            }
            lastOffset = currentOffset;
          }
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headerPlus(),
                SizedBox(height: 10),
                searchImage(),
                SizedBox(height: 20),
                MyHorizontalList(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'کرمانشاه;خاک زیرین، میهن فرهاد و شیرین',
                      style: MyFonts.titleMedium.copyWith(fontSize: 19),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ReadtravleList(travelData: kermanshah),
                SizedBox(height: 35),

                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'بندرعباس ، مروارید خلیج فارس',
                      style: MyFonts.titleMedium.copyWith(fontSize: 19),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                ReadtravleList(travelData: bandarabbas),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'یزد ، شهر قناعت',
                      style: MyFonts.titleMedium.copyWith(fontSize: 19),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                ReadtravleList(travelData: yazd),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'کرمانشاه;خاک زیرین، میهن فرهاد و شیرین',
                      style: MyFonts.titleMedium.copyWith(fontSize: 19),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ReadtravleList(travelData: kermanshah),
                SizedBox(height: 35),
                Divider(),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect searchImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/search.PNG',
        height: 380,
        fit: BoxFit.fill,
      ),
    );
  }

  headerPlus() {
    return SizedBox(
      height: 60,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 16,
            child: SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('alibaba', style: MyFonts.titleLarge),
                  SizedBox(width: 3),
                  Text(
                    'plus',
                    style: MyFonts.titleLarge.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            child: Text('جمع تجربه های سفر', style: MyFonts.bodyMedium),
          ),
          Positioned(
            top: 10,
            right: 90,
            child: Image.asset(
              'assets/icons/plus.png',
              width: 55,
              height: 55,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

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

readTravleList(List<Map<String, String>> travelData) {
  return SizedBox(
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
              padding: const EdgeInsets.only(left: 15.0), // فاصله بین آیتم‌ها
              child: Container(
                width: 250,
                height: 200,
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
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Text(
                                item['title']!,
                                style: MyFonts.titleSmall,
                                textAlign: TextAlign.right,
                              ),
                              Spacer(),
                              Image.asset(
                                'assets/icons/save.png',
                                width: 16,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        (item['description'] != null)
                            ? Text(
                              softWrap: true,
                              item['description']!,
                              style: MyFonts.bodySmall,
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
  );
}

class MyHorizontalList extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'text': 'اقامت و هتل', 'icon': 'assets/icons/home2.png'},
    {'text': 'بازار و خرید', 'icon': 'assets/icons/store.png'},
    {'text': 'جاذبه های گردشگری', 'icon': 'assets/icons/sunbed.png'},
    {'text': 'خورد و خوراک', 'icon': 'assets/icons/restaurant.png'},

    // می‌توانید آیتم‌های بیشتری اضافه کنید
  ];

  MyHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children:
              items.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // شکل کپسولی
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            item['icon'],
                            width: 26,
                            height: 26,
                            color:
                                (item['icon'] == 'assets/icons/home2.png' ||
                                        item['icon'] ==
                                            'assets/icons/store.png')
                                    ? Colors.blueGrey
                                    : null,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            item['text'],
                            style: MyFonts.bodyMedium.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
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
    return SizedBox(
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
                padding: const EdgeInsets.only(left: 15.0), // فاصله بین آیتم‌ها
                child: Container(
                  width: 250,
                  height: 200,
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
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: [
                                Text(
                                  item['title']!,
                                  style: MyFonts.titleSmall,
                                  textAlign: TextAlign.right,
                                ),
                                Spacer(),
                                Image.asset(
                                  'assets/icons/save.png',
                                  width: 16,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          (item['description'] != null)
                              ? Text(
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                item['description']!,
                                style: MyFonts.bodySmall,
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
    );
  }
}
