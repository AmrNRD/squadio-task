import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squadio/core/app.localization.dart';
import 'package:squadio/core/theme/app_colors.dart';

import '../snack_bar.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final TextStyle? customTextStyle;
  final Color? customTextColor;
  final BoxDecoration? customDecoration;
  final Widget? customChild;
  final double? width;
  final double height;
  final int status;
  final bool disable;
  final String? disableMessage;
  const AppButton(this.buttonText,{Key? key, this.onPressed, this.customDecoration,this.customTextStyle, this.customTextColor, this.customChild, this.width=343, this.height=50, this.status=0,this.disable=false,this.disableMessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: status==0?width:50,
        height: status==0?height:50,
        decoration: customDecoration??BoxDecoration(gradient: status==0&&!disable?AppColors.defaultGradient:null,borderRadius: BorderRadius.circular(50),color: disable||status==1?AppColors.grey:status==2?Colors.green:null),
        child:status==0?
          Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap:() async {
                // final bool canVibrate=(await Vibration.hasVibrator())??false;
                // if (canVibrate) {
                // Vibration.vibrate();
                // }
                if(onPressed!=null&&!disable) {
                  onPressed!();
                }else if(disable&&disableMessage!=null) {
                  showScaffoldSnackBar(
                    context: context,
                    message: disableMessage!,
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: customChild??Center(
                child: Text(
                    AppLocalizations.of(context)!.translate(buttonText,defaultText: buttonText),
                    style: customTextStyle??Theme.of(context).textTheme.button!.copyWith(color: customTextColor),
                ),
              )),
        ):status==1?
        const Center(child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor))):const Center(child:FaIcon(FontAwesomeIcons.check,color: AppColors.white)),
      ),
    );
  }
}
