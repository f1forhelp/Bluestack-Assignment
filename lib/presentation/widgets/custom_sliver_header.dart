import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class CustomPeristSliverHeaderentDelegate
    implements SliverPersistentHeaderDelegate {
  final double maxExtent;
  final double minExtent;
  final bool canRebuild;
  final SliverHeaderBuilder sliverHeaderBuilder;
  CustomPeristSliverHeaderentDelegate(
      {required this.maxExtent,
      required this.minExtent,
      required SliverHeaderBuilder builder,
      bool shouldRebuild = true})
      : sliverHeaderBuilder = builder,
        canRebuild = shouldRebuild;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return sliverHeaderBuilder(context, shrinkOffset, overlapsContent);
    // print(shrinkOffset /maxExtent);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return canRebuild;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
