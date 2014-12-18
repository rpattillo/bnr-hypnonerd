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

#pragma mark - Initializers

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

   if ( self ) {
      self.tabBarItem.title = @"Reminder";
      UIImage *i = [UIImage imageNamed:@"Time"];
      self.tabBarItem.image = i;
   }
   
   return self;
}


#pragma mark - Outlets

- (IBAction)addReminder:(id)sender
{
   NSDate *date = self.datePicker.date;
   NSLog(@"Setting a reminder for %@", date);
   

   UILocalNotification *note = [[UILocalNotification alloc] init];
   note.alertBody = @"Hypnotize me!";
   note.fireDate = date;
   
   [[UIApplication sharedApplication] scheduleLocalNotification:note];
}

@end
