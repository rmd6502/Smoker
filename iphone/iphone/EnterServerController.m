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
        // HTTP GET
        NSURL* url = [NSURL URLWithString:@"http://www.google.com"];
        NSStringEncoding encoding;
        NSError* error = nil;
        NSString* pageData = [NSString stringWithContentsOfURL:url usedEncoding:&encoding error:&error];
        if(pageData == NULL)
            NSLog(@"pageData is NULL");
        else
            NSLog(pageData);

        // HTTP POST
        url = [NSURL URLWithString:@"http://www.google.com.br"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        NSData *requestBody = [@"username:x&password:y" dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:requestBody];
        NSURLResponse *response = NULL;
        NSError *requestError = NULL;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
        NSString *responseString = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
        
        if(responseString == NULL)
            NSLog(@"responseString is NULL");
        else
            NSLog(responseString);
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
    
    // read from plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Smoker" ofType:@"plist" inDirectory:@""];
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];

    NSString *value = [plistDict objectForKey:@"server"];
    if (value == NULL)
        NSLog(@"plist server is NULL");
    else
        defaultServerField.text = value;
    
    // read from documents
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        NSString *userDocumentsPath = [paths objectAtIndex:0];
    }  
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
    
    // write to plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Smoker" ofType:@"plist" inDirectory:@""];
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    
    [plistDict setValue:self.defaultServerUrl forKey:@"server"];
    [plistDict writeToFile:filePath atomically: YES];
    
    NSString *value = [plistDict objectForKey:@"server"];
    if (value == NULL)
        NSLog(@"plist server is NULL");
    else
        NSLog(@"server value is %@", value);
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
