/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:lazy_listview/lazy_list_view.dart';

class Pointer {
  const Pointer({this.position = 0, this.state = LazyScrollState.none});

  final double position;
  final LazyScrollState state;
}
