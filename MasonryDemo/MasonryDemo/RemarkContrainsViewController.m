//
//  RemarkContrainsViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/13.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "RemarkContrainsViewController.h"
#import <Masonry/Masonry.h>
@interface RemarkContrainsViewController ()
@property (nonatomic, strong) NSButton *movingButton;
@property (nonatomic, assign) BOOL topLeft;
@end

@implementation RemarkContrainsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movingButton = [NSButton buttonWithTitle:@"Grow Me!" target:self action:@selector(didTapGrowButton:)];
    [self.movingButton setButtonType:NSButtonTypeOnOff];
    [self.movingButton setBezelStyle:NSBezelStyleRegularSquare];
    self.movingButton.frame = CGRectZero;
    self.movingButton.wantsLayer = YES;
    self.movingButton.layer.borderColor = NSColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    [self.view addSubview:self.movingButton];
    self.topLeft = YES;
}

- (void)updateViewConstraints {
    
    [self.movingButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        
        if (self.topLeft) {
            make.left.equalTo(self.view.mas_left).with.offset(10);
            make.top.equalTo(self.view.mas_top).with.offset(10);
        }
        else {
            make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
            make.right.equalTo(self.view.mas_right).with.offset(-10);
        }
    }];
    
    //according to apple super should be called at end of method
    [super updateViewConstraints];
}

- (void)didTapGrowButton:(NSButton *)button {
    self.topLeft = !self.topLeft;
    // tell constraints they need updating
    [self.view setNeedsUpdateConstraints:YES];
    
    // update constraints now so we can animate the change
    [self.view updateConstraintsForSubtreeIfNeeded];
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 1;
        [self.view layoutSubtreeIfNeeded];
    } completionHandler:^{
        
    }];
    
    
    
}
@end
