import 'package:flutter/material.dart';

class RowColoredDot extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? details;
  final double textSize;

  const RowColoredDot({Key? key, this.color, this.text, this.details, this.textSize=18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsetsDirectional.only(top: 10,end: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          if(text!=null)
          Expanded(
            child: Text(
              text!,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
