//
//  AspectFitViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/13.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "AspectFitViewController.h"
#import <Masonry/Masonry.h>
@interface AspectFitViewController ()
@property (weak) IBOutlet NSView *aspectView;

@end

@implementation AspectFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aspectView.wantsLayer = YES;
    
    self.aspectView.layer.backgroundColor = [self randomColor].CGColor;
    self.aspectView.layer.borderColor = NSColor.blackColor.CGColor;
    self.aspectView.layer.borderWidth = 2;
    
    [self.aspectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(NSEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (NSColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [NSColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
