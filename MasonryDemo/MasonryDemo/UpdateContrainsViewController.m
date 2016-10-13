//
//  UpdateContrainsViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/12.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "UpdateContrainsViewController.h"
#import <Masonry/Masonry.h>

@interface UpdateContrainsViewController ()
@property (nonatomic, strong) NSButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;
@end

@implementation UpdateContrainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.growingButton = [NSButton buttonWithTitle:@"Grow Me!" target:self action:@selector(didTapGrowButton:)];
    [self.growingButton setButtonType:NSButtonTypeOnOff];
    [self.growingButton setBezelStyle:NSBezelStyleRegularSquare];
    self.growingButton.frame = CGRectZero;
    self.growingButton.wantsLayer = YES;
    self.growingButton.layer.borderColor = NSColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;
    [self.view addSubview:self.growingButton];
    
    self.buttonSize = CGSizeMake(100, 100);
}

- (void)updateViewConstraints {
    if (self.growingButton) {
        [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.equalTo(@(self.buttonSize.width)).priorityLow();
            make.height.equalTo(@(self.buttonSize.height)).priorityLow();
            make.width.lessThanOrEqualTo(self.view);
            make.height.lessThanOrEqualTo(self.view);
        }];
    }
    
    //according to apple super should be called at end of method
    [super updateViewConstraints];
}

- (void)didTapGrowButton:(NSButton *)button {
    self.buttonSize = CGSizeMake(self.buttonSize.width * 1.3, self.buttonSize.height * 1.3);
    
    // tell constraints they need updating
    [self.view setNeedsUpdateConstraints:YES];
    
    // update constraints now so we can animate the change
    [self.view updateConstraintsForSubtreeIfNeeded];
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.4];
    [self.view layoutSubtreeIfNeeded];
    
    [NSAnimationContext endGrouping];
    
}

@end
