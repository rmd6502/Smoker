//
//  EnterServerController.m
//  iphone
//
//  Created by desmond bowe on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EnterServerController.h"


@implementation EnterServerController

@synthesize defaultServerUrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        /*NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *finalPath = [path stringByAppendingPathComponent:@"Smoker.plist"];
        NSDictionary *plistData = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
        if (plistData == NULL)
            NSLog(@"plistdata is null");
        */
        
     
        
        /*
        NSString *filePath = @"/Users/patchuser/code/Smoker/iphone/iphone/Smoker.plist";
        NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        
        NSString *value;
        value = [plistDict objectForKey:@"server"];
        if (value == NULL)
            NSLog(@"it b NULL");
        */
        
        
        
        
        
        //NSString *filePath = @"/System/Library/CoreServices/SystemVersion.plist";
        //NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        
        //[plistDict setValue:@"http://www.another.url" forKey:@"server"];
        //[plistDict writeToFile:filePath atomically: YES];
        
        ///value = [plistDict objectForKey:@"server"];
        //if (value == NULL)
        //    NSLog(@"it b NULL");

        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSString *filePath = @"/Users/patchuser/code/Smoker/iphone/iphone/Smoker.plist";
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    NSString *value;
    value = [plistDict objectForKey:@"server"];
    if (value == NULL)
        NSLog(@"it b NULL");
    else
        defaultServerField.text = value;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goServer: (id)sender
{
    self.defaultServerUrl = defaultServerField.text;
    NSLog(@"server url is %@", defaultServerUrl);
    
    
    
    NSString *filePath = @"/Users/patchuser/code/Smoker/iphone/iphone/Smoker.plist";
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    [plistDict setValue:self.defaultServerUrl forKey:@"server"];
    [plistDict writeToFile:filePath atomically: YES];
    
    NSString *value;
    value = [plistDict objectForKey:@"server"];
    if (value == NULL)
        NSLog(@"it b NULL");
    
}
- (void)connectToServer:(NSString *)serverUrl
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
