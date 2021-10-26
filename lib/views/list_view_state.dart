/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/interface/base_lazy_state.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/widgets/list_widget.dart';
import 'package:lazy_listview/widgets/reach_widget.dart';
import 'package:lazy_listview/widgets/scrollback_widget.dart';
import 'package:lazy_listview/widgets/stability_widget.dart';

class LazyListViewState extends BaseLazyListViewState {
  bool _waiting = false;
  ValueNotifier<ScrollDirection?> _scrollBackNotifier = ValueNotifier(null);
  ValueNotifier<LazyState> _reachNotifier = ValueNotifier(LazyState.none);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var listView;
    if ((widget.reachEndBuilder != null || widget.reachStartBuilder != null) &&
        widget.itemCount > 0) {
      listView = ReachWidget(
        reachEndBuilder: widget.reachEndBuilder,
        reachStartBuilder: widget.reachStartBuilder,
        onRefresh: widget.onRefresh,
        reachNotifier: _reachNotifier,
        // listview
        controller: widget.scrollController,
        itemBuilder: widget.itemBuilder,
        itemCount: widget.itemCount,
        separatorBuilder: widget.separatorBuilder,
        reverse: widget.reverse,
        physics: widget.physics,
        padding: widget.padding,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addSemanticIndexes: widget.addSemanticIndexes,
        cacheExtent: widget.cacheExtent,
        dragStartBehavior: widget.dragStartBehavior,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        restorationId: widget.restorationId,
        clipBehavior: widget.clipBehavior,
      );
    } else {
      listView = MainListView(
        controller: widget.scrollController,
        itemBuilder: widget.itemBuilder,
        itemCount: widget.itemCount,
        separatorBuilder: widget.separatorBuilder,
        reverse: widget.reverse,
        physics: widget.physics,
        padding: widget.padding,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addSemanticIndexes: widget.addSemanticIndexes,
        cacheExtent: widget.cacheExtent,
        dragStartBehavior: widget.dragStartBehavior,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        restorationId: widget.restorationId,
        clipBehavior: widget.clipBehavior,
      );
    }
    if (widget.scrollBackMode == ScrollBackMode.never) {
      return StabilityView(
        child: listView,
        onRefresh: widget.onRefresh,
      );
    } else {
      return ScrollBackWidget(
        child: listView,
        scrollBackBuilder: widget.scrollBackButtonBuilder,
        pointNotifier: _scrollBackNotifier,
        onRefresh: widget.onRefresh,
      );
    }
  }

  void _listener() {
    var position = widget.scrollController.position;
    if (widget.scrollBackMode == ScrollBackMode.auto) {
      if (position.extentAfter <= widget.offset ||
          position.extentBefore <= widget.offset) {
        _clearScrollBackWidget();
      } else if (position.userScrollDirection == ScrollDirection.reverse ||
          position.userScrollDirection == ScrollDirection.forward) {
        _point2Direct(position.userScrollDirection);
      }
    } else if (widget.scrollBackMode == ScrollBackMode.toStart) {
      if (position.extentBefore <= widget.offset) {
        _clearScrollBackWidget();
      } else {
        _point2Direct(ScrollDirection.forward);
      }
    } else if (widget.scrollBackMode == ScrollBackMode.toEnd) {
      if (position.extentAfter <= widget.offset) {
        _clearScrollBackWidget();
      } else {
        _point2Direct(ScrollDirection.reverse);
      }
    }

    if (!_waiting) {
      _waiting = true;
      if (widget.onReachEnd != null && position.extentAfter <= widget.offset) {
        _reachNotifier.value = LazyState.reachEnd;
        widget.onReachEnd!().then((value) {
          _waiting = !value;
          _reachNotifier.value = LazyState.none;
        });
      } else if (widget.onReachStart != null &&
          position.extentBefore <= widget.offset) {
        _reachNotifier.value = LazyState.reachStart;
        widget.onReachStart!().then((value) {
          _waiting = !value;
          _reachNotifier.value = LazyState.none;
        });
      } else {
        _reachNotifier.value = LazyState.none;
        _waiting = false;
      }
    }
  }

  void _clearScrollBackWidget() {
    _scrollBackNotifier.value = null;
  }

  void _point2Direct(ScrollDirection direct) {
    _scrollBackNotifier.value =  direct;
  }

  @override
  void clearReach() {
    // TODO: implement clearReach
    _reachNotifier.value = LazyState.none;
    _waiting = false;
  }

  @override
  void scrollTo(double position, [bool animate = true]) {
    // TODO: implement scrollTo
    if (animate) {
      widget.scrollController.animateTo(position,
          duration: Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      widget.scrollController.jumpTo(position);
    }
  }

  @override
  void scrollToEnd([bool animate = true]) {
    // TODO: implement scrollToEnd
    scrollTo(widget.scrollController.position.viewportDimension, animate);
  }

  @override
  void scrollToStart([bool animate = true]) {
    // TODO: implement scrollToStart
    scrollTo(0, animate);
  }
}
