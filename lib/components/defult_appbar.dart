import 'package:flutter/material.dart';

PreferredSizeWidget defultAppbar() {
  return PreferredSize(
    preferredSize: Size(double.infinity, 18),
    child: AppBar(backgroundColor: Color(0xffFDB713), toolbarHeight: 20),
  );
}
