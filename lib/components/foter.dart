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
    List<String> moreTags = [
      'بلیط چارتـر',
      'تور کیش',
      'تور استانبول',
      'بلیط قطار',
      'خرید بلیط هواپیما',
      'خارجی',
      'اطلاعات فرودگاهی',
      'شیوه‌نامه حقوق مسافر',
      'رزرو هتل',
      'هتل مشهد',
      'هتل کیش',
      'هتل درویشی مشهد',
    ];

    List<String> initialTags = [
      'بلیط اتوبوس',
      'بلیط تهران استانبول',
      'هتل شایگان کیش...',
    ];

    List<String> tagsToShow =
        _showMoreTags ? (initialTags + moreTags) : initialTags;

    return Wrap(
      spacing: 5.0,
      runSpacing: 3.0,
      alignment: WrapAlignment.center,
      children: [
        ...tagsToShow.asMap().entries.map((entry) {
          int index = entry.key;
          String tag = entry.value;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(tag),
              if (index < tagsToShow.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    '●',
                    style: TextStyle(fontSize: 8.0, color: Colors.grey),
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
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  _showMoreTags ? 'کمتر' : 'بیشتر',
                  style: TextStyle(color: Color(0xff0077DB)),
                ),
                Icon(
                  _showMoreTags
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                  color: Color(0xff0077DB),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneSupport() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('تلفن پشتیبانی:', style: MyFonts.displaySmall),
          SizedBox(height: 4),
          Text(
            '021-43900000',
            style: MyFonts.displaySmall.copyWith(
              fontFamily: 'Yk',
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('در شبکه های اجتماعی:', style: MyFonts.displaySmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/telegram.png',
              height: 40,
              width: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Image.asset(
              'assets/icons/youtube.png',
              height: 40,
              width: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            Image.asset('assets/icons/x.png', height: 30, width: 30),
            SizedBox(width: 15),
            Image.asset(
              'assets/icons/aparat.png',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            Image.asset(
              'assets/icons/insta.png',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 15),
            Image.asset(
              'assets/icons/linkdin.png',
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCopyright() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          SizedBox(height: 5),
          Image.asset(
            'assets/icons/alibaba_logo.png', // لوگو
            height: 35,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 8),
          Text(
            'کلیه حقوق محفوظ و متعلق به آژانس هواپیمایی و جهانگردی علی‌بابا می‌باشد.',
            textAlign: TextAlign.center,
            style: MyFonts.displaySmall.copyWith(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'نسخه 3.10.4.9',
            style: MyFonts.displaySmall.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
