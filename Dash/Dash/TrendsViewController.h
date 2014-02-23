//
//  TrendsViewController.h
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphContainerView.h"
#import "TotalsView.h"

@interface TrendsViewController : UIViewController
@property (weak, nonatomic) IBOutlet TotalsView *totalsView;
@property (weak, nonatomic) IBOutlet GraphContainerView *graphView;
@end
