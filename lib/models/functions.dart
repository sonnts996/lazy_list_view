/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lazy_listview/models/scrollback.dart';

/// call when get reach state, return true if the action done and clear the reach widget
/// otherwise, the reach state was keep util call clearReach function.
typedef LazyReachFunction = Future<bool> Function();

/// return scroll back widget and its position
typedef ScrollBackBuilder = LazyScrollBack Function(
  BuildContext context,
  ScrollDirection direction,
);
