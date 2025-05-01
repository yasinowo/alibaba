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
  List<String> filters = ['همه', 'تغییرات پرواز', 'اطلاع‌رسانی', 'تخفیف‌ها'];
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
    filteredNotifications = allNotifications; // نمایش همه در ابتدا
  }

  void _handleFilterSelected(int index) {
    setState(() {
      selectedFilterIndex = index;
      if (index == 0) {
        filteredNotifications = allNotifications;
      } else {
        String selectedFilter = filters[index];
        filteredNotifications =
            allNotifications
                .where(
                  (notification) => notification.toLowerCase().contains(
                    selectedFilter.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

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
                'اعلان ها',
                style: MyFonts.titleLarge.copyWith(letterSpacing: -0.8),
              ),
            ),
            SizedBox(height: 15),
            NotificationFilter(
              filters: filters,
              onFilterSelected: _handleFilterSelected,
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

class NotificationFilter extends StatefulWidget {
  final List<String> filters;
  final Function(int)
  onFilterSelected; // تابعی برای اطلاع رسانی فیلتر انتخاب شده به والد

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children:
              widget.filters.asMap().entries.map((entry) {
                int index = entry.key;
                String filter = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FilterChip(
                    label: Text(filter),
                    selected: _selectedFilterIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedFilterIndex = index;
                          widget.onFilterSelected(
                            index,
                          ); // اطلاع رسانی فیلتر انتخاب شده
                        } else {
                          _selectedFilterIndex =
                              0; // پیش فرض به "همه" یا اولین فیلتر برگردانید
                          widget.onFilterSelected(0);
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.blue.shade300),
                    ),
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: Colors.blue.shade100,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

// نحوه استفاده در ویجت والد:
class MyParentWidget extends StatefulWidget {
  @override
  _MyParentWidgetState createState() => _MyParentWidgetState();
}

class _MyParentWidgetState extends State<MyParentWidget> {
  List<String> filters = ['همه', 'تغییرات پرواز', 'اطلاع‌رسانی', 'تخفیف‌ها'];
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
    filteredNotifications = allNotifications; // نمایش همه در ابتدا
  }

  void _handleFilterSelected(int index) {
    setState(() {
      selectedFilterIndex = index;
      if (index == 0) {
        filteredNotifications = allNotifications;
      } else {
        String selectedFilter = filters[index];
        filteredNotifications =
            allNotifications
                .where(
                  (notification) => notification.toLowerCase().contains(
                    selectedFilter.toLowerCase(),
                  ),
                )
                .toList();
      }
      print('فیلتر انتخاب شده: ${filters[index]}');
      // در اینجا می‌توانید لیست اعلانات را بر اساس فیلتر به روز رسانی کنید
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'اعلان‌ها',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        NotificationFilter(
          filters: filters,
          onFilterSelected: _handleFilterSelected,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredNotifications.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(filteredNotifications[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
