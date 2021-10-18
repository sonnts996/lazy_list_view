/*
 Created by Thanh Son on 10/16/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
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
    this.shrinkWrap = false,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.primary,
    this.itemExtent,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

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
  final bool shrinkWrap;
  final bool? primary;
  final double? itemExtent;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (separatorBuilder != null) {
      return ListView.separated(
        primary: primary,
        scrollDirection: scrollDirection,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder!,
        itemCount: itemCount,
        reverse: reverse,
        controller: controller,
        physics: physics,
        padding: padding,
        shrinkWrap: shrinkWrap,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
      );
    } else {
      return ListView.builder(
        scrollDirection: scrollDirection,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        reverse: reverse,
        controller: controller,
        physics: physics,
        padding: padding,
        shrinkWrap: shrinkWrap,
        primary: primary,
        itemExtent: itemExtent,
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
}
