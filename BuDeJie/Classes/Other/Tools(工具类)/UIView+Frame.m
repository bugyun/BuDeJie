//
// Created by 若云 on 2018-12-12.
// Copyright (c) 2018 GoodNight. All rights reserved.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)

- (CGFloat)zyh_width {
    return self.frame.size.width;
}

- (void)setZyh_width:(CGFloat)zyh_width {
    CGRect rect = self.frame;
    rect.size.width = zyh_width;
    self.frame = rect;
}

- (CGFloat)zyh_height {
    return self.frame.size.height;
}

- (void)setZyh_height:(CGFloat)zyh_height {
    CGRect rect = self.frame;
    rect.size.height = zyh_height;
    self.frame = rect;
}

- (CGFloat)zyh_x {
    return self.frame.origin.x;
}

- (void)setZyh_x:(CGFloat)zyh_x {
    CGRect rect = self.frame;
    rect.origin.x = zyh_x;
    self.frame = rect;
}

- (CGFloat)zyh_y {
    return self.frame.origin.y;
}

- (void)setZyh_y:(CGFloat)zyh_y {
    CGRect rect = self.frame;
    rect.origin.y = zyh_y;
    self.frame = rect;
}


@end