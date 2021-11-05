/*
 Created by Thanh Son on 10/27/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:lazy_listview/interface/lazy_view.base.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/views/scroll_view_state.dart';

class LazyScrollView extends BaseLazyView {
  LazyScrollView({
    Key? key,
    WidgetBuilder? reachEndBuilder,
    WidgetBuilder? reachStartBuilder,
    LazyReachFunction? onReachEnd,
    LazyReachFunction? onReachStart,
    RefreshCallback? onRefresh,
    ScrollBackBuilder? scrollBackBuilder,
    ScrollBackMode scrollBackMode = ScrollBackMode.auto,
    Alignment scrollBackButtonAlignment = Alignment.bottomCenter,
    double offset = 30,
    required ScrollController scrollController,
    required Widget child,
  }) : super(
          key: key,
          reachEndBuilder: reachEndBuilder,
          reachStartBuilder: reachStartBuilder,
          onReachEnd: onReachEnd,
          onRefresh: onRefresh,
          onReachStart: onReachStart,
          scrollBackMode: scrollBackMode,
          scrollBackButtonBuilder: scrollBackBuilder,
          scrollBackButtonAlignment: scrollBackButtonAlignment,
          offset: offset,
          scrollController: scrollController,
          child: child,
        );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LazyScrollViewState();
  }
}
