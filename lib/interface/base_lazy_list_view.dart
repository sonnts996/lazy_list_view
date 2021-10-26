/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';

abstract class BaseLazyListView extends StatefulWidget {

  /// the limit value at which the scroll position executes the functions
  final double offset;

  /// return the reach end widget, null if don't use it
  final WidgetBuilder? reachEndBuilder;

  /// return the reach start widget, null if don't use it
  final WidgetBuilder? reachStartBuilder;

  /// the function is called when the scroll position reaches
  /// a value in the offset at the end of the list.
  /// reach end state will be ignored when this object null.
  final ControlFunction? onReachEnd;

  /// the function is called when the scroll position reaches
  /// a value in the offset at the start of the list.
  /// reach start state will be ignored when this object null.
  final ControlFunction? onReachStart;

  /// the function is called when the refresh indicator action
  /// the refresh indicator will be ignored when this object null.
  final RefreshCallback? onRefresh;

  /// mode of scroll back
  final ScrollBackMode scrollBackMode;

  /// the widget display when the scroll back is active - outside the value of offset
  final ScrollBackBuilder? scrollBackButtonBuilder;

  /// scroll back widget alignment in stack
  final Alignment scrollBackButtonAlignment;

  /// listview controller field
  /// request to check the scrolling state of the list
  final ScrollController scrollController;

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
    this.scrollBackMode = ScrollBackMode.auto,
    this.scrollBackButtonAlignment = Alignment.bottomCenter,
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
