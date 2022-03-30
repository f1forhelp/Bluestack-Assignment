import 'package:flutter/material.dart';

typedef PaginatedSliverBuilder = Widget Function(
    BuildContext context, int index);

class CustomPaginatedSliverBuilder extends StatefulWidget {
  final PaginatedSliverBuilder customBuilder;
  final ScrollController scrollController;
  final Function? hitApi;
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

  @override
  void initState() {
    widget.scrollController.addListener(() async {
      if ((widget.scrollController.position.maxScrollExtent -
                  widget.scrollController.position.pixels)
              .abs() <
          200) {
        await requestApi();
        //HIt api
      }
    });

    super.initState();
  }

  Future requestApi() async {
    if (widget.hitApi != null && !isLoading) {
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
        return widget.customBuilder(context, index);
      },
      childCount: widget.itemCount ?? 0,
    ));
  }
}
