/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
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
    LazyPointerMode pointerMode = LazyPointerMode.auto,
    double pointerMargin = 30,
    double offset = 30,
    bool reverse = false,
    required final Widget child,
    required final LazyState state,
    required final ScrollController scrollController,
  }) : super(
          key: key,
          reachBottomBuilder: reachEndBuilder,
          reachTopBuilder: reachStartBuilder,
          pointToBuilder: pointToBuilder,
          onReachEnd: onReachEnd,
          onRefresh: onRefresh,
          onReachStart: onReachStart,
          pointerMode: pointerMode,
          child: child,
          pointerMargin: pointerMargin,
          offset: offset,
          scrollController: scrollController,
          state: state,
          reverse: reverse,
        );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LazyListViewState();
  }
}
