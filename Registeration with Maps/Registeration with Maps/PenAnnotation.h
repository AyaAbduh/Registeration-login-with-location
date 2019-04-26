//
//  PenAnnotation.h
//  Registeration with Maps
//
//  Created by Esraa Hassan on 4/26/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface PenAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@end
