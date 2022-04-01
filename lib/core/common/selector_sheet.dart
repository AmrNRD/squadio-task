import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squadio/core/app.localization.dart';
import 'package:squadio/core/entities/selector_model.dart';
import 'package:squadio/core/theme/app_colors.dart';

class SelectorSheet extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? itemStyle;
  final List<SelectorItem> selectorItems;
  final Function(dynamic) onChange;
  final selectedValue;
  final double spaceBetween;

  const SelectorSheet({Key? key,required this.title,required this.onChange, this.selectorItems=const [],this.titleStyle,this.itemStyle,this.selectedValue,this.spaceBetween=20}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(
               AppLocalizations.of(context)!.translate(title,defaultText: title),
               style: titleStyle??Theme.of(context).textTheme.button!.copyWith(color: Theme.of(context).textTheme.headline3!.color),
             ),
              InkWell(
                onTap:()=>Navigator.of(context).pop(),
                child: const Icon(
                  FontAwesomeIcons.times,
                  color: AppColors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        ...selectorItems.map(
                (item) =>InkWell(
                  onTap:(){
                    Navigator.of(context).pop();
                    onChange(item.value);
                  },
                  child: Container(
                    color: selectedValue==item.value?AppColors.lightGrey:null,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: spaceBetween),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if(item.prefixIcon!=null)
                            Container(
                                margin:const EdgeInsets.symmetric(horizontal: 8),
                                child: SvgPicture.asset(item.prefixIcon!,height: 16,width: 16),
                            ),
                            Text(
                              AppLocalizations.of(context)!.translate(item.item,defaultText: item.item),
                              style: itemStyle??Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                        if(item.suffixIcon!=null)
                          SvgPicture.asset(item.suffixIcon!,height: 16,width: 16),
                      ],
                    ),
                  ),
                )
            ).toList(),
        SizedBox(height: 20),
      ],
    );
  }
}
