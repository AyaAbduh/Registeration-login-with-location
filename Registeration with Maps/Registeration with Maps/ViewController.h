//
//  ViewController.h
//  Registeration with Maps
//
//  Created by Esraa Hassan on 4/26/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>
@property CLLocationManager * locationManager;

@property NSString * myName;
@property NSString * myPhone;
@property NSString * myAge;

@end

