import 'package:flutter/material.dart';
import 'package:squadio/modules/person/widgets/user_circular_photo.dart';

import '../../../core/theme/app_colors.dart';

class UserCircularAvatarWithRing extends StatelessWidget {
  final String photoUrl;
  final double size;
  final bool isUser;
  final Color ringColor;
  final double ringWidth;

  const UserCircularAvatarWithRing({Key? key,required this.photoUrl,this.size=72,this.isUser=false,this.ringColor=AppColors.white,this.ringWidth=1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      margin:const EdgeInsetsDirectional.only(end: 16),
      padding:const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
        shape: BoxShape.circle,
        border: Border.all(color: ringColor,width:ringWidth),
      ),
      child: UserCircularAvatar(
        photoUrl: photoUrl,
        size: size,
        isUser: isUser,
      ),
    );
  }
}
