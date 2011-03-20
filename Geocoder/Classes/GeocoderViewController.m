//
//  GeocoderViewController.m
//  Geocoder
//
//  Created by Randall Brown on 3/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GeocoderViewController.h"

@implementation GeocoderViewController

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	Geocoder *geocoder = [[[Geocoder alloc] init] autorelease];
	geocoder.delegate = self;
	[geocoder getCoordinateForAddress:searchBar.text];
	
	[searchBar resignFirstResponder];
}

-(void)locationFoundWithMapRegion:(MKCoordinateRegion)region
{
	latLngLabel.text = [NSString stringWithFormat:@"<%f, %f>", region.center.latitude, region.center.longitude];
	mapView.region = region;
}


- (void)dealloc 
{
    [super dealloc];
}

@end
