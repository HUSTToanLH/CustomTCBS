//
//  StyleConfig.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "StyleConfig.h"

@implementation StyleConfig

@end

@implementation TextStyleLabel

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    self.textColor = [UIColor blackColor];
    self.font = [UIFont fontWithName:strFont size:13];
}

@end