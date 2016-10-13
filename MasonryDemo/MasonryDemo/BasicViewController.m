//
//  BasicViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/12.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "BasicViewController.h"
#import <Masonry/Masonry.h>
@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSView *greenView = NSView.new;
    greenView.wantsLayer = YES;
    greenView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    greenView.layer.borderColor = NSColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.view addSubview:greenView];
    
    NSView *redView = NSView.new;
    redView.wantsLayer = YES;
    redView.layer.backgroundColor = [NSColor redColor].CGColor;
    redView.layer.borderColor = NSColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.view addSubview:redView];
    
    NSView *blueView = NSView.new;
    blueView.wantsLayer = YES;
    blueView.layer.backgroundColor = [NSColor blueColor].CGColor;
    blueView.layer.borderColor = NSColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.view addSubview:blueView];
    
    NSView *superview = self.view;
    int padding = 10;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView.mas_width);
        
        make.height.equalTo(redView.mas_height);
        make.height.equalTo(blueView.mas_height);
    }];
    
    
    //with is semantic and option
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(padding); //with with
        make.left.equalTo(greenView.mas_right).offset(padding); //without with
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.width.equalTo(greenView.mas_width);
        
        make.height.equalTo(@[greenView, blueView]); //can pass array of views
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(superview.mas_left).offset(padding);
        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
        make.right.equalTo(superview.mas_right).offset(-padding);
        make.height.equalTo(@[greenView.mas_height, redView.mas_height]); //can pass array of attributes
    }];
    
    [self.view displayIfNeeded];
}

@end
