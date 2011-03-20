//
//  GeocoderAppDelegate.h
//  Geocoder
//
//  Created by Randall Brown on 3/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeocoderViewController;

@interface GeocoderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GeocoderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GeocoderViewController *viewController;

@end

