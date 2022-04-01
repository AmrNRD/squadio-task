import 'package:flutter/material.dart';
import 'package:squadio/core/theme/app_colors.dart';


class MettleAppBar extends StatelessWidget implements PreferredSizeWidget{
  final dynamic title;
  final double height;
  final double elevation;
  final bool canPop;
  final Widget? leadingButton;
  final Widget? lowerWidget;
  final List<Widget> actionButtons;
  final MainAxisAlignment mainAxisAlignment;
  final Function? backAction;

  const MettleAppBar({required this.title, this.height=80, this.elevation=0, this.canPop=true, this.leadingButton, this.actionButtons=const [], this.mainAxisAlignment=MainAxisAlignment.spaceBetween, this.backAction, this.lowerWidget}) ;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10.0, offset: const Offset(0.0, 4.0))
        ],
        color: Colors.white,
        border: Border.all(color: const Color(0xFFF2F2F2)),
      ),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (Navigator.of(context).canPop()&&canPop)
                  GestureDetector(onTap: ()=>backAction!=null?backAction!():Navigator.of(context).pop(), child: Container(margin: const EdgeInsetsDirectional.only(top: 10,start: 10,end: 10),color: Colors.transparent, child: const Icon(Icons.arrow_back_ios,color:AppColors.lightGrey,size: 20)))
                  else if (leadingButton!=null)
                    leadingButton!
                  else
                    Container(),
                  if (title is String) Text(title as String, style: Theme.of(context).textTheme.headline3,maxLines: 1) else title as Widget,
                  if (actionButtons.isNotEmpty)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actionButtons
                    )
                  else
                    Container(margin: const EdgeInsets.all(20))
                ],
              ),
              if(lowerWidget!=null)
                Container(margin: const EdgeInsetsDirectional.only(top: 12), child: lowerWidget)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>Size.fromHeight(height);
}
