//
//  CustomUIButton.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "CustomUIButton.h"

@implementation CustomUIButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation CustomClearButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor clearColor];
    
//    [self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonPressed{
    self.selected = !self.selected;
    
    NSAttributedString *attrNormal = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleNone]}];
    NSAttributedString *attrSelected = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInt:NSUnderlineStyleSingle]}];
    
    [self setAttributedTitle:attrNormal forState:UIControlStateNormal];
    
    [UIView animateWithDuration:1 animations:^{
        [self setAttributedTitle:attrSelected forState:UIControlStateSelected];
    } completion:^(BOOL finished) {
        [self setAttributedTitle:attrNormal forState:UIControlStateSelected];
    }];
}

@end

@implementation CustomCornerButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 10.0;
    self.layer.borderColor = [[UIColor clearColor] CGColor];
    self.layer.borderWidth = 0.0f;
}

@end

@implementation CustomCircleButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1.0;
    
    self.clipsToBounds = YES;
}

@end

@implementation CustomCheckButton

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressButton{
    self.isSelected = !self.isSelected;
    [self setCustomBackgroundImage];
}

-(void)setCustomBackgroundImage{
    if (self.isSelected) {
        [self setBackgroundImage:[UIImage imageNamed:@"ic_checked.png"] forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

@end
