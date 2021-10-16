/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:lazy_listview/interface/base_lazy_list_view.dart';

abstract class BaseLazyListViewState extends State<BaseLazyListView> {
  void scrollToBottom();

  void scrollToTop();
}
