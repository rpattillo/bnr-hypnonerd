//
//  ReminderViewController.m
//  HypnoNerd
//
//  Created by Ricky Pattillo on 12/17/14.
//  Copyright (c) 2014 Ricky Pattillo. All rights reserved.
//

#import "ReminderViewController.h"

@interface ReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation ReminderViewController

- (IBAction)addReminder:(id)sender
{
   NSDate *date = self.datePicker.date;
   NSLog(@"Setting a reminder for %@", date);
}

@end
