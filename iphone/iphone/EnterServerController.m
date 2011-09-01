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
    
    // read from NSUserDefaults
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *server = [prefs stringForKey:@"server"];
    if (server == NULL)
        NSLog(@"NSUserDefaults server is NULL");
    else
        defaultServerField.text = server;
    
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
    
    // write to NSUserDefaults
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:self.defaultServerUrl forKey:@"server"];
    [prefs synchronize];
}

- (void)connectToServer:(NSString *)serverUrl
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
