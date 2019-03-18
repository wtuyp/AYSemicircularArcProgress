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
@property (nonatomic, strong) CAShapeLayer *trackLayer;

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
    self.arcWidth = 10.0;
    
    self.gradientStartColor = [UIColor colorWithRed:0 / 255.0 green:201.0 / 255.0 blue:255.0 / 255.0 alpha:1];
    self.gradientEndColor = [UIColor colorWithRed:146.0 / 255.0 green:254.0 / 255.0 blue:157.0 / 255.0 alpha:1.0];
}

- (void)layoutSubviews {
    [self loadSublayers];
}


- (void)loadSublayers
{
    if (!_trackLayer) {
        _trackLayer = [CAShapeLayer layer];
        _trackLayer.fillColor = [UIColor clearColor].CGColor;
        _trackLayer.lineCap = kCALineCapRound;
        [self.layer addSublayer:_trackLayer];
    }
    _trackLayer.lineWidth = self.arcWidth;
    _trackLayer.strokeColor = _trackColor.CGColor;
    _trackLayer.frame = self.bounds;
    
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.startPoint = CGPointMake(0, 0.5);
        _gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:_gradientLayer];
    }
    _gradientLayer.frame = self.bounds;
    
    if (_progressColor) {
        _gradientLayer.colors = @[(id)self.progressColor.CGColor, (id)self.progressColor.CGColor];
    } else {
        _gradientLayer.colors = @[(id)self.gradientStartColor.CGColor, (id)self.gradientEndColor.CGColor];
    }
    
    if (!_progressLayer) {
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.fillColor = [UIColor clearColor].CGColor;
        _progressLayer.strokeColor = [UIColor whiteColor].CGColor;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.strokeEnd = 0.0;
    }
    _progressLayer.frame = self.bounds;
    _progressLayer.lineWidth = self.arcWidth;
    
    CGFloat radius = self.radius;
    if (radius > self.frame.size.width / 2.0 || radius == 0.0) {
        radius = self.frame.size.width / 2.0 - self.arcWidth / 2.0;
    }
    
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height - self.arcWidth / 2.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius
                                                    startAngle:M_PI endAngle:M_PI + M_PI clockwise:YES];
    
    _trackLayer.path = path.CGPath;
    _progressLayer.path = path.CGPath;
    
    _gradientLayer.mask = _progressLayer;
}


@end
