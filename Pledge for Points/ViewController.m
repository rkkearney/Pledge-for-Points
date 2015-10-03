//
//  ViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/2/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)mybutton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *mybutton;
@property (weak, nonatomic) IBOutlet UITextField *textbox;


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

- (IBAction)mybutton:(id)sender {
    [self.label sizeToFit];
    self.label.text = self.textbox.text;
    
}
@end
