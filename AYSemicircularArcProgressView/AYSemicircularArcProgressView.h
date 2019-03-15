//
//  AYSemicircularArcProgressView.h
//  AYSemicircularArcProgress
//
//  Created by alpha yu on 2019/3/13.
//  Copyright © 2019 tlm group. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSemicircularArcProgressView : UIView

@property (nonatomic, assign) CGFloat progress; // 0 ~ 1

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat arcWidth; //default 10
@property (nonatomic, strong, nullable) UIColor *progressColor; //default nil, and use gradient color
@property (nonatomic, strong) UIColor *gradientStartColor;  //default rgb : 0, 201, 255
@property (nonatomic, strong) UIColor *gradientEndColor;    //default rgb : 146, 254, 157
@property (nonatomic, strong, nullable) UIColor *trackColor;    //default nil

@end

NS_ASSUME_NONNULL_END
