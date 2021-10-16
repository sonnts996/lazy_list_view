/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:lazy_listview/models/functions.dart';
import 'package:lazy_listview/models/lazy_state.dart';
import 'package:lazy_listview/models/pointer.dart';

class PointerWidget extends StatelessWidget {
  const PointerWidget({
    Key? key,
    required this.child,
    this.pointerBuilder,
    required this.pointNotifier,
    this.onRefresh,
  }) : super(key: key);

  final Widget child;
  final PointerBuilder? pointerBuilder;
  final ValueNotifier<Pointer> pointNotifier;
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        onRefresh == null
            ? child
            : RefreshIndicator(child: child, onRefresh: onRefresh!),
        pointerBuilder == null
            ? Container()
            : ValueListenableBuilder<Pointer>(
                valueListenable: pointNotifier,
                builder: (context, value, child) {
                  return Visibility(
                      visible: value.state != LazyPointerState.none,
                      child: Positioned(
                        child: pointerBuilder!(
                            context, value.state, value.position),
                        bottom: value.position,
                      ));
                },
              )
      ],
    );
  }
}
