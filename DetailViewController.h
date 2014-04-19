//
//  DetailViewController.h
//  MyApp
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface DetailViewController : UIViewController


@property(nonatomic,strong) IBOutlet UILabel * movieNameLabel;
@property(nonatomic,strong) IBOutlet UILabel * movieYearLabel;
@property(nonatomic,strong) IBOutlet UILabel * movieCastLabel;

@property(nonatomic,strong) Movie * currentMovie;

#pragma mark -
#pragma mark Methods

- (void)getMovie:(id)movieObject;
- (void)setLabels;




@end
