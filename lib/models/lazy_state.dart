/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/

/// state of listview, when list is reached start or end
enum LazyState { reachStart, reachEnd, none }

/// mode of scroll back
enum ScrollBackMode {

  /// scroll back widget will be displayed when scroll position is between two offset limit
  auto,

  /// scroll back widget is always hidden
  never,

  /// scroll back widget will be displayed when scroll position is outside the end offset limit
  toEnd,

  /// scroll back widget will be displayed when scroll position is outside the start offset limit
  toStart,
}
