import 'package:alibaba/components/defult_appbar.dart';
import 'package:alibaba/components/navigationbar.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class MytravlePage extends StatelessWidget {
  const MytravlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(),
      appBar: defultAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10, width: double.infinity),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'سفرهای من',
                style: MyFonts.titleLarge.copyWith(letterSpacing: -0.8),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "فیلترها",
                        style: MyFonts.bodyMedium.copyWith(
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.filter_list, color: Colors.blueGrey.shade700),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 140),
            Image.asset(
              'assets/icons/ticket2.PNG',
              height: 120,
              fit: BoxFit.fitHeight,
            ),
            Text(
              '!سفارشی ثبت نشده است',
              textAlign: TextAlign.right,
              style: MyFonts.titleSmall.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
