/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/models/functions.dart';

class ScrollBackWidget extends StatelessWidget {
  const ScrollBackWidget(
      {Key? key,
      required this.child,
      this.alignment = Alignment.bottomCenter,
      this.scrollBackBuilder,
      required this.pointNotifier,
      this.onRefresh})
      : super(key: key);

  final Widget child;
  final ScrollBackBuilder? scrollBackBuilder;
  final ValueNotifier<ScrollDirection?> pointNotifier;
  final RefreshCallback? onRefresh;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: alignment,
      children: [
        onRefresh == null
            ? child
            : RefreshIndicator(child: child, onRefresh: onRefresh!),
        scrollBackBuilder == null
            ? Container()
            : ValueListenableBuilder<ScrollDirection?>(
                valueListenable: pointNotifier,
                builder: (context, value, child) {
                  if (value != null) {
                    var scrollBack = scrollBackBuilder!(context, value);
                    return Positioned(
                      child: scrollBack.widget,
                      bottom: scrollBack.position.bottom,
                      top: scrollBack.position.top,
                      right: scrollBack.position.right,
                      left: scrollBack.position.left,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
      ],
    );
  }
}
