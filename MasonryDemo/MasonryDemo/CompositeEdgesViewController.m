//
//  CompositeEdgesViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/13.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "CompositeEdgesViewController.h"
#import <Masonry/Masonry.h>
@interface CompositeEdgesViewController ()

@end

@implementation CompositeEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSView *lastView = self.view;
    for (int i = 0; i < 10; i++) {
        NSView *view = [[NSView alloc] initWithFrame:CGRectZero];
        view.wantsLayer = YES;
        view.layer.backgroundColor = [self randomColor].CGColor;
        view.layer.borderColor = NSColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(NSEdgeInsetsMake(5, 10, 15, 20));
        }];
        
        lastView = view;
    }
}

- (NSColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [NSColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
