/*
 Created by Thanh Son on 11/1/2021.
 Copyright (c) 2021 . All rights reserved.
*/
mixin LazyScrollAction {
  // scroll to start of list
  void scrollToStart([bool animate = true]);

  // scroll to end of list
  void scrollToEnd([bool animate = true]);

  // scroll to a position of list
  void scrollTo(double position, [bool animate = true]);
}

mixin LazyReachAction {
  // clear reach state, hide reach widget
  void clearReach();
}
