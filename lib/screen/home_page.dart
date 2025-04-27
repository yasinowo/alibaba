import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            expandedHeight: 190,
            collapsedHeight: kToolbarHeight + 8,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              centerTitle: true,
              titlePadding: EdgeInsetsDirectional.only(
                start: 20.0,
                end: 20.0,
                top: 12.0,
                bottom: 12.0,
              ),
              title: SafeArea(
                child: Column(
                  children: [
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
              background: SafeArea(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 30,
                        bottom: 24,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 20),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 34,
                                      vertical: 12,
                                    ),
                                    child: Icon(Icons.menu),
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 34,
                                      vertical: 12,
                                    ),
                                    child: Icon(Icons.person),
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 34,
                                      vertical: 12,
                                    ),
                                    child: Icon(Icons.message),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(child: Text('$index', textScaleFactor: 5)),
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }

  Widget buildIconWithText(IconData icon, String text) {
    return Column(children: [Icon(icon), SizedBox(height: 4), Text(text)]);
  }
}
