//
//  PriorityViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/14.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "PriorityViewController.h"
#import <Masonry/Masonry.h>
@interface PriorityViewController ()
@property (weak) IBOutlet NSView *containerView;
@property (weak) IBOutlet NSTextField *logLabel;
@property (nonatomic, strong) NSTextField *tipLabel;

@property (nonatomic, strong) MASConstraint *leftConstraint;
@property (nonatomic, strong) MASConstraint *topConstraint;

@end

@implementation PriorityViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containerView.wantsLayer = YES;
    self.containerView.layer.masksToBounds = YES;
    self.containerView.layer.borderColor = [NSColor redColor].CGColor;
    self.containerView.layer.borderWidth = 4;
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(10);
        make.width.equalTo(@380);
        make.height.equalTo(@200);
        
    }];

    
    self.tipLabel.stringValue = @"macOS \niOS自动布局";
    [self.tipLabel setRefusesFirstResponder:YES];
    [self.tipLabel setFocusRingType:NSFocusRingTypeNone];
    
    [self.containerView addSubview:self.tipLabel];
    [self.tipLabel sizeToFit];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置边界条件约束，保证内容可见，优先级1000
        make.left.greaterThanOrEqualTo(_containerView.mas_left);
        make.right.lessThanOrEqualTo(_containerView.mas_right);
        make.top.greaterThanOrEqualTo(_containerView.mas_top);
        make.bottom.lessThanOrEqualTo(_containerView.mas_bottom);
        
        _leftConstraint = make.centerX.equalTo(_containerView.mas_left).with.offset(50).priorityHigh(); // 优先级要比边界条件低
        _topConstraint = make.centerY.equalTo(_containerView.mas_bottom).with.offset(50).priorityHigh(); // 优先级要比边界条件低
        make.width.mas_equalTo(CGRectGetWidth(_tipLabel.frame) + 8);
        make.height.mas_equalTo(CGRectGetHeight(_tipLabel.frame) + 4);
    }];
    
    NSPanGestureRecognizer *pan = [[NSPanGestureRecognizer alloc] initWithTarget:self action:@selector(panWithGesture:)];
    [self.containerView addGestureRecognizer:pan];
    
    
}


- (void)panWithGesture:(NSPanGestureRecognizer *)pan {
    CGPoint touchPoint = [pan locationInView:_containerView];
    _logLabel.stringValue = NSStringFromPoint(touchPoint);//NSStringFromCGPoint(touchPoint);
    
    _leftConstraint.offset = touchPoint.x;
    _topConstraint.offset = -touchPoint.y;
//    [self.containerView setNeedsDisplay:YES]
}

#pragma mark - Getter
- (NSTextField *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [NSTextField new];
        _tipLabel.wantsLayer = YES;
        _tipLabel.textColor = [NSColor whiteColor];
        _tipLabel.font = [NSFont systemFontOfSize:20];
        _tipLabel.maximumNumberOfLines = 2;
        _tipLabel.alignment = NSTextAlignmentCenter;
        _tipLabel.backgroundColor = [NSColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1];
        _tipLabel.layer.borderColor = [NSColor blackColor].CGColor;
        _tipLabel.layer.borderWidth = 1.0f;
        _tipLabel.layer.masksToBounds = YES;
        _tipLabel.layer.cornerRadius = 2.0f;
    }
    return _tipLabel;
}

@end
