/*
 Created by Thanh Son on 11/1/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/interface/lazy_action.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/views/scroll_view.dart';
import 'package:lazy_listview/widgets/scrollback_widget.dart';
import 'package:lazy_listview/widgets/stability_widget.dart';

class LazyScrollViewState extends State<LazyScrollView> with LazyScrollAction {
  ValueNotifier<ScrollDirection?> _scrollBackNotifier = ValueNotifier(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.scrollBackMode == ScrollBackMode.never) {
      return StabilityView(
        child: widget.child,
        onRefresh: widget.onRefresh,
      );
    } else {
      return ScrollBackWidget(
        child: widget.child,
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
  }

  void _clearScrollBackWidget() {
    _scrollBackNotifier.value = null;
  }

  void _point2Direct(ScrollDirection direct) {
    _scrollBackNotifier.value = direct;
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
