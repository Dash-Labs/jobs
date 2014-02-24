//
//  GraphContainerView.h
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JBBarChartView.h>

@interface GraphContainerView : UIView
@property (strong, nonatomic)JBBarChartView *barChartView;
@property (strong, nonatomic)id<JBBarChartViewDataSource> dataSource;
@property (strong, nonatomic)id<JBBarChartViewDelegate> delegate;
-(void)reloadData;
@end
