//
//  OpenWebViewController.m
//  The SHS App
//
//  Created by Sujay Khandekar on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OpenWebViewController.h"

@interface OpenWebViewController ()

@end

@implementation OpenWebViewController
@synthesize myWeb,myLink;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setLink:(NSString *)theLink
{
    myLink = theLink;
}


- (void)viewDidLoad
    {
 
        NSString *urlAddress = myLink;
        
        //Create a URL object.
        NSURL *url = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        //Load the request in the UIWebView.
        [myWeb loadRequest:requestObj];

    
    

}

- (void)viewDidUnload
{
    [self setMyWeb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [myWeb release];
    [super dealloc];
}
@end
