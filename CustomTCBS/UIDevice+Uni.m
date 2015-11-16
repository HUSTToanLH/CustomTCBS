//
//  UIDevice+Uni.m
//  MTrading
//
//  Created by Kaze on 9/23/14.
//  Copyright (c) 2014 FSS. All rights reserved.
//

#import "UIDevice+Uni.h"

@implementation UIDevice (Uni)

+ (int)deviceType
{
    NSString *type = [self currentDevice].model;
    if ([type rangeOfString:@"iPhone"].location != NSNotFound)
        return 0;
    if ([type rangeOfString:@"iPod"].location != NSNotFound)
        return 1;
    if ([type rangeOfString:@"iPad"].location != NSNotFound)
        return 2;
    return -1;
}

+ (BOOL)isIPhone
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+ (BOOL)isIPad
{
    // Đây là cách tốt nhất để check app đang run ở chế độ nào. Nếu app chỉ build cho iPhone mà run trên iPad thì vẫn return NO trong hàm này.
//    return NO;
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (BOOL)isIPod
{
    
    return NO;
    
    return [self deviceType] == 1;
}

@end
