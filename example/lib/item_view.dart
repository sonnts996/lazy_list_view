/*
 Created by Thanh Son on 10/15/2021.
 Copyright (c) 2021 . All rights reserved.
*/
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('Item $index'),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    );
  }
}
