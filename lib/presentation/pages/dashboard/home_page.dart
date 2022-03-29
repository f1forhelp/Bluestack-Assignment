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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        content: Text("Hii"),
      ),
      body: SafeArea(
        child: UiHelper.horizontalPadding(
          child: Column(
            children: [
              Container(
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
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 12.w),
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
              ),
              Container(
                child: Row(
                  children: [
                    _StatsTile(
                        gradientColor: KColor.orangeGradient,
                        borderRadiusType: BorderRadiusType.leftRounded,
                        title: "20",
                        subTitle: "Tournaments\nPlayed"),
                    _StatsTile(
                        gradientColor: KColor.purpleGradient,
                        title: "20",
                        subTitle: "Tournaments\nPlayed"),
                    _StatsTile(
                        gradientColor: KColor.redGradient,
                        borderRadiusType: BorderRadiusType.rightRounded,
                        title: "20",
                        subTitle: "Tournaments\nPlayed"),
                  ],
                ),
              ),
              Text(
                "Recommended for you",
                style: TextStyle(),
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
          children: [
            Text(
              title ?? "0",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subTitle ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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