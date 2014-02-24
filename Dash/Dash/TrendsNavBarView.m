//
//  TrendsNavBarView.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "TrendsNavBarView.h"
#import "FontConstants.h"
#import "ColorConstants.h"


@implementation TrendsNavBarView

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
    [self addSubview:self.head];
    [self addSubview:self.subhead];
}

-(UILabel *)head{
    if (!_head) {
        _head = [[UILabel alloc]initWithFrame:CGRectMake(-NAV_ITEM_VIEW_WIDTH/2.0, - NAV_BAR_HEIGHT / 2.0, NAV_ITEM_VIEW_WIDTH, NAV_BAR_HEIGHT / 2.0)];
        
        NSMutableAttributedString *mutableHead = [[NSMutableAttributedString alloc]initWithString: @"DRIVING TRENDS"];
        
        [mutableHead addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [[mutableHead string]length])];
        [mutableHead addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:NAV_BAR_HEAD_SIZE] range:[[mutableHead string]rangeOfString:@"DRIVING"]];
        [mutableHead addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:NAV_BAR_HEAD_SIZE] range:[[mutableHead string]rangeOfString:@"TRENDS"]];
        
        _head.attributedText = [[NSAttributedString alloc]initWithAttributedString:mutableHead];
        [_head setTextAlignment:NSTextAlignmentCenter];
    }
    return _head;
}

-(UILabel *)subhead{
    if (!_subhead) {
        _subhead = [[UILabel alloc]initWithFrame:CGRectMake(-NAV_ITEM_VIEW_WIDTH / 2.0, - NAV_BAR_HEIGHT / 2.0 + NAV_BAR_HEAD_SIZE + NAV_BAR_PADDING, NAV_ITEM_VIEW_WIDTH, NAV_BAR_HEIGHT / 2.0)];
        NSMutableAttributedString *mutableSubhead = [[NSMutableAttributedString alloc]initWithString:@"TIME BASED VIEW"];
        [mutableSubhead addAttribute:NSForegroundColorAttributeName value:SUBHEAD_LIGHT_BLUE range:NSMakeRange(0, [[mutableSubhead string]length])];
        [mutableSubhead addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:NAV_BAR_SUBHEAD_SIZE] range:NSMakeRange(0,[[mutableSubhead string]length])];
        _subhead.attributedText = [[NSAttributedString alloc]initWithAttributedString:mutableSubhead];
        [_subhead setTextAlignment:NSTextAlignmentCenter];
    }
    return _subhead;
}


@end
