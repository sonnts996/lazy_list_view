/*
 Created by Thanh Son on 10/14/2021.
 Copyright (c) 2021 . All rights reserved.
*/
enum LazyState { reachBottom, reachTop, stability }

enum LazyPointerState { none, pointToTop, pointToBottom }

enum LazyPointerMode { auto, never, toEnd, toStart }

enum LazyDirect { top, bottom }
