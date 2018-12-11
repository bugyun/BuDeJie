//
// Created by 若云 on 2018-12-11.
// Copyright (c) 2018 GoodNight. All rights reserved.
//

#import "UIImage+Image.h"


@implementation UIImage (Image)
+ (UIImage *)imageWithOriginalModeNamed:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end