/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:lazy_listview/interface/lazy_action.dart';
import 'package:lazy_listview/lazy_list_view.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/views/scroll_view.dart';
import 'package:lazy_listview/widgets/list_widget.dart';
import 'package:lazy_listview/widgets/reach_widget.dart';

class LazyListViewState extends State<LazyListView> with LazyReachAction {
  bool _waiting = false;
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

    return LazyScrollView(
      reachEndBuilder: widget.reachEndBuilder,
      reachStartBuilder: widget.reachStartBuilder,
      onReachEnd: widget.onReachEnd,
      onRefresh: widget.onRefresh,
      onReachStart: widget.onReachStart,
      scrollBackMode: widget.scrollBackMode,
      scrollBackBuilder: widget.scrollBackBuilder,
      scrollBackButtonAlignment: widget.scrollBackButtonAlignment,
      offset: widget.offset,
      scrollController: widget.scrollController,
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    if ((widget.reachEndBuilder != null || widget.reachStartBuilder != null) &&
        widget.itemCount > 0) {
      return ReachWidget(
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
      return MainListView(
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
        shrinkWrap: widget.shrinkWrap,
        itemExtent: widget.itemExtent,
        scrollDirection: widget.scrollDirection,
        primary: widget.primary,
      );
    }
  }

  void _listener() {
    var position = widget.scrollController.position;

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

  @override
  void clearReach() {
    // TODO: implement clearReach
    _reachNotifier.value = LazyState.none;
    _waiting = false;
  }
}
