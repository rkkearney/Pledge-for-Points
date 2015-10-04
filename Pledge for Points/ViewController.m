//
//  ViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/2/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "PointsViewController.h"
@interface ViewController () <CLLocationManagerDelegate>

- (IBAction)drivingSwitch:(id)sender;
@property (assign, nonatomic, nullable) id< CLLocationManagerDelegate > delegate;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
- (IBAction)pledgeButton:(id)sender;

@end

@implementation ViewController

double distance = 0.0;
//double oldlocation = 0.0;
CLLocation* oldlocation;
//CLLocation* location = [CL];
double milestravelled;

- (IBAction)drivingSwitch:(id)sender {
    if ([self.switch1 isOn]) {
        
        if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
            [self startSignificantChangeUpdates];
        }
        //oldlocation = location;
    
    }
    else {
        
        if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
            [self stopSignificantChangeUpdates];
        }
        
        double mileconvert = 0.000621371192;
        milestravelled = (distance * mileconvert);
        NSLog(@"miles traveled: %+.6f", milestravelled);
        distance = 0.0;
        oldlocation = NULL;
        [self performSegueWithIdentifier:@"seguewaytopoints" sender:self];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (nil == self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    
    // [self startSignificantChangeUpdates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startSignificantChangeUpdates
{
    // Create the location manager if this object does not
    // already have one.
    
    [self.locationManager startMonitoringSignificantLocationChanges];
}

- (void)stopSignificantChangeUpdates
{
    [self.locationManager
     stopMonitoringSignificantLocationChanges];
    
}

// Delegate method from the CLLocationManagerDelegate protocol.
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    
    
    // NSLog(@"last location= %+.6d",lastlocation);
    if (oldlocation) {
        //CLLocation* location2 = [locations objectAtIndex:lastlocation];
        NSDate* eventDate = location.timestamp;
        NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
        if (fabs(howRecent) < 5.0) {
            distance = distance + fabs([location distanceFromLocation:(oldlocation)]);
            // If the event is recent, do something with it.
            NSLog(@"latitude %+.6f, longitude %+.6f, distance%+.6f\n",
                  location.coordinate.latitude,
                  location.coordinate.longitude,
                  distance);
        }
    }
    oldlocation = location;
    milestravelled =10;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"seguewaytopoints"]) {
        PointsViewController *myVC = [segue destinationViewController];
        myVC.miles = milestravelled;
    }
   
}



- (IBAction)pledgeButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.itcanwait.com/all"]];
}
@end














