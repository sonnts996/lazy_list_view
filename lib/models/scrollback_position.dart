/*
 Created by Thanh Son on 10/26/2021.
 Copyright (c) 2021 . All rights reserved.
*/
class LazyPosition {

  // position top value
  final double? top;

  // position bottom value
  final double? bottom;

  // position right value
  final double? right;

  // position left value
  final double? left;

  /// at least 1 non-null parameter
  const LazyPosition({
    this.top,
    this.left,
    this.right,
    this.bottom,
  }) : assert(top != null || bottom != null || right != null || left != null);

  // default top position
  static const LazyPosition topPoint = LazyPosition(top: 0);

  // default bottom position
  static const LazyPosition bottomPoint = LazyPosition(bottom: 0);

  // default left position
  static const LazyPosition leftPoint = LazyPosition(left: 0);

  // default right position
  static const LazyPosition rightPoint = LazyPosition(right: 0);
}
