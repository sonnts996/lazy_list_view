/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:lazy_listview/interface/base_lazy_list_view.dart';

abstract class BaseLazyListViewState extends State<BaseLazyListView> {

  // scroll to start of list
  void scrollToStart([bool animate = true]);

  // scroll to end of list
  void scrollToEnd([bool animate = true]);

  // scroll to a position of list
  void scrollTo(double position, [bool animate = true]);

  // clear reach state, hide reach widget
  void clearReach();
}
