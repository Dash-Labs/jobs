//
//  TrendsViewController.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "TrendsViewController.h"
#import "ColorConstants.h"
#import "TrendsNavBarView.h"
#import <JBBarChartView.h>

@interface TrendsViewController ()<JBBarChartViewDelegate, JBBarChartViewDataSource>
@property(strong, nonatomic) NSDictionary *data;
@property(strong, nonatomic) NSCalendar *calendar;
@end

@implementation TrendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:NAVIGATION_BAR_COLOR];
    TrendsNavBarView *navBarView = [[TrendsNavBarView alloc]init];
    [self.navigationItem setTitleView:navBarView];
    self.graphView.delegate = self;
    self.graphView.dataSource = self;
}
- (IBAction)trendControlChanged:(id)sender {
    [self updateTotalsViewWithSegmentIndex:[sender selectedSegmentIndex]];
}
- (IBAction)timeControlChanged:(id)sender {
    [self updateGraphViewWithSegmentIndex:[sender selectedSegmentIndex]];
}

-(void)updateTotalsViewWithSegmentIndex:(NSInteger)index{
    // TODO
}

-(void)updateGraphViewWithSegmentIndex:(NSInteger)index{
    // TODO
}

-(NSCalendar *)calendar{
    if (!_calendar) {
        _calendar = [[NSCalendar alloc]init];
    }
    return _calendar;
}

-(NSDictionary *)data{
    if (!_data) {
        NSMutableDictionary *temp = [[NSMutableDictionary alloc]init];
        for (int i = 0; i < 365; i++) {
            temp[@(i)] = @{@"score": @(arc4random() % 100), @"mpg": @(arc4random() % 100), @"fuel": @(arc4random() % 100), @"distance": @(arc4random() % 100)};
            _data = [NSDictionary dictionaryWithDictionary:temp];
        }
    }
   return _data;
}

#pragma JBBarChartViewDelegate

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSInteger)index{
    CGFloat barHeight = 10;
    return barHeight;
}

#pragma JBBarChartViewDataSource

- (NSInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView{
    return 10;
}

- (UIView *)barViewForBarChartView:(JBBarChartView *)barChartView atIndex:(NSInteger)index{
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [barView setBackgroundColor:NAVIGATION_BAR_COLOR];
    return barView;
}


@end
