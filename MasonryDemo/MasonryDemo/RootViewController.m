//
//  RootViewController.m
//  MasonryDemo
//
//  Created by sunyazhou on 2016/10/12.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

#import "RootViewController.h"
#import "BasicViewController.h"
#import "UpdateContrainsViewController.h"
#import "RemarkContrainsViewController.h"
#import "UsingContrainsViewController.h"
#import "CompositeEdgesViewController.h"
#import "AspectFitViewController.h"
#import "PriorityViewController.h"
#import "TestVC.h"
@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)basicAction:(id)sender {
    BasicViewController * basic = [[BasicViewController alloc] initWithNibName:@"BasicViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:basic];
}

- (IBAction)updateContrainsAction:(id)sender {
    UpdateContrainsViewController *updateVC = [[UpdateContrainsViewController alloc] initWithNibName:@"UpdateContrainsViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:updateVC];
}

- (IBAction)remarkAction:(id)sender {
    RemarkContrainsViewController *remarkVC = [[RemarkContrainsViewController alloc] initWithNibName:@"RemarkContrainsViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:remarkVC];
}

- (IBAction)usingContrainsAction:(id)sender {
    UsingContrainsViewController *usingContrainsVC = [[UsingContrainsViewController alloc] initWithNibName:@"UsingContrainsViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:usingContrainsVC];
}
- (IBAction)compositeEdgeAction:(id)sender {
    CompositeEdgesViewController *comVC = [[CompositeEdgesViewController alloc] initWithNibName:@"CompositeEdgesViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:comVC];
}


- (IBAction)aspectfit:(id)sender {
    AspectFitViewController *aspectFitVC = [[AspectFitViewController alloc] initWithNibName:@"AspectFitViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:aspectFitVC];
}


- (IBAction)testAction:(id)sender {
    TestVC *vc = [[TestVC alloc] initWithNibName:@"TestVC" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:vc];
    
}
- (IBAction)priority:(id)sender {
    PriorityViewController *vc = [[PriorityViewController alloc] initWithNibName:@"PriorityViewController" bundle:[NSBundle mainBundle]];
    [self presentViewControllerAsModalWindow:vc];
}


@end
