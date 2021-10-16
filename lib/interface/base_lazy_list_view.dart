/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';

abstract class BaseLazyListView extends StatefulWidget {
  final WidgetBuilder? reachBottomBuilder;
  final WidgetBuilder? reachTopBuilder;
  final PointerBuilder? pointToBuilder;
  final ControlFunction? onReachEnd;
  final ControlFunction? onReachStart;
  final RefreshCallback? onRefresh;
  final Widget child;
  final LazyState state;
  final ScrollController scrollController;
  final double offset;
  final double pointerMargin;
  final LazyPointerMode pointerMode;
  final bool reverse;

  const BaseLazyListView({
    Key? key,
    required this.scrollController,
    required this.state,
    required this.child,
    this.reachBottomBuilder,
    this.reachTopBuilder,
    this.pointToBuilder,
    this.onRefresh,
    this.onReachStart,
    this.onReachEnd,
    this.pointerMode = LazyPointerMode.auto,
    this.offset = 30,
    this.pointerMargin = 30,
    this.reverse = false,
  }) : super(key: key);
}
