/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazy_listview/interface/base_lazy_list_view.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/views/list_view_state.dart';

class LazyListView extends BaseLazyListView {
  LazyListView({
    Key? key,
    WidgetBuilder? reachEndBuilder,
    WidgetBuilder? reachStartBuilder,
    PointerBuilder? pointToBuilder,
    ControlFunction? onReachEnd,
    ControlFunction? onReachStart,
    RefreshCallback? onRefresh,
    LazyScrollBackMode pointerMode = LazyScrollBackMode.auto,
    double pointerMargin = 30,
    double offset = 30,
    bool reverse = false,
    required  ScrollController scrollController,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    required IndexedWidgetBuilder itemBuilder,
    IndexedWidgetBuilder? separatorBuilder,
    required int itemCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) : super(
          key: key,
          reachEndBuilder: reachEndBuilder,
          reachStartBuilder: reachStartBuilder,
          scrollBackButtonBuilder: pointToBuilder,
          onReachEnd: onReachEnd,
          onRefresh: onRefresh,
          onReachStart: onReachStart,
          scrollBackMode: pointerMode,
          scrollBackButtonMargin: pointerMargin,
          offset: offset,
          scrollController: scrollController,
          reverse: reverse,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: itemCount,
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LazyListViewState();
  }
}
