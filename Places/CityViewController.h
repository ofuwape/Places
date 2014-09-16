//
//  CityViewController.h
//  Places
//
//  Created by Maputi Botlhole on 9/13/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "EditNoteViewController.h"

@interface CityViewController : UIViewController<EditNoteViewControllerDelegate>

@property (strong, nonatomic) City *city;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *notesLabel;
//@property (strong, nonatomic) UITextField *notesField;

@end
