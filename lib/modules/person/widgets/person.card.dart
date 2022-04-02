
import 'package:flutter/material.dart';
import 'package:squadio/core/theme/app_colors.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/widgets/user_circular_avatar_with_ring.dart';

import '../../../env.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({Key? key,required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      constraints:const BoxConstraints(maxWidth: 223,minHeight: 90),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
        border: Border.all(color: AppColors.lightGrey),
      ),
      child:  Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start:12,end: 12),
            child: Row(
              children: [
                UserCircularAvatarWithRing(
                  photoUrl: "https://image.tmdb.org/t/p/w300"+(person.profilePath!)+"?api_key=${Env.token}",
                  size: 80,
                  ringColor: AppColors.accentColor,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        person.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
