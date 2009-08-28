//
//  LayersAppDelegate.m
//  Layers
//
//  Created by test on 3/29/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "LayersAppDelegate.h"
#import "LayersViewController.h"

@implementation LayersAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
