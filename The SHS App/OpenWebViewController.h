//
//  OpenWebViewController.h
//  The SHS App
//
//  Created by Sujay Khandekar on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OpenWebViewController : UIViewController{
    IBOutlet UIWebView *webView;
    NSString *myLink;
}
@property (retain, nonatomic) IBOutlet UIWebView *myWeb;
@property (retain, nonatomic) NSString *myLink;
- (void)setLink:(NSString *)theLink;
@end
