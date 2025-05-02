import 'package:alibaba/components/defult_appbar.dart';
import 'package:alibaba/components/navigationbar.dart';
import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> filters = [
    {'text': 'همه', 'icon': ''},
    {'text': 'تغییرات پرواز', 'icon': 'assets/icons/retry.png'},
    {'text': 'اطلاع‌رسانی', 'icon': 'assets/icons/information.png'},
    {'text': 'تخفیف‌ها', 'icon': 'assets/icons/discount.png'},
  ];

  List<String> allNotifications = [
    'پرواز شما در ساعت 10:00 تغییر کرده است.',
    'اطلاعیه مهم درباره وضعیت فرودگاه.',
    '20% تخفیف برای رزرو هتل‌های منتخب!',
    'یادآوری: پرواز شما فردا صبح است.',
    'تغییر در ترمینال پرواز شما.',
    'فرصت ویژه: تخفیف‌های لحظه آخری پروازها!',
  ];

  List<String> filteredNotifications = [];
  int selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredNotifications = allNotifications; // مقداردهی اولیه مهم
  }

  void _handleFilterSelected(int index) {
    setState(() {
      selectedFilterIndex = index;

      if (index == 0) {
        filteredNotifications = allNotifications;
      } else {
        String selectedFilter = filters[index]['text'];
        filteredNotifications =
            allNotifications.where((notification) {
              return notification.contains(
                selectedFilter.replaceAll('‌', ''),
              ); // اصلاح فاصله صفر‌عرض
            }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'اعلان ها',
                style: MyFonts.titleLarge.copyWith(letterSpacing: -0.8),
              ),
            ),
            SizedBox(height: 15),
            NotificationFilter(
              filters: filters,
              onFilterSelected: _handleFilterSelected,
            ),
            SizedBox(height: 80),
            Image.asset(
              'assets/icons/bucket.PNG',
              // height: 150,
              width: 200,
              fit: BoxFit.fitWidth,
            ),
            Text(
              '!اعلانی یافت نشد',
              textAlign: TextAlign.right,
              style: MyFonts.titleSmall.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationFilter extends StatefulWidget {
  final List<Map<String, dynamic>> filters;
  final Function(int) onFilterSelected;

  const NotificationFilter({
    super.key,
    required this.filters,
    required this.onFilterSelected,
  });

  @override
  State<NotificationFilter> createState() => _NotificationFilterState();
}

class _NotificationFilterState extends State<NotificationFilter> {
  int _selectedFilterIndex = 0;

  List<IconData> icons = [
    Icons.list_alt, // همه
    Icons.refresh, // تغییرات پرواز
    Icons.article_outlined, // اطلاع‌رسانی
    Icons
        .discount_outlined, // تخفیف‌ها (از پکیج Icons ممکنه نیاز به جایگزین داشته باشه)
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: List.generate(widget.filters.length, (index) {
            bool isSelected = _selectedFilterIndex == index;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedFilterIndex = index;
                    widget.onFilterSelected(index);
                  });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.white : null,
                  foregroundColor: isSelected ? Colors.blue : Colors.black,
                  side: BorderSide(
                    width: 1.5,
                    color: isSelected ? Colors.blue : Colors.grey.shade400,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  textStyle: MyFonts.displaySmall,
                ),
                icon:
                    (widget.filters[index]['icon'] != '')
                        ? Image.asset(
                          widget.filters[index]['icon'],
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          color: isSelected ? Colors.blue : Colors.black,
                        )
                        : null,
                label: Text(widget.filters[index]['text']),
              ),
            );
          }),
        ),
      ),
    );
  }
}
