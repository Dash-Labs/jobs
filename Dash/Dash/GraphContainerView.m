//
//  GraphContainerView.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "GraphContainerView.h"

@implementation GraphContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

-(void)awakeFromNib{
    [self setupSubviews];
}

-(void)setupSubviews{
    [self addSubview:self.barChartView];
    self.barChartView.dataSource = self.dataSource;
    self.barChartView.delegate = self.delegate;
}

-(JBBarChartView *)barChartView{
    if (!_barChartView) {
        // TODO -- add subviews for axes, reduce frame size to account
        _barChartView = [[JBBarChartView alloc]initWithFrame:self.frame];
    }
    return _barChartView;
}

@end
