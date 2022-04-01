import 'package:flutter/material.dart';
import 'package:squadio/core/theme/app_colors.dart';

class DotNavItem extends StatelessWidget {
  final bool selected;

  const DotNavItem({Key? key, this.selected=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsetsDirectional.only(start: 5),
      height: 6,
      width: selected ? 24 : 6,
      decoration: BoxDecoration(
          color: selected? Colors.white : Theme.of(context).hintColor,
          gradient: selected?AppColors.defaultGradient:null,
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }
}
