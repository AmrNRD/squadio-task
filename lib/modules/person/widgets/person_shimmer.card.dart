
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadio/core/routes/route_generator.dart';
import 'package:squadio/core/theme/app_colors.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/widgets/user_circular_avatar_with_ring.dart';

import '../../../env.dart';

class PersonShimmerCard extends StatelessWidget {

  const PersonShimmerCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
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
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start:12,end: 12),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                      "assets/images/profile_pic.jpeg"
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Text(
                        "John doe",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
