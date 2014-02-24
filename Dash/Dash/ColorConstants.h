//
//  ColorConstants.h
//  Dash
//
//  Created by Blagdon Jeffrey on 2/23/14.
//  Copyright (c) 2014 Jeffrey Blagdon. All rights reserved.
//

#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#define BODY_TEXT_COLOR UIColorFromHex(0xA2A7AC)
#define NAVIGATION_BAR_COLOR UIColorFromHex(0x3C83C3)
#define BUTTON_BAR_COLOR UIColorFromHex(0xF4F4F4)
#define SUBHEAD_LIGHT_BLUE UIColorFromHex(0x7ECEFD)
#define LARGE_DIGIT_LABEL_GREY UIColorFromHex(0x3F444B)
#define LARGE_CHANGE_DIGIT_LABEL_GREEN UIColorFromHex(0xA6D241)
