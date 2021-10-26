/*
 Created by Thanh Son on 10/26/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:lazy_listview/models/scrollback_position.dart';

class LazyScrollBack {

  /// the scroll back widget
  final Widget widget;

  /// the scroll back widget's position
  final LazyPosition position;

  const LazyScrollBack({
    required this.widget,
    this.position = LazyPosition.bottomPoint,
  });
}
