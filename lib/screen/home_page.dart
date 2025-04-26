import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              backgroundColor: Colors.yellow,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // چک می‌کنیم که اپ‌بار کوچیک شده یا بزرگه
                  var top = constraints.biggest.height;
                  bool isCollapsed =
                      top <=
                      kToolbarHeight +
                          20; // اگه ارتفاع نزدیک اپ‌بار عادی شد یعنی اسکرول شده

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isCollapsed) ...[
                        // حالت بزرگ: ایکون + متن
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildIconWithText(Icons.train, "قطار"),
                            buildIconWithText(Icons.flight, "پرواز"),
                            buildIconWithText(Icons.hotel, "هتل"),
                            buildIconWithText(Icons.directions_bus, "اتوبوس"),
                            buildIconWithText(Icons.tour, "تور"),
                            buildIconWithText(Icons.home, "ویلا و اقامتگاه"),
                          ],
                        ),
                      ] else ...[
                        // حالت کوچک: فقط ایکون
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.train),
                            Icon(Icons.flight),
                            Icon(Icons.hotel),
                            Icon(Icons.directions_bus),
                            Icon(Icons.tour),
                            Icon(Icons.home),
                          ],
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // ادامه‌ی بدنه صفحه (بقیه آیتم‌ها و محتواها)
              ]),
            ),
          ],
        ),

        // تابع کمکی برای آیکون + متن
      ),
    );
  }

  Widget buildIconWithText(IconData icon, String text) {
    return Column(children: [Icon(icon), SizedBox(height: 4), Text(text)]);
  }
}
