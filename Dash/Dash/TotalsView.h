//
//  TotalsView.h
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TotalsView : UIView
@property (nonatomic) NSInteger totalDataType;
@property (nonatomic) NSInteger timeDenomination;
-(void)setIconImage:(UIImage *)image;
-(void)setDigitLabelText:(NSString *)text;
-(void)setTotalLabelText:(NSString *)text;
-(void)setChangeLabelText:(NSString *)text;
-(void)setChangeDigitLabelText:(NSString *)text;
@end
