import 'package:bluestack_assignment/presentation/provider/dashboard/home_provder.dart';
import 'package:bluestack_assignment/presentation/widgets/base_view.dart';
import 'package:bluestack_assignment/presentation/widgets/custom_paginated_sliver_builder.dart';
import 'package:bluestack_assignment/presentation/widgets/custom_sliver_header.dart';
import 'package:bluestack_assignment/utils/constants/color_constants.dart';
import 'package:bluestack_assignment/utils/helper/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(onModelReady: (model) {
      model.getAllTournament();
    }, builder: (context, model, _) {
      return Scaffold(
        appBar: CustomAppBar(
          content: Text("Hii"),
        ),
        body: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // _StatsHeader(),
            CustomPaginatedSliverBuilder(
              itemCount: model.tournaments.length,
              hitApi: () async {
                await model.getAllTournament();
              },
              builder: (context, i) {
                return UiHelper.horizontalPadding(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: _TournamentsListItem(
                      coverUrl: model.tournaments[i].coverUrl,
                      gameName: model.tournaments[i].gameName,
                      name: model.tournaments[i].name,
                    ),
                  ),
                );
              },
              scrollController: scrollController,
            )
          ],
        ),
      );
    });
  }
}

class _StatsHeader extends StatelessWidget {
  const _StatsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: CustomPeristSliverHeaderentDelegate(
        maxExtent: 100.h,
        minExtent: 100.h,
        builder: (context, shrinkOffset, overlapContent) {
          return Opacity(
            opacity: 1 - (shrinkOffset / 100.h),
            child: UiHelper.horizontalPadding(
              child: Row(
                children: [
                  _StatsTile(
                    gradientColor: KColor.orangeGradient,
                    borderRadiusType: BorderRadiusType.leftRounded,
                    title: "32",
                    subTitle: "Tournaments\nplayed",
                  ),
                  _StatsTile(
                    gradientColor: KColor.purpleGradient,
                    title: "32",
                    borderRadiusType: BorderRadiusType.none,
                    subTitle: "Tournaments\nwon",
                  ),
                  _StatsTile(
                    gradientColor: KColor.redGradient,
                    borderRadiusType: BorderRadiusType.rightRounded,
                    title: "32",
                    subTitle: "Winning\npercentage",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://staticg.sportskeeda.com/editor/2021/12/ed547-16408681947929-1920.jpg",
              fit: BoxFit.fill,
              width: 88.h,
              height: 88.h,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Simon Baker",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100000),
                  border: Border.all(
                    color: KColor.borderBlue,
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      "2250",
                      style: TextStyle(
                        color: KColor.borderBlue,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Elo Rating",
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _TournamentsListItem extends StatelessWidget {
  final String? coverUrl;
  final String? name;
  final String? gameName;

  const _TournamentsListItem(
      {Key? key, this.coverUrl, this.name, this.gameName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(4, 4),
            color: Colors.black12,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: coverUrl ?? "",
                height: 90.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              name ?? "",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              gameName ?? "",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 22.r),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BorderRadiusType { none, leftRounded, rightRounded }

class _StatsTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final List<Color> gradientColor;
  final BorderRadiusType borderRadiusType;
  const _StatsTile({
    Key? key,
    this.title,
    this.borderRadiusType = BorderRadiusType.none,
    required this.gradientColor,
    this.subTitle,
  }) : super(key: key);

  _getBorderRadius() {
    if (borderRadiusType == BorderRadiusType.leftRounded) {
      return BorderRadius.horizontal(
        left: Radius.circular(16.r),
      );
    } else if (borderRadiusType == BorderRadiusType.rightRounded) {
      return BorderRadius.horizontal(
        right: Radius.circular(16.r),
      );
    } else {
      return const BorderRadius.horizontal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradientColor),
          borderRadius: _getBorderRadius(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? "0",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subTitle ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? content;

  const CustomAppBar({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: avoid_unnecessary_containers
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        constraints: const BoxConstraints(
          maxHeight: 52,
        ),
        child: content,
      ),
    );
  }

  @override
  Size get preferredSize => Size(1.sw, 46.h);
}
