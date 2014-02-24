//
//  GraphContainerView.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "GraphContainerView.h"
#import "GeometryConstants.h"

@implementation GraphContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)awakeFromNib{
    [self setup];
}


-(void)setup{
    [self addSubview:self.barChartView];
    [self.barChartView setFrame:self.frame];
    [self.barChartView setBounds:self.frame];  // Shouldn't need, but breaks otherwise
}

-(JBBarChartView *)barChartView{
    if (!_barChartView) {
        // TODO -- add subviews for axes, reduce frame size to account
        _barChartView = [[JBBarChartView alloc]initWithFrame:CGRectZero];
    }
    return _barChartView;
}

-(void)reloadData{
    [self.barChartView setFrame:[self calculateGraphFrame]];
    [self.barChartView reloadData];
}

-(CGRect)calculateGraphFrame{
//    TODO -- getting inconsistent placement, better to use autolayout
    CGRect newFrame = self.frame;
    newFrame.origin.x += BAR_CHART_H_INSET;
    newFrame.size.width -= 2 * BAR_CHART_H_INSET;
    newFrame.origin.y += BAR_CHART_V_INSET;
    newFrame.size.height -= 2 * BAR_CHART_V_INSET;
    return newFrame;
}

-(void)setDelegate:(id<JBBarChartViewDelegate>)delegate{
    _delegate = delegate;
    self.barChartView.delegate = delegate;
}

-(void)setDataSource:(id<JBBarChartViewDataSource>)dataSource{
    _dataSource = dataSource;
    self.barChartView.dataSource = dataSource;
}

@end
