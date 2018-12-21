//
// Created by 若云 on 2018-12-17.
// Copyright (c) 2018 GoodNight. All rights reserved.
//

#import "ZYHSubTag.h"
#import "ZYHSubTagItem.h"

//@class ZYHSubTagItem;
@implementation ZYHSubTag

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value should be Class or Class name.
    return @{@"subTags": [ZYHSubTagItem class]};
}

@end