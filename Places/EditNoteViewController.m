//
//  EditNoteViewController.m
//  Places
//
//  Created by Maputi Botlhole on 9/14/14.
//  Copyright (c) 2014 Oluwatoni Fuwape. All rights reserved.
//

#import "EditNoteViewController.h"

@interface EditNoteViewController ()

@end

@implementation EditNoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.notesField=[[UITextField alloc] init];
    self.notesField.frame=CGRectMake(15,90,290,30);
    self.notesField.backgroundColor=[UIColor whiteColor];
    self.notesField.borderStyle=UITextBorderStyleRoundedRect;
    self.notesField.keyboardType=UIKeyboardTypeEmailAddress;
    self.notesField.delegate=self;
    [self.view addSubview:self.notesField];
    
    
    UIButton *saveButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame=CGRectMake(15,140,290,50);
    [saveButton setTitle:@"Save Note" forState:UIControlStateNormal];
    saveButton.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:saveButton];
    [saveButton addTarget:self
                   action:@selector(savePressed)
         forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated
{
     self.city=[City getCity];
    self.notesField.text=self.city.notes;
}
-(void) savePressed
{
  self.city.notes=self.notesField.text;
     [City saveCity:self.city];//archiving
 [self.delegate addItemViewController:self didFinishEnteringItem:self.city.notes];
 [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField {
    self.city.notes=textField.text;
    [textField resignFirstResponder];
    return YES;
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
