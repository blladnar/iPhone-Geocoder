//
//  Geocoder.h
//
//  Created by Randall Brown on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol GeocoderDelegate

-(void)locationFoundWithMapRegion:(MKCoordinateRegion)region;

@end


@interface Geocoder : NSObject 
{
	id<GeocoderDelegate> delegate;
	NSMutableData *receivedData;
}

-(void)getCoordinateForAddress:(NSString*)address;


@property (assign) id<GeocoderDelegate> delegate;

@end
