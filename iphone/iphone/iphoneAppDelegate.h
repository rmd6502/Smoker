//
//  iphoneAppDelegate.h
//  iphone
//
//  Created by desmond bowe on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EnterServerController;

@interface iphoneAppDelegate : NSObject <UIApplicationDelegate> {

}
@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (nonatomic, retain) EnterServerController *enterServerController;

@end
