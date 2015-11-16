//
//  CustomActivityView.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "CustomActivityView.h"

@implementation CustomActivityView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation CustomRightActivityView

-(void)awakeFromNib{
    [super awakeFromNib];
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1.5f, 1.5f);
    self.transform = transform;
}

@end
