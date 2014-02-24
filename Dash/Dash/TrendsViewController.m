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
#import "Typedefs.h"
#import "FontConstants.h"
#import "FakeDataConstants.h"

@interface TrendsViewController ()
@property(strong, nonatomic) NSArray *data;
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
    [self.graphView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [self updateTotalsView];
}

- (IBAction)trendControlChanged:(id)sender {
    [self updateTotalsView];
}

- (IBAction)timeControlChanged:(id)sender {
    [self updateTotalsView];
}


// TODO -- break totalsview updating out into separate delegate
-(void)updateTotalsView{
    [self.totalsView setIconImage:[UIImage imageNamed:[self imageNameForDataType:[self.trendControl selectedSegmentIndex]]]];
    [self.totalsView setTotalLabelText:[self totalLabelTextForDataType:[self.trendControl selectedSegmentIndex] andTimeDenomination:[self.timeControl selectedSegmentIndex]]];
    [self.totalsView setDigitLabelText:[self calculateTotalForDataType:[self.trendControl selectedSegmentIndex]andTimeDenomination:[self.timeControl selectedSegmentIndex]]];
    [self.totalsView setChangeLabelText:[self changeLabelTextForDataType:[self.trendControl selectedSegmentIndex] andTimeDenomination:[self.timeControl selectedSegmentIndex]]];
    [self.totalsView setChangeDigitLabelText:[self calculateChangeForDataType:[self.trendControl selectedSegmentIndex] andTimeDenomination:[self.timeControl selectedSegmentIndex]]];
}

-(NSString *)calculateTotalForDataType:(NSInteger)dataType andTimeDenomination:(NSInteger)td{
    // TODO -- calculate with actual data
    return @"$123";
}

-(NSString *)changeLabelTextForDataType:(NSInteger)dataType andTimeDenomination:(NSInteger)td{
    // TODO -- possibly modify wrt different types of data
    return [NSString stringWithFormat:@"Change since last %@", [self stringForTD:td]];
}

-(NSString *)calculateChangeForDataType:(NSInteger)dataType andTimeDenomination:(NSInteger)td{
    // TODO -- calculate with actual data
    return [NSString stringWithFormat:@"%C$42", DOWN_ARROW_GLYPH];
}

-(NSString *)stringForTD:(NSInteger)timeDenomination{
    switch (timeDenomination) {
        case TimeDenominationMonth:
            return @"month";
            break;
        case TimeDenominationWeek:
            return @"week";
            break;
        case TimeDenominationYear:
            return @"year";
            break;
        default:
            break;
    }
    return nil;
}

-(NSString *)totalLabelTextForDataType:(NSInteger)dataType andTimeDenomination:(NSInteger)timeDenomination{
    switch (dataType) {
        case DataTypeScore:
            return [NSString stringWithFormat:@"Total score this %@", [self stringForTD:timeDenomination]];
            break;
        case DataTypeDistance:
            return [NSString stringWithFormat:@"Total distance this %@", [self stringForTD:timeDenomination]];
            break;
        case DataTypeFuel:
            return [NSString stringWithFormat:@"Total amount spent this %@", [self stringForTD:timeDenomination]];
        case DataTypeEfficiency:
            return [NSString stringWithFormat:@"Total fuel efficiency this %@", [self stringForTD:timeDenomination]];
        default:
            break;
    }
    return nil;
}

-(NSString *)imageNameForDataType:(NSInteger)dataType{
    // TODO -- Add other images
    switch (dataType) {
        case DataTypeScore:
            return @"GasCan";
            break;
        case DataTypeDistance:
            return @"GasCan";
            break;
        case DataTypeEfficiency:
            return @"GasCan";
            break;
        case DataTypeFuel:
            return @"GasCan";
            break;
        default:
            break;
    }
    return nil;
}


#pragma JBBarChartViewDelegate

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSInteger)index{
    return [self.data[index] floatValue];
}

#pragma JBBarChartViewDataSource

- (NSInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView{
    return [self.data count];
}


- (UIView *)barViewForBarChartView:(JBBarChartView *)barChartView atIndex:(NSInteger)index{
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [barView setBackgroundColor:NAVIGATION_BAR_COLOR];
    return barView;
}


#pragma instantiation

-(NSArray *)data{
    // TODO -- add real data

    if (!_data) {
        NSMutableArray *mutableData = [[NSMutableArray alloc]init];
        for (int i = 0; i < FAKE_DATA_LENGTH; i++) {
            [mutableData addObject:@(arc4random() % FAKE_DATA_CEILING)];
        }
        _data = [[NSArray alloc]initWithArray:mutableData];
    }
    return _data;
}


@end
