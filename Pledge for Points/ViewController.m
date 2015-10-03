//
//  ViewController.m
//  Pledge for Points
//
//  Created by Reilly Kearney on 10/2/15.
//  Copyright © 2015 Reilly Kearney. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
- (IBAction)drivingSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *pledgeLabel;
@property (assign, nonatomic, nullable) id< CLLocationManagerDelegate > delegate;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

double distance = 0.0;
CLLocation* oldlocation;

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
    
    if ([CLLocationManager significantLocationChangeMonitoringAvailable]) {
        [self startSignificantChangeUpdates];
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
    
}

- (double) meterstomiles: (double) meters {
    double mileconvert = 0.000621371192;
    return meters * mileconvert;
}


- (IBAction)drivingSwitch:(id)sender {
}
@end














