//
//  PointsViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/3/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "PointsViewController.h"

@interface PointsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
- (IBAction)spendButton:(id)sender;
@end

@implementation PointsViewController

//double milestravelled;
int points;

- (void)viewDidLoad {
    [super viewDidLoad];
    // [super];
    // Do any additional setup after loading the view.
    points += self.miles;
    self.pointsLabel.text = [NSString stringWithFormat:@"%i", points];
    
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

- (IBAction)spendButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.plenti.com"]];
}


@end
