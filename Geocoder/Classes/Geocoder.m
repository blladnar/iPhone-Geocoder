//
//  Geocoder.m
//
//  Created by Randall Brown on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Geocoder.h"
#import "NSString+URLEncoding.h"
#import "JSON.h"

@implementation Geocoder

@synthesize delegate;

-(void)getCoordinateForAddress:(NSString*)address
{
	NSString *escapedAddress = [address encodedURLString];
	NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=true", escapedAddress]]
															cachePolicy:NSURLRequestUseProtocolCachePolicy
														timeoutInterval:60.0];
	
	NSURLConnection *theConnection=[[[NSURLConnection alloc] initWithRequest:theRequest delegate:self] autorelease];
	if (theConnection) 
	{
		receivedData=[[NSMutableData alloc] init];
	} 
	else 
	{
		
	}
}

-(void)dealloc
{
	[receivedData release];
	[super dealloc];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *dataString = [[[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding] autorelease];

	NSDictionary *jsonDictionary = [dataString JSONValue];
	id results = [jsonDictionary objectForKey:@"results"];
	for( id stuff in results )
	{
		NSDictionary *northeast = [[[stuff objectForKey:@"geometry"] objectForKey:@"bounds"] objectForKey:@"northeast"];
		NSDictionary *southwest = [[[stuff objectForKey:@"geometry"] objectForKey:@"bounds"] objectForKey:@"southwest"];
		NSDictionary *center = [[stuff objectForKey:@"geometry"] objectForKey:@"location"];
		
		CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake( [[center objectForKey:@"lat"] floatValue], [[center objectForKey:@"lng"] floatValue]);
		
		MKCoordinateSpan span = MKCoordinateSpanMake([[northeast objectForKey:@"lat"] floatValue]-[[southwest objectForKey:@"lat"] floatValue], [[northeast objectForKey:@"lng"] floatValue]-[[southwest objectForKey:@"lng"] floatValue]);
		
		MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);																			
																					
		[delegate locationFoundWithMapRegion:region];
		
	}
}
@end
