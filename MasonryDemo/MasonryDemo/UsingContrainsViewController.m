//
//  UsingContrainsViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/13.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "UsingContrainsViewController.h"
#import <Masonry/Masonry.h>
@interface UsingContrainsViewController ()
@property (weak) IBOutlet NSView *purpleView;
@property (weak) IBOutlet NSView *orangeView;

@end

@implementation UsingContrainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.purpleView.layer.backgroundColor = NSColor.purpleColor.CGColor;
    self.purpleView.wantsLayer = YES;
    self.purpleView.layer.borderColor = NSColor.blackColor.CGColor;
    self.purpleView.layer.borderWidth = 2;
    
    self.orangeView.layer.backgroundColor = NSColor.orangeColor.CGColor;
    self.orangeView.wantsLayer = YES;
    self.orangeView.layer.borderColor = NSColor.blackColor.CGColor;
    self.orangeView.layer.borderWidth = 2;
    
    
    [self.purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@20);
        make.bottom.equalTo(@-20);
        make.right.equalTo(@-20);
    }];
    
    // auto-boxing macros allow you to simply use scalars and structs, they will be wrapped automatically
    
    [self.orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(0, 50));
        make.size.mas_equalTo(CGSizeMake(200, 100));
    }];
}

@end
