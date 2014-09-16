//
//  EditNoteViewController.h
//  Places
//
//  Created by Maputi Botlhole on 9/14/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

//sending data back to previous controller
@class EditNoteViewController;
@protocol EditNoteViewControllerDelegate <NSObject>
- (void)addItemViewController:(EditNoteViewController *)controller didFinishEnteringItem:(NSString *)item;
@end


@interface EditNoteViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *notesField;
@property (strong, nonatomic) City *city;
@property (nonatomic, weak) id <EditNoteViewControllerDelegate> delegate;

- (void) savePressed;

@end
