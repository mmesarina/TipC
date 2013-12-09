//
//  SettingsViewController.m
//  TipCalculator-NEW
//
//  Created by malena mesarina on 12/8/13.
//  Copyright (c) 2013 malena mesarina. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) IBOutlet UITextField *option1;
@property (strong, nonatomic) IBOutlet UITextField *option2;
@property (strong, nonatomic) IBOutlet UITextField *option3;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings Page";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.option1.delegate = self;
    self.option2.delegate = self;
    self.option3.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [NSUserDefaults resetStandardUserDefaults];
    [self.view endEditing:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // Get percentages and store in key/value pairs
    
    
    [defaults setObject:self.option1.text forKey:@"option1"];
    [defaults setObject:self.option2.text forKey:@"option2"];
    [defaults setObject:self.option3.text forKey:@"option3"];
    
    [defaults synchronize];

}

//Delegates
- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc ] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    return YES;
}

- (void) onDoneButton {
    [self.view endEditing:YES];
}


@end
