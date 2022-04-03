import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:squadio/core/theme/app_colors.dart';

class UserCircularAvatar extends StatelessWidget {
  final String photoUrl;
  final double size;
  final bool isUser;
  const UserCircularAvatar({this.photoUrl="", this.size=72,this.isUser=false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: photoUrl,
          placeholder: (context, url) => Container(margin: const EdgeInsets.all(12), width: 20, height: 20, child: const CircularProgressIndicator(strokeWidth: 1.5,color: AppColors.accentColor,)),
          errorWidget: (context, url, error) => Image.asset("assets/images/profile_pic.jpeg"),
        ),
      ),
    );
  }
}
