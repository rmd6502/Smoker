//
//  EnterServerController.h
//  iphone
//
//  Created by desmond bowe on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnterServerController : UIViewController<UITextFieldDelegate> {
    NSString *defaultServerUrl;
    IBOutlet UITextField *defaultServerField;
    
}

@property (nonatomic, copy) NSString *defaultServerUrl;


-(IBAction)goServer: (id)sender;

@end
