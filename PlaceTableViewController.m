//
//  PlaceTableViewController.m
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "PlaceTableViewController.h"
#import "AFJSONRequestOperation.h"
#import "Place.h"
#import "PlaceViewController.h"

@interface PlaceTableViewController ()

@end

@implementation PlaceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title= @"Places";
        self.tabBarItem.image = [UIImage imageNamed:@"loc"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSURL *url = [[NSURL alloc] initWithString:@"http://beta.json-generator.com/api/json/get/BWG9Ppf"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operationa = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSMutableArray *tempArray =[[NSMutableArray alloc] init];
        for (NSDictionary *oneDictionary in JSON)
        {
            Place *newPlace=[[Place alloc] initWithName: oneDictionary[@"name"]
                                            description: oneDictionary[@"description"]];
        [tempArray addObject:newPlace];
        }
        self.places =[[NSArray alloc] initWithArray:tempArray];
        [self.tableView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"NSError: %@",[error localizedDescription]);
    }];
    
    [operationa start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.places.count;
}
//cell.textLabel.text=[self.places[indexPath.row] name];

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text=[self.places[indexPath.row] name];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PlaceViewController *placeVC = [[PlaceViewController alloc] init];
    
    placeVC.place=self.places[indexPath.row];
    [self.navigationController pushViewController:placeVC animated:YES];
}


@end
