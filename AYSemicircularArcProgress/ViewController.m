//
//  ViewController.m
//  AYSemicircularArcProgress
//
//  Created by alpha yu on 2019/3/13.
//  Copyright © 2019 tlm group. All rights reserved.
//

#import "ViewController.h"
#import "AYSemicircularArcProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet AYSemicircularArcProgressView *progressView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _progressView.arcColor = [UIColor redColor];
}

- (IBAction)valueChanged:(UISlider *)sender {
    self.progressView.progress = sender.value;
}

@end
