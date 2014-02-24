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

-(void)viewDidLayoutSubviews{
    [self drawDivider];
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

-(NSString *)totalLabelTextForDataType:(NSInteger)dataType{
    switch (dataType) {
        case DataTypeScore:
            return [NSString stringWithFormat:@"Total score this %@", [self stringForTD:self.timeDenomination]];
            break;
        case DataTypeDistance:
            return [NSString stringWithFormat:@"Total distance this %@", [self stringForTD:self.timeDenomination]];
            break;
        case DataTypeFuel:
            return [NSString stringWithFormat:@"Total amount spent this %@", [self stringForTD:self.timeDenomination]];
        case DataTypeEfficiency:
            return [NSString stringWithFormat:@"Total fuel efficiency this %@", [self stringForTD:self.timeDenomination]];
        default:
            break;
    }
    return nil;
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

-(void)updateIconImage{
    self.iconView.image = [UIImage imageNamed:[self imageNameForDataType:self.totalDataType]];
}

-(void)drawDivider{
    NSLog(@"inside dd");
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO, self.frame.size.height)];
    [BODY_TEXT_COLOR setStroke];
    [path stroke];
}

-(UIImageView *)iconView{
    if (!_iconView) {
        NSString *iconImageName = [self imageNameForDataType:self.totalDataType];
        UIImage *iconImage = [UIImage imageNamed:iconImageName];
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(ICON_IMAGE_H_INSET, self.frame.size.height / 2.0 - iconImage.size.height / 2.0, iconImage.size.width, iconImage.size.height)];
        _iconView.image = iconImage;
    }
    return _iconView;
}

-(UILabel*)totalLabel{
    if (!_totalLabel) {
        NSMutableAttributedString *mutableLabelString = [[NSMutableAttributedString alloc]initWithString:[self totalLabelTextForDataType:self.totalDataType]];
        [mutableLabelString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:BODY_TEXT_SIZE] range:NSMakeRange(0, [[mutableLabelString string]length])];
        [mutableLabelString addAttribute:NSForegroundColorAttributeName value:BODY_TEXT_COLOR range:NSMakeRange(0, [[mutableLabelString string]length])];
        _totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(TOTALS_VIEW_LABEL_H_INSET, BODY_TEXT_SIZE + TOTALS_VIEW_LABEL_V_INSET, self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO, BODY_TEXT_SIZE)];
        _totalLabel.attributedText = [[NSAttributedString alloc]initWithAttributedString:mutableLabelString];
    }
    return _totalLabel;
}

-(NSString *)calculateGrandTotal{
    // TODO -- calculate total for self.data given datatype and timedenomination
    return @"$123";
}

-(UILabel *)digitLabel{
    if (!_digitLabel) {
        NSMutableAttributedString *mutableDigit = [[NSMutableAttributedString alloc]initWithString:[self calculateGrandTotal]];
        [mutableDigit addAttribute:NSForegroundColorAttributeName value:LARGE_DIGIT_LABEL_GREY range:NSMakeRange(0, [[mutableDigit string]length])];
        [mutableDigit addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:40] range:NSMakeRange(0, [[mutableDigit string]length])];
        _digitLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.iconView.frame.origin.x + self.iconView.frame.size.width, self.frame.size.height / 2.0 - self.iconView.frame.size.height / 2.0, self.frame.size.width * TOTALS_VIEW_DIVIDER_RATIO - self.iconView.frame.size.width - ICON_IMAGE_H_INSET, self.iconView.frame.size.height)];
        _digitLabel.attributedText = [[NSAttributedString alloc]initWithAttributedString:mutableDigit];

    }
    return _digitLabel;
}


@end
