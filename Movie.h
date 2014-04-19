//
//  Movie.h
//  MyApp
//
//  Created by Pragya Singh on 4/17/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString * movieTitle;
@property (strong, nonatomic) NSString * year;
@property (strong, nonatomic) NSString * cast;

#pragma mark -
#pragma mark Class Methods

- (id) initWithMovieName: (NSString *) mName andYear:(NSString *) mYear andCast:(NSString *)mCast;



@end
