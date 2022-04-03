
import 'package:flutter/material.dart';
import 'package:squadio/core/theme/app_colors.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/widgets/user_circular_avatar_with_ring.dart';

class DetailsSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final Person person;

  DetailsSliverDelegate({
    required this.person,
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.grey[300],
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
              elevation: 0.0,
              title: Opacity(
                opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                child: Text(person.name,style: Theme.of(context).textTheme.headline5),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserCircularAvatarWithRing(
                        photoUrl: "https://image.tmdb.org/t/p/w300"+(person.profilePath!),
                        size: 80,
                        ringColor: AppColors.accentColor,
                      ),
                      Text(person.name,style: Theme.of(context).textTheme.headline6)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}