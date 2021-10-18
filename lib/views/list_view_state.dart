/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/interface/base_lazy_state.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/models/pointer.dart';
import 'package:lazy_listview/widgets/list_widget.dart';
import 'package:lazy_listview/widgets/pointer_widget.dart';
import 'package:lazy_listview/widgets/reach_widget.dart';
import 'package:lazy_listview/widgets/stability_widget.dart';

class LazyListViewState extends BaseLazyListViewState {
  bool _waiting = false;
  bool _waitingPointer = false;
  ValueNotifier<Pointer> pointerAlignNotifier = ValueNotifier(Pointer());
  ValueNotifier<LazyState> reachNotifier = ValueNotifier(LazyState.none);



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
        reachNotifier: reachNotifier,
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
    if (widget.scrollBackMode == LazyScrollBackMode.never) {
      return StabilityView(
        child: listView,
        onRefresh: widget.onRefresh,
      );
    } else {
      return PointerWidget(
        child: listView,
        pointerBuilder: widget.scrollBackButtonBuilder,
        pointNotifier: pointerAlignNotifier,
        onRefresh: widget.onRefresh,
      );
    }
  }

  void _listener() {
    var position = widget.scrollController.position;
    if (!_waitingPointer) {
      _waitingPointer = true;
      if (widget.scrollBackMode == LazyScrollBackMode.auto) {
        if (position.extentAfter == 0 || position.extentBefore == 0) {
          _clearPointer();
        } else if (position.userScrollDirection == ScrollDirection.reverse) {
          _point2Direct(LazyDirect.bottom, widget.scrollBackButtonMargin);
        } else if (position.userScrollDirection == ScrollDirection.forward) {
          _point2Direct(LazyDirect.top, widget.scrollBackButtonMargin);
        }
      } else if (widget.scrollBackMode == LazyScrollBackMode.toStart) {
        if (position.extentBefore == 0) {
          _clearPointer();
        } else {
          _point2Direct(LazyDirect.top, widget.scrollBackButtonMargin);
        }
      } else if (widget.scrollBackMode == LazyScrollBackMode.toEnd) {
        if (position.extentAfter == 0) {
          _clearPointer();
        } else {
          _point2Direct(LazyDirect.bottom, widget.scrollBackButtonMargin);
        }
      } else {
        _waitingPointer = false;
      }
    }
    if (!_waiting) {
      _waiting = true;
      if (widget.onReachEnd != null && position.extentAfter <= widget.offset) {
        reachNotifier.value = LazyState.reachEnd;
        widget.onReachEnd!().then((value) {
          _waiting = !value;
          reachNotifier.value = LazyState.none;
        });
      } else if (widget.onReachStart != null &&
          position.extentBefore <= widget.offset) {
        reachNotifier.value = LazyState.reachStart;
        widget.onReachStart!().then((value) {
          _waiting = !value;
          reachNotifier.value = LazyState.none;
        });
      } else {
        reachNotifier.value = LazyState.none;
        _waiting = false;
      }
    }
  }

  void _autoPointerToTop(double offset) {
    pointerAlignNotifier.value = Pointer(
      state: LazyScrollState.pointToTop,
      position: offset,
    );

    _waitingPointer = false;
  }

  void _autoPointerToBottom(double offset) {
    pointerAlignNotifier.value = Pointer(
      state: LazyScrollState.pointToBottom,
      position: offset,
    );
    _waitingPointer = false;
  }

  void _clearPointer() {
    pointerAlignNotifier.value = Pointer();
    _waitingPointer = false;
  }

  void _point2Direct(LazyDirect direct, double offset) {
    switch (direct) {
      case LazyDirect.top:
        // TODO: Handle this case.
        if (widget.reverse) {
          _autoPointerToTop(offset);
        } else {
          _autoPointerToBottom(offset);
        }
        break;
      case LazyDirect.bottom:
        // TODO: Handle this case.
        if (widget.reverse) {
          _autoPointerToBottom(offset);
        } else {
          _autoPointerToTop(offset);
        }
        break;
    }
  }

  @override
  void clearReach() {
    // TODO: implement clearReach
  }

  @override
  void scrollTo(double position) {
    // TODO: implement scrollTo
  }

  @override
  void scrollToStart() {
    // TODO: implement scrollToBottom
  }

  @override
  void scrollToEnd() {
    // TODO: implement scrollToTop
  }
}
