import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef PaginatedSliverBuilder = Widget Function(
    BuildContext context, int index);

typedef FutureCall = Future Function();

class CustomPaginatedSliverBuilder extends StatefulWidget {
  final PaginatedSliverBuilder customBuilder;
  final ScrollController scrollController;
  final FutureCall? hitApi;
  final int? itemCount;
  const CustomPaginatedSliverBuilder(
      {Key? key,
      required PaginatedSliverBuilder builder,
      required this.scrollController,
      this.hitApi,
      this.itemCount})
      : customBuilder = builder,
        super(key: key);

  @override
  State<CustomPaginatedSliverBuilder> createState() =>
      _CustomPaginatedSliverBuilderState();
}

class _CustomPaginatedSliverBuilderState
    extends State<CustomPaginatedSliverBuilder> {
  bool isLoading = false;
  int currentItemCount = 0;
  @override
  void initState() {
    widget.scrollController.addListener(() async {
      if (currentItemCount + 1 == widget.itemCount) {
        if (!isLoading) {
          await requestApi();
        }
      }
    });
    super.initState();
  }

  Future requestApi() async {
    if (widget.hitApi != null) {
      isLoading = true;
      setState(() {});
      await widget.hitApi!();
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        currentItemCount = index;
        if (currentItemCount + 1 == widget.itemCount) {
          return Column(
            children: [
              widget.customBuilder(context, index),
              SizedBox(
                height: 150.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        } else {
          return widget.customBuilder(context, index);
        }
      },
      childCount: widget.itemCount ?? 0,
    ));
  }
}
