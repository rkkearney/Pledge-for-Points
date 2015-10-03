//
//  PointsViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/3/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "PointsViewController.h"

@interface PointsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *conversionLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *spendLabel;


@end

@implementation PointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.conversionLabel sizeToFit];
    self.conversionLabel.text = @"25 miles = 1 point";
    [self.totalLabel sizeToFit];
    self.totalLabel.text = @"Your total points:";
    [self.pointsLabel sizeToFit];
    self.pointsLabel.text = @"0";
    [self.spendLabel sizeToFit];
    self.spendLabel.text = @"Want to spend?";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
