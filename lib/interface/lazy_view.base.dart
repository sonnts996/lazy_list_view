/*
 Created by Thanh Son on 10/27/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';

abstract class BaseLazyView  extends StatefulWidget{
  /// the limit value at which the scroll position executes the functions
  final double offset;

  /// return the reach end widget, null if don't use it
  final WidgetBuilder? reachEndBuilder;

  /// return the reach start widget, null if don't use it
  final WidgetBuilder? reachStartBuilder;

  /// the function is called when the scroll position reaches
  /// a value in the offset at the end of the list.
  /// reach end state will be ignored when this object null.
  final LazyReachFunction? onReachEnd;

  /// the function is called when the scroll position reaches
  /// a value in the offset at the start of the list.
  /// reach start state will be ignored when this object null.
  final LazyReachFunction? onReachStart;

  /// the function is called when the refresh indicator action
  /// the refresh indicator will be ignored when this object null.
  final RefreshCallback? onRefresh;

  /// mode of scroll back
  final ScrollBackMode scrollBackMode;

  /// the widget display when the scroll back is active - outside the value of offset
  final ScrollBackBuilder? scrollBackButtonBuilder;

  /// scroll back widget alignment in stack
  final Alignment scrollBackButtonAlignment;

  /// request to check the scrolling state of the list
  final ScrollController scrollController;

  /// Scroll widget
  final Widget child;

  const BaseLazyView({
    Key? key,
    required this.scrollController,
    required this.child,
    this.offset = 30,
    this.reachEndBuilder,
    this.reachStartBuilder,
    this.scrollBackButtonBuilder,
    this.onRefresh,
    this.onReachStart,
    this.onReachEnd,
    this.scrollBackMode = ScrollBackMode.auto,
    this.scrollBackButtonAlignment = Alignment.bottomCenter,
  });
}
