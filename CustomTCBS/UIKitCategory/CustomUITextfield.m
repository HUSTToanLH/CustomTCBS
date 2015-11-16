//
//  CustomUITextfield.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "CustomUITextfield.h"

@implementation CustomUITextfield

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation CustomTimeoutTextfield

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor lightGrayColor];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if (self == [super initWithCoder:aDecoder]) {
        
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
    }
    
    return self;
}

@end
