import 'package:flutter/material.dart';

import 'dot_nav_item.dart';

class DotNav extends StatelessWidget {
  final int total;
  final int selectedIndex;
  const DotNav({Key? key,required this.total,required this.selectedIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(total, (index) => DotNavItem(selected: index==selectedIndex)),
      ),
    );
  }
}
