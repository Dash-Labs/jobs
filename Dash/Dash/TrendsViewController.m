//
//  TrendsViewController.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "TrendsViewController.h"
#import "ColorConstants.h"

@interface TrendsViewController ()


@end

@implementation TrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:NAVIGATION_BAR_COLOR];
    NSLog(@"delcared nav bar color: %@", NAVIGATION_BAR_COLOR);
}



@end
