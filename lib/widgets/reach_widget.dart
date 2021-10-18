/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/widgets/list_widget.dart';

class ReachWidget extends StatelessWidget {
  const ReachWidget({
    Key? key,
    this.reachEndBuilder,
    this.reachStartBuilder,
    required this.reachNotifier,
    this.onRefresh,
    this.reverse = false,
    required this.controller,
    this.physics,
    this.padding,
    required this.itemBuilder,
    this.separatorBuilder,
    required this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  }) : super(key: key);

  final WidgetBuilder? reachEndBuilder;
  final WidgetBuilder? reachStartBuilder;
  final RefreshCallback? onRefresh;
  final ValueNotifier<LazyState> reachNotifier;

  // list view
  final bool reverse;
  final ScrollController controller;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var realCount = itemCount;
    if (reachStartBuilder != null) realCount += 1;
    if (reachEndBuilder != null) realCount += 1;
    return MainListView(
      controller: controller,
      itemBuilder: (context, index) {
        if (index == 0 && reachStartBuilder != null) {
          return ValueListenableBuilder<LazyState>(
              valueListenable: reachNotifier,
              builder: (context, value, child) => Visibility(
                    visible: value == LazyState.reachStart,
                    child: reachStartBuilder!(context),
                  ));
        } else if (index == realCount - 1 && reachEndBuilder != null) {
          return ValueListenableBuilder<LazyState>(
              valueListenable: reachNotifier,
              builder: (context, value, child) => Visibility(
                    visible: value == LazyState.reachEnd,
                    child: reachEndBuilder!(context),
                  ));
        } else if (reachStartBuilder != null) {
          return itemBuilder(context, index - 1);
        } else {
          return itemBuilder(context, index);
        }
      },
      itemCount: realCount,
      separatorBuilder: separatorBuilder,
      reverse: reverse,
      physics: physics,
      padding: padding,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
    );
  }
}
