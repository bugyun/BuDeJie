//
//  ZYHSubTagCell.m
//  BuDeJie
//
//  Created by 若云 on 2018/12/17.
//  Copyright © 2018年 GoodNight. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "ZYHSubTagCell.h"
#import "ZYHSubTagItem.h"

@interface ZYHSubTagCell ()
@property(weak, nonatomic) IBOutlet UIImageView *headImage;
@property(weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(weak, nonatomic) IBOutlet UILabel *desLabel;
@property(weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ZYHSubTagCell

- (void)setFrame:(CGRect)frame {
    ZYHLog(@"%@", NSStringFromCGRect(frame));
    frame.size.height -= 1;
    [super setFrame:frame];
}


//从 xib 加载就会调用一次
- (void)awakeFromNib {
    [super awakeFromNib];
    //设置头像圆角,ios9苹果修复
    _headImage.layer.cornerRadius = 30;
    _headImage.layer.masksToBounds = YES;

    //设置 cell 的边距
    self.layoutMargins = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setItem:(ZYHSubTagItem *)item {
    _item = item;
    self.nameLabel.text = item.name;
    [self.headImage sd_setImageWithURL:@"http://www.gx8899.com/uploads/allimg/160804/3-160P4111639.jpg" placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];

    //判断下有没有>10000
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅", item.code];
    NSInteger num = item.code.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.f;
        numStr = [NSString stringWithFormat:@"%.1f人订阅", numF];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    self.desLabel.text = numStr;


}
@end
