import 'package:flutter/material.dart';

class testpage extends StatefulWidget {
  @override
  _testpageState createState() => _testpageState();
}

class _testpageState extends State<testpage> {
  ScrollController _scrollController = ScrollController();
  double _expandedHeight = 150.0; // ارتفاع اولیه اپ بار
  double _collapsedHeight = 60.0; // ارتفاع اپ بار پس از اسکرول
  double _bottomContainerHeight = 80.0; // ارتفاع کانتینر میانی

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  double get _scrollProgress =>
      _scrollController.hasClients && _expandedHeight > _collapsedHeight
          ? (_scrollController.offset / (_expandedHeight - _collapsedHeight))
              .clamp(0.0, 1.0)
          : 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: _expandedHeight,
            collapsedHeight: _collapsedHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.yellow[400],
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  bottom: _bottomContainerHeight / 2,
                ), // تنظیم موقعیت پایین المان
                child: Text(
                  'Alibaba',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(_bottomContainerHeight),
              child: Container(
                height: _bottomContainerHeight,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildAppBarItem('✈️', 'پرواز'),
                      _buildAppBarItem('🚂', 'قطار'),
                      _buildAppBarItem('🚌', 'اتوبوس'),
                      _buildAppBarItem('🏨', 'هتل'),
                      _buildAppBarItem('🏡', 'ویلا'),
                      _buildAppBarItem('🗺️', 'تور'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // فضای خالی برای محتوای پایین
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              Text('data'),
              // SizedBox(height: 300),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
          BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'پرواز'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'اعلان',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'حساب',
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarItem(String icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(icon, style: TextStyle(fontSize: 20)),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
