import 'package:alibaba/theme/font.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  bool _showMoreTags = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          _buildExpandableTile('علی بابا', [
            'درباره ما',
            'تماس با ما',
            'چرا علی بابا',
            'علی بابا پلاس',
          ]),
          _buildExpandableTile('خدمات مشتریان', [
            'مرکز پشتیبانی',
            'راهنمای خرید',
            'قوانین و مقررات',
          ]),
          _buildExpandableTile('اطلاعات تکمیلی', [
            'فروش سازمانی',
            'فرصت های شغلی',
            'رضایت سنجی',
          ]),
          SizedBox(height: 20),
          _buildTagsRow(),
          SizedBox(height: 20),
          _buildPhoneSupport(),
          SizedBox(height: 20),
          _buildSocialIcons(),
          SizedBox(height: 20),
          _buildCopyright(),
        ],
      ),
    );
  }

  Widget _buildExpandableTile(String title, List<String> children) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Text(title, style: MyFonts.bodyMedium),
        children:
            children
                .map(
                  (item) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Text(item, style: MyFonts.displaySmall),
                    onTap: () {},
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildTagsRow() {
    List<String> initialTags = [
      'بلیط چارتـر',
      'تور کیش',
      'تور استانبول',
      'بلیط قطار',
      'خرید بلیط هواپیما',
    ];

    List<String> moreTags = [
      'تور مشهد',
      'تور دبی',
      'بلیط اتوبوس',
      'رزرو هتل',
      'تور آنتالیا',
    ];

    List<String> tagsToShow =
        _showMoreTags ? (initialTags + moreTags) : initialTags;

    return Wrap(
      spacing: 5.0, // فاصله افقی بین Row ها (تگ + نقطه)
      runSpacing: 3.0, // فاصله عمودی بین ردیف ها
      alignment: WrapAlignment.center,
      children: [
        ...tagsToShow.asMap().entries.map((entry) {
          int index = entry.key;
          String tag = entry.value;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tag,
                style: MyFonts.tagSmall.copyWith(color: Colors.blueGrey),
              ),
              if (index <
                  tagsToShow.length - 1) // اضافه کردن نقطه اگر آخرین تگ نیست
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    '●', // یا هر علامت نقطه دلخواه
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey,
                    ), // استایل متفاوت برای نقطه
                  ),
                ),
            ],
          );
        }),
        GestureDetector(
          onTap: () {
            setState(() {
              _showMoreTags = !_showMoreTags;
            });
          },
          child: Text(
            _showMoreTags ? 'کمتر' : 'بیشتر',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneSupport() {
    return Column(
      children: [
        Text('تلفن پشتیبانی:', style: TextStyle(fontSize: 14)),
        SizedBox(height: 4),
        Text('021 - 43900000', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.camera_alt_outlined),
        SizedBox(width: 8),
        Icon(Icons.movie_outlined),
        SizedBox(width: 8),
        Icon(Icons.chat_bubble_outline),
        SizedBox(width: 8),
        Icon(Icons.send_outlined),
        SizedBox(width: 8),
        Icon(Icons.play_circle_outline),
      ],
    );
  }

  Widget _buildCopyright() {
    return Column(
      children: [
        SizedBox(height: 10),
        Image.asset(
          'assets/icons/alibaba_logo.png', // لوگو
          height: 30,
        ),
        SizedBox(height: 8),
        Text(
          'کلیه حقوق محفوظ و متعلق به آژانس هواپیمایی و جهانگردی علی‌بابا می‌باشد.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          'نسخه 3.10.4.9',
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
