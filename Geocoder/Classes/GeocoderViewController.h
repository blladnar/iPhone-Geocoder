//
//  GeocoderViewController.h
//  Geocoder
//
//  Created by Randall Brown on 3/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Geocoder.h"

@interface GeocoderViewController : UIViewController<GeocoderDelegate> 
{
	IBOutlet MKMapView *mapView;
	IBOutlet UILabel *latLngLabel;
}

@end

