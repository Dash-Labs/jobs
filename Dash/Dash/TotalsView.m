//
//  TotalsView.m
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import "TotalsView.h"
#import "Typedefs.h"

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
    NSString *iconImageName = [self imageNameForDataType:self.totalsDataType];
    UIImage *iconImage = [UIImage imageNamed:iconImageName];
    UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, iconImage.size.width, iconImage.size.height)];
    iconView.image = iconImage;
    [self addSubview:iconView];
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
        case DataTypeMPG:
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


@end
