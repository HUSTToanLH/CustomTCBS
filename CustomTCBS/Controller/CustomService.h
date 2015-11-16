//
//  CustomService.h
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomService : NSObject

typedef void (^MTServiceCallback)(CustomService *service, id response, NSError *error);

- (CustomService *)initWithCallback:(MTServiceCallback)callback;

- (void)login_account:(NSString *)account
             password:(NSString *)pwd
              timeout:(NSString *)timeout
             Language:(NSString*)Language
                token:(NSString*)token
           deviceType:(NSString*)deviceType;



@end
