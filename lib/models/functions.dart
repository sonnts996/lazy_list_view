/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:lazy_listview/lazy_list_view.dart';

typedef ControlFunction = Future<bool> Function();
typedef PointerBuilder = Widget Function(
  BuildContext context,
  LazyPointerState mode,
  double position,
);

typedef PointerFunction = Future<bool> Function(LazyPointerState mode);
