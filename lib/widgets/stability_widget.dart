/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/material.dart';

class StabilityView extends StatelessWidget {
  const StabilityView({Key? key, required this.child, this.onRefresh})
      : super(key: key);

  final Widget child;
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return onRefresh == null
        ? child
        : RefreshIndicator(child: child, onRefresh: onRefresh!);
  }
}
