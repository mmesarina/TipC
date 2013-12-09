//
//  TipViewController.m
//  TipCalculator-NEW
//
//  Created by malena mesarina on 12/8/13.
//  Copyright (c) 2013 malena mesarina. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (strong, nonatomic) IBOutlet UITextField *billTextField;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;

@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;



@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults removeObjectForKey:@"option1"];
        [defaults removeObjectForKey:@"option2"];
        [defaults removeObjectForKey:@"option3"];
        [defaults synchronize];
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    
    
    float billAmount = [self.billTextField.text floatValue];
    //NSArray *tipValues = @[@(0.1), @(0.2), @(0.3)];

    //float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
     NSUInteger index =  self.tipControl.selectedSegmentIndex;
    
     NSString *title = [self.tipControl titleForSegmentAtIndex:index];
     NSMutableString *string1 = [NSMutableString stringWithString: title];
    
    [string1 replaceCharactersInRange: [string1 rangeOfString: @"%"] withString: @""];
    
    
    
    float tipAmount = billAmount * ([string1 floatValue])/(float) 100;
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text= [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    
    //Retrieve settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //id temp = [defaults objectForKey:@"option2"];
    id test = [defaults objectForKey:@"option1"];
    
    if ([defaults objectForKey:@"option1"] != nil) {
        NSString *option1 = [defaults objectForKey:@"option1"];
        NSString *option2 = [defaults objectForKey:@"option2"];
        NSString *option3 = [defaults objectForKey:@"option3"];
        //Update array and Display them
        
        //[self.tipControl initWithItems:@[option1, option2, option3]];
        //[self.tipControl initWithItems:@[@(0.5),@(0.5),@(0.5)]];
        
        NSString *title1 = [option1 stringByAppendingString:@"%"];
        NSString *title2 = [option2 stringByAppendingString:@"%"];
        NSString *title3 = [option3 stringByAppendingString:@"%"];
        
        [self.tipControl setTitle:title1 forSegmentAtIndex:0];
        [self.tipControl setTitle:title2 forSegmentAtIndex:1];
        [self.tipControl setTitle:title3 forSegmentAtIndex:2];
        
        
    }
    
}
    

@end
