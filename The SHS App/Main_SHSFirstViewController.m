//
//  Main_SHSFirstViewController.m
//  The SHS App
//
//  Created by Sujay Khandekar on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Main_SHSFirstViewController.h"
#import "OpenWebViewController.h"

@implementation Main_SHSFirstViewController
@synthesize scrollView;
@synthesize phoneNumber;
@synthesize mainWebsite;
@synthesize aeriesHomePage;
@synthesize schoolAddress;


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"websiteButton"]){
        OpenWebViewController *cvc = (OpenWebViewController *)[segue destinationViewController];
        cvc.myLink = @"http://www.saratogahigh.org";
    }else {
        if([[segue identifier] isEqualToString:@"mapButton"]){
            OpenWebViewController *cvc = (OpenWebViewController *)[segue destinationViewController];
            cvc.myLink = @"http://goo.gl/maps/hN5Qw";
        }else {
            if([[segue identifier] isEqualToString:@"aeriesButton"]){
                OpenWebViewController *cvc = (OpenWebViewController *)[segue destinationViewController];
                cvc.myLink = @"https://aeries.lgsuhsd.org/aeries.net/loginparent.aspx";
            }
        }
    }
}


-(IBAction)callPhone:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4088673411"]];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //---set the viewable frame of the scroll view---
    scrollView.frame = CGRectMake(0, 230, 320, 410);
    //---set the content size of the scroll view---
    [scrollView setContentSize:CGSizeMake(320, 550)];    
    [super viewDidLoad];
 
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setPhoneNumber:nil];
    [self setMainWebsite:nil];
    [self setAeriesHomePage:nil];
    [self setSchoolAddress:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [scrollView release];
    [phoneNumber release];
    [mainWebsite release];
    [aeriesHomePage release];
    [schoolAddress release];
    [super dealloc];
}
@end
