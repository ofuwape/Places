//
//  CityViewController.m
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "CityViewController.h"
#import "AFJSONRequestOperation.h"
#import "EditNoteViewController.h"


@interface CityViewController ()

@end

@implementation CityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title= @"City";
        self.tabBarItem.image = [UIImage imageNamed:@"details-25"];
        self.view.backgroundColor=[UIColor grayColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.city=[[City alloc] init];
    City *storedCity=[City getCity];
    if(storedCity.notes!=NULL){
    self.city.notes = storedCity.notes;
    }

   
    
    self.notesLabel=[[UILabel alloc] init];
    self.notesLabel.frame=CGRectMake(20,150,280,40);
    self.notesLabel.text=[NSString stringWithFormat:@"Notes: %@", self.city.notes];
    
 [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(dataRetrieved)
                                            name:@"initWithJSONFinishedLoading"
                                          object:nil];
    //when app is closing/sleeping
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(enteringBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    //when app is opening
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(enteringForeground)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
   [self.view addSubview:self.notesLabel];
    
}


-(void)enteringForeground{
    self.city=[City getCity];
    
}

-(void)enteringBackground{
    self.city=[City getCity];
    [City saveCity:self.city];
    
}

-(void) dataRetrieved
{

//    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(20,60,280,40);
    nameLabel.text = [NSString stringWithFormat:@"City name is: %@",self.city.name];
    [self.view addSubview:nameLabel];
    
    UILabel *stateLabel = [[UILabel alloc] init];
    stateLabel.frame = CGRectMake(20,90,280,40);
    stateLabel.text = [NSString stringWithFormat:@"City state is: %@",self.city.state];
    [self.view addSubview:stateLabel];
    
    UILabel *populationLabel = [[UILabel alloc] init];
    populationLabel.frame = CGRectMake(20,120,280,40);
    populationLabel.text = [NSString stringWithFormat:@"City population is: %@",self.city.population];
    [self.view addSubview:populationLabel];
    
    
//    [self.scrollView addSubview:self.notesField];
    
    //[self.view addSubview:self.scrollView];
    
//    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    editButton.frame=CGRectMake(20,200,100,40);
//    [editButton setTitle:@"Edit Note" forState:UIControlStateNormal];
//    editButton.backgroundColor=[UIColor whiteColor];
//    
//    [self.view addSubview:editButton];
//    [editButton addTarget:self
//                   action:@selector(editPressed)
//         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *editButton=[[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                 target:self
                                 action:@selector(editPressed)];
    self.navigationItem.rightBarButtonItem=editButton;
}

-(void)editPressed {
    EditNoteViewController *editNoteVC= [[EditNoteViewController alloc] init];
    editNoteVC.city=self.city;
    editNoteVC.delegate=self;
    [self presentViewController:editNoteVC animated:YES completion:nil];
    
}
- (void)addItemViewController:(EditNoteViewController *)controller didFinishEnteringItem:(NSString *)item
{
    self.city.notes=item;
    self.notesLabel.text=[NSString stringWithFormat:@"Notes: %@", self.city.notes];
    [self.view addSubview:self.notesLabel];
   
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

@end
