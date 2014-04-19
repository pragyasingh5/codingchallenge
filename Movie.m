//
//  Movie.m
//  MyApp
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import "Movie.h"
#import <Foundation/Foundation.h>

@implementation Movie
@synthesize movieTitle,year,cast;

 - (id) initWithMovieName: (NSString *) mName andYear:(NSString *) mYear andCast:(NSString *)mCast;
{
    self = [super init];
    if(self)
    {
        movieTitle = mName;
        year = mYear;
        cast = mCast;
    }
    
    return self;
}
@end
