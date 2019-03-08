//
//  ViewController.m
//  JailbreakDetection_Objective-C
//
//  Created by KUSAMA YOSHIKI on 2019/03/08.
//  Copyright © 2019 yotti. All rights reserved.
//

#import "ViewController.h"
#import "isJB.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detect_label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)Verify_Button:(UIButton *)sender {
    if([isJB isJailbreak] == true){
        _detect_label.text = @"this is jailbreak";
    }else{
        _detect_label.text = @"this is no jailbreak";
    }
}


@end
