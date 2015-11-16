//
//  LoginVC.m
//  CustomTCBS
//
//  Created by TaiND on 11/16/15.
//  Copyright (c) 2015 Toan Lai. All rights reserved.
//

#import "LoginVC.h"
#import "MainVC.h"

@interface LoginVC ()
@property (strong, nonatomic) IBOutlet UITextField *txfUser;
@property (strong, nonatomic) IBOutlet UITextField *txfPassword;
@property (strong, nonatomic) IBOutlet CustomCheckButton *btnSave;
@property (strong, nonatomic) IBOutlet CustomTimeoutTextfield *txfTimeout;

@end

@implementation LoginVC{
    CustomService *_service;
    NSString *language;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    language = @"vi-VN";
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (IBAction)onClickLogin:(id)sender {
    _service = [[CustomService alloc] initWithCallback:^(CustomService *service, id response, NSError *error) {
        [self resultLogin:response andError:error];
    }];
    
    NSLog(@"user: %@", _txfUser.text);
    NSLog(@"password: %@", _txfPassword.text);
    
    [_service login_account:_txfUser.text password:_txfPassword.text timeout:_txfTimeout.text Language:language token:nil deviceType:@"IOS"];
}

-(void)resultLogin:(id)response andError:(NSError*)error{
    if (error == nil) {
        MainVC *menu = [[MainVC alloc] initWithNibName:@"MainVC" bundle:nil];
        UINavigationController *nav_menu = [[UINavigationController alloc] initWithRootViewController:menu];
        
        
        MTSideVC *mainSide = [[MTSideVC alloc] init];
        mainSide.shouldDelegateAutorotateToVisiblePanel = NO;
        mainSide.panningLimitedToTopViewController = NO;
        
        mainSide.leftPanel = self;
        mainSide.centerPanel = nav_menu;
        self.view.window.rootViewController = mainSide;
    }else{
        NSLog(@"Error");
    }
}

#pragma mark - handle button

- (IBAction)onClickForgotPassword:(id)sender {
}

- (IBAction)onClickHelp:(id)sender {
}

- (IBAction)onClickUSLangguage:(id)sender {
    language = @"US";
}

- (IBAction)onClickVNLanguage:(id)sender {
    language = @"vi-VN";
}
@end
