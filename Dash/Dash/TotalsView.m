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
@property (strong, nonatomic) UILabel *changeDigitLabel;
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
    [self addSubview:self.changeLabel];
    [self addSubview:self.changeDigitLabel];
}


-(void)drawRect:(CGRect)rect{
//    Draw divider
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:DIVIDER_STROKE_WIDTH];
    [path moveToPoint:CGPointMake(rect.size.width * TOTALS_VIEW_DIVIDER_RATIO, rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width * TOTALS_VIEW_DIVIDER_RATIO, 0)];
    [BODY_TEXT_COLOR setStroke];
    [path stroke];
}

-(void)alignBottomsOfLabels{
    CGRect changedFrame = self.changeDigitLabel.frame;
    changedFrame.origin.y = ceilf(self.digitLabel.frame.origin.y + (self.digitLabel.font.ascender - self.changeDigitLabel.font.ascender));
    self.changeDigitLabel.frame = changedFrame;
}

#pragma instantiation

-(UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(ICON_IMAGE_H_INSET, self.frame.size.height / 2.0 - ICON_IMAGE_HEIGHT / 2.0, ICON_IMAGE_WIDTH, ICON_IMAGE_HEIGHT)];
    }
    return _iconView;
}

-(UILabel*)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(TOTALS_VIEW_LABEL_H_INSET, BODY_TEXT_SIZE + TOTALS_VIEW_LABEL_V_INSET, self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO, BODY_TEXT_SIZE)];
    }
    return _totalLabel;
}

-(UILabel *)digitLabel{
    if (!_digitLabel) {
        _digitLabel = [[UILabel alloc]initWithFrame:CGRectMake(
                       self.iconView.frame.origin.x + self.iconView.frame.size.width,
                       (self.frame.size.height - self.iconView.frame.size.height + DIGIT_LABEL_TEXT_SIZE / 2.0) / 2.0,
                       self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO - self.iconView.frame.size.width - ICON_IMAGE_H_INSET,
                       self.iconView.frame.size.height)];
    }
    return _digitLabel;
}

-(UILabel *)changeDigitLabel{
    if (!_changeDigitLabel) {
        _changeDigitLabel = [[UILabel alloc]initWithFrame:CGRectMake(
                             self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO + CHANGE_LABEL_H_INSET,
                             self.frame.size.height / 2.0 - self.iconView.frame.size.height / 2.0 + (DIGIT_LABEL_TEXT_SIZE - CHANGE_DIGIT_LABEL_TEXT_SIZE),
                             self.frame.size.width * (1 - TOTALS_VIEW_DIVIDER_RATIO),
                             CHANGE_DIGIT_LABEL_TEXT_SIZE)];
    }
    return _changeDigitLabel;
}

-(UILabel *)changeLabel{
    if (!_changeLabel) {
        _changeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO + CHANGE_LABEL_H_INSET, BODY_TEXT_SIZE + TOTALS_VIEW_LABEL_V_INSET, self.frame.size.width * (1 - TOTALS_VIEW_DIVIDER_RATIO), BODY_TEXT_SIZE)];
    }
    return _changeLabel;
}


#pragma public

-(void)setIconImage:(UIImage *)image{
    self.iconView.image = image;
}

-(void)setTotalLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:BODY_TEXT_SIZE],NSForegroundColorAttributeName:BODY_TEXT_COLOR};
     NSAttributedString *total = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.totalLabel.attributedText = total;
}


-(void)setDigitLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSForegroundColorAttributeName:LARGE_DIGIT_LABEL_GREY,
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:DIGIT_LABEL_TEXT_SIZE]};
    
    NSAttributedString *digit = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.digitLabel.attributedText = digit;
    [self.digitLabel sizeToFit];
    [self alignBottomsOfLabels];
    
}

-(void)setChangeDigitLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSForegroundColorAttributeName:LARGE_CHANGE_DIGIT_LABEL_GREEN,
                                 NSFontAttributeName:[UIFont systemFontOfSize:CHANGE_DIGIT_LABEL_TEXT_SIZE]};
    NSAttributedString *changeDigit = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.changeDigitLabel.attributedText = changeDigit;
    [self.changeDigitLabel sizeToFit];
    [self alignBottomsOfLabels];
}

-(void)setChangeLabelText:(NSString *)text{
    NSDictionary *attributes = @{NSForegroundColorAttributeName:BODY_TEXT_COLOR,
                                 NSFontAttributeName:[UIFont systemFontOfSize:BODY_TEXT_SIZE]};
    NSAttributedString *change = [[NSAttributedString alloc]initWithString:text attributes:attributes];
    self.changeLabel.attributedText = change;
}



@end
