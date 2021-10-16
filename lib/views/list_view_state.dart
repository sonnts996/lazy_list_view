/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/interface/base_lazy_state.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/models/pointer.dart';
import 'package:lazy_listview/widgets/pointer_widget.dart';
import 'package:lazy_listview/widgets/reach_widget.dart';
import 'package:lazy_listview/widgets/stability_widget.dart';

class LazyListViewState extends BaseLazyListViewState {
  bool _waiting = false;
  bool _waitingPointer = false;
  ValueNotifier<Pointer> pointerAlignNotifier = ValueNotifier(Pointer());

  @override
  void scrollToBottom() {
    // TODO: implement scrollToBottom
  }

  @override
  void scrollToTop() {
    // TODO: implement scrollToTop
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (widget.state) {
      case LazyState.reachBottom:
        // TODO: Handle this case.
        return ReachWidget(
          scrollController: widget.scrollController,
          reachBuilder: widget.reachBottomBuilder,
          child: widget.child,
          reachTop: false,
          onRefresh: widget.onRefresh,
        );
      case LazyState.reachTop:
        // TODO: Handle this case.
        return ReachWidget(
          scrollController: widget.scrollController,
          reachBuilder: widget.reachTopBuilder,
          child: widget.child,
          reachTop: false,
          onRefresh: widget.onRefresh,
        );
      case LazyState.stability:
        // TODO: Handle this case.
        if (widget.pointerMode == LazyPointerMode.never) {
          return StabilityView(
            child: widget.child,
            onRefresh: widget.onRefresh,
          );
        } else {
          return PointerWidget(
            child: widget.child,
            pointerBuilder: widget.pointToBuilder,
            pointNotifier: pointerAlignNotifier,
            onRefresh: widget.onRefresh,
          );
        }
    }
  }

  void _listener() {
    var position = widget.scrollController.position;
    if (!_waitingPointer) {
      _waitingPointer = true;
      if (widget.pointerMode == LazyPointerMode.auto) {
        if (position.extentAfter == 0 || position.extentBefore == 0) {
          _clearPointer();
        } else if (position.userScrollDirection == ScrollDirection.reverse) {
          _point2Direct(LazyDirect.bottom, widget.pointerMargin);
        } else if (position.userScrollDirection == ScrollDirection.forward) {
          _point2Direct(LazyDirect.top, widget.pointerMargin);
        }
      } else if (widget.pointerMode == LazyPointerMode.toStart) {
        if (position.extentBefore == 0) {
          _clearPointer();
        } else {
          _point2Direct(LazyDirect.top, widget.pointerMargin);
        }
      } else if (widget.pointerMode == LazyPointerMode.toEnd) {
        if (position.extentAfter == 0) {
          _clearPointer();
        } else {
          _point2Direct(LazyDirect.bottom, widget.pointerMargin);
        }
      } else {
        _waitingPointer = false;
      }
    }
    if (!_waiting) {
      _waiting = true;
      if (widget.onReachEnd != null && position.extentAfter <= widget.offset) {
        widget.onReachEnd!().then((value) => _waiting = !value);
      } else if (widget.onReachStart != null &&
          position.extentBefore <= widget.offset) {
        widget.onReachStart!().then((value) => _waiting = !value);
      } else {
        _waiting = false;
      }
    }
  }

  void _autoPointerToTop(double offset) {
    pointerAlignNotifier.value = Pointer(
      state: LazyPointerState.pointToTop,
      position: offset,
    );

    _waitingPointer = false;
  }

  void _autoPointerToBottom(double offset) {
    pointerAlignNotifier.value = Pointer(
      state: LazyPointerState.pointToBottom,
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

}
