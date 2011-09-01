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
        
        
        /*
        responseData = [[NSMutableData data] retain];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        */
        
        
        NSURL* url = [NSURL URLWithString:@"http://www.google.com"];
        NSStringEncoding encoding;
        NSError* error = nil;
        NSString* pageData = [NSString stringWithContentsOfURL:url
                                                  usedEncoding:&encoding error:&error];
        
        if(pageData == NULL)
            NSLog(@"pageData is NULL");
        else
            NSLog(pageData);
        
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
    
    
//    Class cl = (Class)objc_getClass([functions[[formulaPicker selectedRowInComponent:0]].className UTF8String]);
    UIViewController *fvc = class_createInstance((Class)objc_getClass(@"SettingsController"), 0);
    [fvc initWithNibName:nil bundle:nil];
    [self presentModalViewController:fvc animated:YES];
    
    
}
- (void)connectToServer:(NSString *)serverUrl
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}



/*
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Show error
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
}
*/




@end
