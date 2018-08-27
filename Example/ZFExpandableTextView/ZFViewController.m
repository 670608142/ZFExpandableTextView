//
//  ZFViewController.m
//  ZFExpandableTextView
//
//  Created by 670608142 on 08/27/2018.
//  Copyright (c) 2018 670608142. All rights reserved.
//

#import "ZFViewController.h"
#import "ZFExpandableTextView.h"

@interface ZFViewController ()

@end

@implementation ZFViewController

- (void)viewDidLoad
{
    ZFExpandableTextView * test = [[ZFExpandableTextView alloc]initWithFrame:CGRectMake(100, 200, 200, 43)];
    [test setFontSize:14.0];
    [test setMaxNumberOfLines:4];
    //[test setIsExpandable:NO];
    [self.view addSubview:test];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
