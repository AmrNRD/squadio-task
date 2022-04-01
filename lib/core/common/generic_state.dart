
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:squadio/core/common/app_button.dart';
import 'package:squadio/core/theme/app_colors.dart';

import '../../env.dart';
import '../app.localization.dart';

class GenericState extends StatefulWidget {
  final Function()? onPress;
  final bool showButton;
  final String imagePath;
  final String title;
  final String body;
  final String buttonText;
  final TextStyle? titleStyle;
  final TextStyle? bodyStyle;
  final String? adBannerID;
  /// Used to size title and body, body wil always be -4 from the given fontSize
  final double? fontSize;
  final double? size;
  final double? margin;

  const GenericState({
    Key? key,
    this.onPress,
    this.showButton = false,
    required this.imagePath,
    required  this.title,
    required this.body,
    this.titleStyle,
    this.bodyStyle,
    this.buttonText="retry",
    this.size=88,
    this.margin=40,
    this.fontSize=18,
    this.adBannerID,
  }) : super(key: key);

  @override
  _GenericStateState createState() => _GenericStateState();
}

class _GenericStateState extends State<GenericState> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                widget.imagePath,
                width: widget.size,
                height: widget.size,
              ),
              SizedBox(height: widget.margin),
              Text(
                AppLocalizations.of(context)!.translate(widget.title, defaultText: widget.title),
                style: widget.titleStyle ?? Theme.of(context).textTheme.headline3!.copyWith(fontSize: widget.fontSize),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Container(
                margin: EdgeInsets.symmetric(horizontal: widget.fontSize!  - 4),
                child: Text(
                  AppLocalizations.of(context)!.translate(widget.body, defaultText: widget.body),
                  style: Theme.of(context).textTheme.caption!.copyWith(fontSize: widget.fontSize!=null?widget.fontSize!-4:14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          if(widget.showButton)
            Container(margin:const EdgeInsets.only(bottom: 20),child: AppButton(widget.buttonText,onPressed: widget.onPress)),
            const SizedBox(height: 10),

        ],
      ),
    );
  }
}