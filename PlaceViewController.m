//
//  PlaceViewController.m
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "PlaceViewController.h"
#import "Place.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title= @"Place";
        self.tabBarItem.image = [UIImage imageNamed:@"loc"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
 
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width,self.view.frame.size.height);
    
    self.placeName = [[UILabel alloc] init];
    self.placeName.frame = CGRectMake(20,20,280,40);
    self.placeName.text = [NSString stringWithFormat:@"Name: %@",self.place.name];
    [self.scrollView addSubview:self.placeName];
    
    self.placeDetail = [[UILabel alloc] init];
    self.placeDetail.frame = CGRectMake(20,80,280,40);
    self.placeDetail.text = [NSString stringWithFormat:@"Detail: %@",self.place.description];
    [self.scrollView addSubview:self.placeDetail];
    
   
    
    [self.view addSubview:self.scrollView];

}

-(void)viewWillAppear: (BOOL) animated{
    //marking up interesting places
    self.city=[City getCity];
    BOOL placeAlreadyInteresting=NO;
    for(Place *p in self.city.interestingPlaces){
        if([p.name isEqualToString:self.place.name]){
            placeAlreadyInteresting=YES;
    }
    }
//showing button if place is not already marked interesting
    UIButton *interestingButton= [UIButton buttonWithType:UIButtonTypeRoundedRect]; interestingButton.frame=CGRectMake(60,200,200,44);
    interestingButton.backgroundColor=[UIColor blackColor];
   
    if(!placeAlreadyInteresting){
    [interestingButton setTitle:@"Mark as Interesting"
                       forState:UIControlStateNormal];
    [self.view addSubview:interestingButton];
    [interestingButton addTarget:self
                          action:@selector(makeThisPlaceInteresting:)
                forControlEvents:UIControlEventTouchUpInside];
    }else{
        [interestingButton setTitle:@"Mark as Un-Interesting"
                           forState:UIControlStateNormal];
        [self.view addSubview:interestingButton];
        [interestingButton addTarget:self
                              action:@selector(makeThisPlaceUnInteresting:)
                    forControlEvents:UIControlEventTouchUpInside];
    
    }
}

-(void)makeThisPlaceInteresting: (id)sender{
    NSMutableArray *tempArray=[[NSMutableArray alloc] initWithArray:self.city.interestingPlaces];
    [tempArray addObject:self.place];
    self.city.interestingPlaces=[[NSArray alloc] initWithArray:tempArray];
    [City saveCity:self.city];
    //making button disappear
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Place favorited"
                                                    message:@"This Place is now in your favorites list"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];

    [alert show];
    [self.tabBarController.tabBar.items[1] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)self.city.interestingPlaces.count]];
    [sender removeFromSuperview];
    
}

-(void)makeThisPlaceUnInteresting: (id)sender{
    NSMutableArray *tempArray=[[NSMutableArray alloc] initWithArray:self.city.interestingPlaces];
    for(Place *item in tempArray) {
        if([item.name isEqualToString:self.place.name]) {
            [tempArray removeObject:item];
            break;
        }
    }
    self.city.interestingPlaces=[[NSArray alloc] initWithArray:tempArray];
    [City saveCity:self.city];
    //making button disappear
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Place unFavorited"
                                                    message:@"This Place is no longer in your favorites list"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
    [self.tabBarController.tabBar.items[1] setBadgeValue:[NSString stringWithFormat:@"%lu", (unsigned long)self.city.interestingPlaces.count]];
    [sender removeFromSuperview];
    
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
