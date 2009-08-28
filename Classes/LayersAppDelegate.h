//
//  LayersAppDelegate.h
//  Layers
//
//  Created by test on 3/29/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LayersViewController;

@interface LayersAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LayersViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LayersViewController *viewController;

@end

