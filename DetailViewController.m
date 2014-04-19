//
//  DetailViewController.m
//  MyApp
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize movieNameLabel, movieCastLabel, movieYearLabel, currentMovie;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Load up the UI
    [self setLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark -
#pragma mark Methods

- (void)getMovie:(id)movieObject
{
    currentMovie = movieObject;
    
}

-(void)setLabels
{
    movieNameLabel.text = currentMovie.movieTitle;
    movieYearLabel.text = currentMovie.year;
    movieCastLabel.text = currentMovie.cast;
    
}


@end
