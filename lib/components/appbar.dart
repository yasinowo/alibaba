import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xffFDB713),
      elevation: 0,
      pinned: true,
      expandedHeight: 190,
      collapsedHeight: kToolbarHeight + 8,

      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(_bottomContainerHeight),
      //   child: Container(
      //     width: 200,
      //     height: _bottomContainerHeight,
      //     color: Colors.black,
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[],
      //       ),
      //     ),
      //   ),
      // ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        centerTitle: true,
        titlePadding: EdgeInsetsDirectional.only(
          // start: 20.0,
          // end: 20.0,
          // top: 12.0,
          // bottom: 12.0,
        ),
        title: SizedBox(
          height: 200,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 5),
                // Text('alibaba'),
                // Stack(
                //   alignment: Alignment.bottomCenter,
                //   children: [
                //     Container(
                //       width: double.infinity,
                //       height: 50,
                //       color: Colors.white,
                //     ),
                //     Container(
                //       width: double.infinity,
                //       height: 50,
                //       color: Colors.red,
                //       // Color(0xffFDB713),
                //     ),
                //     Container(
                //       color: Colors.black,
                //       width: 300,
                //       height: 50,
                //     ),
                //   ],
                // ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     CircleAvatar(radius: 16),
                //     Row(
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white10,
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(12),
                //             ),
                //           ),
                //           padding: EdgeInsets.all(8.0),
                //           child: Icon(Icons.person),
                //         ),
                //         SizedBox(width: 8),
                //         Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white10,
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(12),
                //             ),
                //           ),
                //           padding: EdgeInsets.all(8.0),
                //           child: Icon(Icons.menu),
                //         ),
                //         SizedBox(width: 8),
                //         Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white10,
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(12),
                //             ),
                //           ),
                //           padding: EdgeInsets.all(8.0),
                //           child: Icon(Icons.message),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        background: SafeArea(
          child: SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.red,
                  // Color(0xffFDB713),
                ),
                Container(color: Colors.black, width: 300, height: 100),

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         // iconContent(),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
