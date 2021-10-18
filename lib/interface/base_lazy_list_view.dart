/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';

abstract class BaseLazyListView extends StatefulWidget {

  final ScrollController scrollController;
  final double offset;
  final WidgetBuilder? reachEndBuilder;
  final WidgetBuilder? reachStartBuilder;
  final ControlFunction? onReachEnd;
  final ControlFunction? onReachStart;
  final RefreshCallback? onRefresh;

  final LazyScrollBackMode scrollBackMode;
  final PointerBuilder? scrollBackButtonBuilder;
  final EdgeInsets scrollBackButtonMargin;
  final Alignment scrollBackButtonAlignment;

  /// listview reverse field
  final bool reverse;

  /// listview physics field
  final ScrollPhysics? physics;

  /// listview padding field
  final EdgeInsetsGeometry? padding;

  /// listview itemBuilder field
  final IndexedWidgetBuilder itemBuilder;

  /// listview separatorBuilder field
  final IndexedWidgetBuilder? separatorBuilder;

  /// listview itemCount field
  final int itemCount;

  /// listview addAutomaticKeepAlives field
  final bool addAutomaticKeepAlives;

  /// listview addRepaintBoundaries field
  final bool addRepaintBoundaries;

  /// listview addSemanticIndexes field
  final bool addSemanticIndexes;

  /// listview cacheExtent field
  final double? cacheExtent;

  /// listview dragStartBehavior field
  final DragStartBehavior dragStartBehavior;

  /// listview keyboardDismissBehavior field
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// listview restorationId field
  final String? restorationId;

  /// listview clipBehavior field
  final Clip clipBehavior;

  /// listview primary field
  final bool? primary;

  /// listview itemExtent field
  final double? itemExtent;

  const BaseLazyListView({
    Key? key,
    required this.scrollController,
    this.offset = 30,
    this.reachEndBuilder,
    this.reachStartBuilder,
    this.scrollBackButtonBuilder,
    this.onRefresh,
    this.onReachStart,
    this.onReachEnd,
    this.scrollBackMode = LazyScrollBackMode.auto,
    this.scrollBackButtonAlignment = Alignment.bottomCenter,
    this.scrollBackButtonMargin = EdgeInsets.zero,
    this.reverse = false,
    this.physics,
    this.padding,
    this.primary,
    this.itemExtent,
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
}
