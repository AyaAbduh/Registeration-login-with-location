//
//  ViewController.m
//  Registeration with Maps
//
//  Created by Esraa Hassan on 4/26/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

#import "ViewController.h"
#import "PenAnnotation.h"
#import "SignInViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)gesture:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
- (IBAction)signup:(UIButton *)sender;
- (IBAction)signIN:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *alert;

@end

@implementation ViewController{
     NSUserDefaults * userDefaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _map.delegate=self;
    _locationManager=[CLLocationManager new];
    [_locationManager setDistanceFilter:kCLHeadingFilterNone];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDelegate:self];
    [_locationManager startUpdatingLocation];
    [_locationManager requestAlwaysAuthorization];
    userDefaults=[NSUserDefaults standardUserDefaults];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("Region will change\n");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    printf("region did change\n");
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation * location=[CLLocation new];
    //location.coordinate.longitude;
    printf("latitude: %f\n",location.coordinate.latitude);
    printf("longitude: %f\n",location.coordinate.longitude);
    printf("updated\n");
    
}

- (IBAction)gesture:(id)sender {
 
    CGPoint touchPoint=[sender locationInView:_map];
    
    CLLocationCoordinate2D Mycoordinate=[_map convertPoint:touchPoint toCoordinateFromView:self.map];
    
    PenAnnotation * Annotation=[PenAnnotation new];
    
    Annotation.coordinate=Mycoordinate;
    Annotation.title=@"current Location";
    Annotation.subtitle=@"ME";
    
    [_map addAnnotation:Annotation];

}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    printf("Annotation selected!\n");
    printf("%s\n",[view.annotation.title UTF8String]);
    
    NSNumber *Mylatitude = [NSNumber numberWithDouble:view.annotation.coordinate.latitude];
    _latitude.text=[Mylatitude stringValue];//convert from double to NSString
    
    NSNumber *Mylongitude=[NSNumber numberWithDouble:view.annotation.coordinate.longitude];
    _longitude.text=[Mylongitude stringValue];
    
}

- (IBAction)signup:(UIButton *)sender {
    _myName=[_Name text];
    _myPhone= [_phone text];
    _myAge= [_age text];
    [userDefaults  setObject:_myName forKey:@"name"];
    [userDefaults  setObject:_myPhone forKey:@"phone"];
    [userDefaults  setObject:_myAge forKey:@"age"];
    [userDefaults  setObject:[_longitude text] forKey:@"longitude"];
    [userDefaults  setObject:[_latitude text] forKey:@"latitude"];
    _alert.text=@"Successfully Registered Please signIN";
}

- (IBAction)signIN:(UIButton *)sender {
    SignInViewController *signInController=[self.storyboard instantiateViewControllerWithIdentifier:@"signIN"];
    [signInController setUserData:userDefaults];
    [signInController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:signInController animated:YES completion:nil
     ];
}
@end
