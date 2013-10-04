//
//  Teacher.h
//  The SHS App
//
//  Created by Sujay Khandekar on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Teacher : NSObject{
    NSString *name;
    NSString *subject;
    NSString *website;
    NSString *extension;
    NSString *email;
}

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *subject;
@property(nonatomic,copy) NSString *website;
@property(nonatomic,copy) NSString *extension;
@property(nonatomic,copy) NSString *email;

@end