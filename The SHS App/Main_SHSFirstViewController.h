//
//  Main_SHSFirstViewController.h
//  The SHS App
//
//  Created by Sujay Khandekar on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Main_SHSFirstViewController : UIViewController{
    IBOutlet UIScrollView *scrollView;
   
}
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UIButton *phoneNumber;
@property (retain, nonatomic) IBOutlet UIButton *mainWebsite;
@property (retain, nonatomic) IBOutlet UIButton *aeriesHomePage;
@property (retain, nonatomic) IBOutlet UIButton *schoolAddress;

@end
