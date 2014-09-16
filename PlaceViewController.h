//
//  PlaceViewController.h
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Place.h"
#import "City.h"
@interface PlaceViewController : UIViewController

@property (strong, nonatomic) Place *place;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *placeName;
@property (strong, nonatomic) UILabel *placeDetail;
@property (strong, nonatomic) City *city;
-(void)makeThisPlaceInteresting: (id) sender;


@end
