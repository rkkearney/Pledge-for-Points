//
//  ViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/2/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)drivingSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pledgeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)drivingSwitch:(id)sender {
}
@end
