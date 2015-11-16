//
//  CustomService.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "CustomService.h"

@interface CustomService()

@property (nonatomic, readonly) AFHTTPRequestOperationManager *manager;


@end

@implementation CustomService{
    __strong MTServiceCallback _callback;
}

- (AFHTTPRequestOperationManager *)manager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 60;//(timeoutReport>0)?timeoutReport:60;
    manager.operationQueue.maxConcurrentOperationCount=1;
    return manager;
}

- (CustomService *)initWithCallback:(MTServiceCallback)callback;
{
    if (self = [super init])
    {
        _callback = [callback copy];
    }
    return self;
}

-(void)login_account:(NSString *)account
            password:(NSString *)pwd
             timeout:(NSString *)timeout
            Language:(NSString *)Language
               token:(NSString *)token
          deviceType:(NSString *)deviceType{
    
    NSDictionary *parameters = @{@"Name":ValidateStringNil(account), @"Password":ValidateStringNil(pwd)};
    //, @"LOGINTIMEOUT":ValidateStringNil(timeout),@"Language":ValidateStringNil(Language), @"token":ValidateStringNil(token), @"deviceType":ValidateStringNil(deviceType), @"version":VERSIONAPP};

    NSString *url = [NSString stringWithFormat:BASEURL, @"/login"];
    
    [self.manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _callback(self, responseObject, nil);
        
    }
               failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
         _callback(self, nil, error);
         [self showAlert:error.localizedDescription];
         
     }];
    
}

static id ValidateStringNil(NSString * object) {
    return object == nil ? @"":object;
}

-(void)showAlert:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}


@end
