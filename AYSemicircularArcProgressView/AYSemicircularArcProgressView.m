//
//  AYSemicircularArcProgressView.m
//  AYSemicircularArcProgress
//
//  Created by alpha yu on 2019/3/13.
//  Copyright © 2019 tlm group. All rights reserved.
//

#import "AYSemicircularArcProgressView.h"

@interface AYSemicircularArcProgressView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *progressLayer;

@end

@implementation AYSemicircularArcProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    _progressLayer.strokeEnd = _progress;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultValues];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initDefaultValues];
    }
    return self;
}

- (void)initDefaultValues
{
    self.arcWith = 10.0;
    
    self.gradientStartColor = [UIColor colorWithRed:0 / 255.0 green:201.0 / 255.0 blue:255.0 / 255.0 alpha:1];
    self.gradientEndColor = [UIColor colorWithRed:146.0 / 255.0 green:254.0 / 255.0 blue:157.0 / 255.0 alpha:1.0];
}

- (void)layoutSubviews {
    [self loadSublayers];
}


- (void)loadSublayers
{
    [_gradientLayer removeFromSuperlayer];
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = self.bounds;
    _gradientLayer.startPoint = CGPointMake(0, 0.5);
    _gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    _gradientLayer.colors = @[(id)self.gradientStartColor.CGColor, (id)self.gradientEndColor.CGColor];
    [self.layer addSublayer:_gradientLayer];
    
    CGFloat radius = self.radius;
    if (radius > self.frame.size.width / 2.0 || radius == 0.0) {
        radius = self.frame.size.width / 2.0;
    }
    
    radius = radius - self.arcWith / 2.0;
    
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height - self.arcWith / 2.0);
    CGFloat startAngle = M_PI;
    CGFloat endAngle = startAngle + M_PI;
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor = [[UIColor whiteColor] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = self.arcWith;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    _progressLayer.path = path.CGPath;
    
    _progressLayer.strokeEnd = 0.0;
    _gradientLayer.mask = _progressLayer;
}


@end
