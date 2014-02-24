//
//  TotalsView.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "TotalsView.h"
#import "Typedefs.h"
#import "GeometryConstants.h"
#import "FontConstants.h"
#import "ColorConstants.h"

@interface TotalsView ()
@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UILabel *totalLabel;
@property (strong, nonatomic) UILabel *digitLabel;
@property (strong, nonatomic) UILabel *changeLabel;
@end

@implementation TotalsView

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
    [self addSubview:self.iconView];
    [self addSubview:self.totalLabel];
    [self addSubview:self.digitLabel];
}


-(void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:DIVIDER_STROKE_WIDTH];
    [path moveToPoint:CGPointMake(rect.size.width * TOTALS_VIEW_DIVIDER_RATIO, rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width * TOTALS_VIEW_DIVIDER_RATIO, 0)];
    [BODY_TEXT_COLOR setStroke];
    [path stroke];
}

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(ICON_IMAGE_H_INSET, self.frame.size.height / 2.0 - ICON_IMAGE_HEIGHT / 2.0, ICON_IMAGE_WIDTH, ICON_IMAGE_HEIGHT)];
    }
    return _iconView;
}

-(void)setIconImage:(UIImage *)image{
    self.iconView.image = image;
    NSLog(@"iconview frame: %@", NSStringFromCGRect(self.iconView.frame));
}

-(UILabel*)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(TOTALS_VIEW_LABEL_H_INSET, BODY_TEXT_SIZE + TOTALS_VIEW_LABEL_V_INSET, self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO, BODY_TEXT_SIZE)];
    }
    return _totalLabel;
}

-(void)setTotalLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:BODY_TEXT_SIZE],NSForegroundColorAttributeName:BODY_TEXT_COLOR};
     NSAttributedString *total = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.totalLabel.attributedText = total;
}

-(UILabel *)digitLabel{
    if (!_digitLabel) {
        _digitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.iconView.frame.origin.x + self.iconView.frame.size.width, self.frame.size.height / 2.0 - self.iconView.frame.size.height / 2.0, self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO - self.iconView.frame.size.width - ICON_IMAGE_H_INSET, self.iconView.frame.size.height)];
    }
    return _digitLabel;
}

-(void)setDigitLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSForegroundColorAttributeName:LARGE_DIGIT_LABEL_GREY, NSFontAttributeName:[UIFont boldSystemFontOfSize:40]};
    NSAttributedString *digit = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.digitLabel.attributedText = digit;
    
}
//
//-(UILabel *)changeLabel{
//    if (!_changeLabel) {
//        _changeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO + CHANGE_LABEL_H_INSET, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
//    }
//}


@end
