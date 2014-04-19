//
//  movieViewController.h
//  MyApp
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>



@interface movieViewController : UITableViewController<MFMailComposeViewControllerDelegate, UITableViewDelegate,UITableViewDataSource,UISearchDisplayDelegate>

@property (nonatomic, strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSMutableArray * movieArray;

#pragma mark - 
#pragma mark Class Methods
- (void) retrieveData;
- (IBAction)mail:(id)sender;

@end
