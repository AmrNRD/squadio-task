import 'package:flutter/material.dart';

class ColoredDot extends StatelessWidget {
  final Color? color;
  final String? text;
  final String? details;
  final double textSize;

  const ColoredDot({Key? key, this.color, this.text, this.details, this.textSize=18}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child:
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          if (text!=null) Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text!,
                style: Theme.of(context).textTheme.caption,
              ),
              if (details!=null)
                Text(
                  details!,
                  style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: textSize),
                ),
            ],
          ) else Container(),
        ],
      ),
    );
  }
}
