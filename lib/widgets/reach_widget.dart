/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';

class ReachWidget extends StatelessWidget {
  const ReachWidget(
      {Key? key,
      required this.reachBuilder,
      required this.scrollController,
      this.reachTop = true,
      this.onRefresh,
      required this.child})
      : super(key: key);

  final WidgetBuilder? reachBuilder;
  final bool reachTop;
  final Widget child;
  final ScrollController scrollController;
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(children: [
      Expanded(
          child: onRefresh == null
              ? child
              : RefreshIndicator(child: child, onRefresh: onRefresh!)),
      reachBuilder != null
          ? reachBuilder!(context)
          : Container(
              height: 30,
            )
    ]);
  }
}
