import 'package:alibaba/font/font.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final List<Map<String, dynamic>> moreOptions = [
    {'title': 'خرید خودکار', 'icon': 'assets/icons/calendar.png'},
    {'title': 'لیست مسافران', 'icon': 'assets/icons/people.png'},
    {'title': 'علاقه‌مندی‌ها', 'icon': 'assets/icons/star.png'},
    {'title': 'مرکز پشتیبانی', 'icon': 'assets/icons/question.png'},
    {'title': 'درخواست پشتیبانی', 'icon': 'assets/icons/support.png'},
    {'title': 'خروج از حساب کاربری', 'icon': 'assets/icons/exit.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10, width: double.infinity),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'حساب کاربری',
                  style: MyFonts.titleLarge.copyWith(letterSpacing: -0.8),
                ),
              ),
              SizedBox(height: 5),
              User(),
              SizedBox(height: 10),
              // موجودی حساب
              UserBalance(),
              SizedBox(height: 10),
              // حساب کاربری علی پلاس
              AlibabaPlus(),
              SizedBox(height: 10),
              _BuildContent(moreOptions: moreOptions),
              SizedBox(height: 15),
              Text('نسخه 3.154.2', style: MyFonts.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildContent extends StatelessWidget {
  const _BuildContent({required this.moreOptions});

  final List<Map<String, dynamic>> moreOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: moreOptions.length,
        itemBuilder: (context, index) {
          final item = moreOptions[index];
          return Column(
            children: [
              ListTile(
                leading: Image.asset(
                  item['icon'],
                  // 'assets/icons/star.png',
                  color: Colors.grey.shade600,
                  width: 20,
                  height: 20,
                ),
                title: Text(item['title'], style: MyFonts.bodySmall),
              ),
              if (index < moreOptions.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(height: 0.1, color: Colors.grey.shade300),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AlibabaPlus extends StatelessWidget {
  const AlibabaPlus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/plus.png',
            width: 30,
            height: 30,
            color: Colors.black,
          ),
          SizedBox(width: 8),
          Text('حساب کاربری علی‌پلاس', style: MyFonts.bodySmall),
        ],
      ),
    );
  }
}

class UserBalance extends StatelessWidget {
  const UserBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('موجودی حساب', style: MyFonts.titleSmall),
              Spacer(),
              Text(
                '0',
                style: MyFonts.titleMedium.copyWith(
                  color: Color.fromARGB(255, 184, 138, 30),
                ),
              ),
              Text(' تومان', style: MyFonts.bodyMedium),
            ],
          ),
          SizedBox(height: 8),
          Divider(),
          Row(
            children: [
              Icon(Icons.attach_money_outlined),
              SizedBox(width: 8),
              Text('موجودی و اعتبار من', style: MyFonts.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/user.png', width: 45, height: 45),
            SizedBox(width: 16),
            Text('09025559891', style: MyFonts.titleSmall),
            Spacer(),
            Text(
              'ویرایش اطلاعات',
              style: MyFonts.bodyMedium.copyWith(color: Colors.blue),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
