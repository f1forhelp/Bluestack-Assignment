import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomPeristSliverHeaderentDelegate
    implements SliverPersistentHeaderDelegate {
  @override
  final double maxExtent;
  @override
  final double minExtent;
  final bool canRebuild;
  final Widget Function(
      BuildContext context, double shrinkOffset, bool overlapsContent) builder;

  CustomPeristSliverHeaderentDelegate(
      {required this.maxExtent,
      required this.minExtent,
      required this.builder,
      bool shouldRebuild = true})
      : canRebuild = shouldRebuild;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context, shrinkOffset, overlapsContent);
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
