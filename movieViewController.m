//
//  movieViewController.m
//  MyApp
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 Pragya Singh. All rights reserved.
//

#import "movieViewController.h"
#import "Movie.h"

#define getDataURL @"http://www.nousguideinc.com/43254235dsffds34f/8y39485y.json"

@interface movieViewController ()
@property (strong, nonatomic) NSArray *array;
@property (strong,nonatomic) NSArray *searchresults;
@end

@implementation movieViewController
@synthesize jsonArray, movieArray, array,searchresults;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Set the title of our VC
    self.title=  @"Movie of the Year";
    
    //Load Data
    [self retrieveData];
    
    self.array = [[NSArray alloc ] initWithObjects:jsonArray,nil];
    
    self.searchresults = [[NSArray alloc] init];
    
    
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return movieArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchresults count];
    }
    else
    {
        return [self.array count];
    }
    //return [self.array count];
}

#pragma Search Methods

-(void)filterContentForSearchText:(NSString *)searchtext scope:(NSString *) scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith [c] %@", searchtext];
    self.searchresults = [self.array filteredArrayUsingPredicate:predicate];
}

-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Movie * movieObject;
    movieObject = [ movieArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = movieObject.movieTitle;
    
    //Accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [self.searchresults objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [self.jsonArray objectAtIndex:indexPath.row];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
#pragma mark Class Methods

- (void) retrieveData
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up movie array
    movieArray =  [[NSMutableArray alloc] init];
    
    //Loop through our json array
    for (int i=0; i < jsonArray.count; i++)
    {
        //Create our movie object
        NSString * mName = [[jsonArray objectAtIndex:i] objectForKey:@"movieTitle"];
        NSString * mYear = [[jsonArray objectAtIndex:i] objectForKey:@"year"];
        NSString * mCast = [[jsonArray objectAtIndex:i] objectForKey:@"cast"];
        
        //Add the movie object to movie array
        [movieArray addObject:[[Movie alloc] initWithMovieName:mName andYear:mYear andCast:mCast]];
    }
    
    //Reload our table view
    [self.tableView reloadData];
}

-(IBAction)mail:(id)sender {
    
    //Loop through our json array
    for (int i=0; i<jsonArray.count;i++)
    {
        //Read through listings
        NSString * mName = [[jsonArray objectAtIndex:i] objectForKey:@"movieTitle"];
        NSString * mYear = [[jsonArray objectAtIndex:i] objectForKey:@"year"];
        NSString * mCast = [[jsonArray objectAtIndex:i] objectForKey:@"cast"];
        
       
    }
    NSString *emailTitle = @"mName";
    NSString *messageBody = @"mYear";
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}



- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
