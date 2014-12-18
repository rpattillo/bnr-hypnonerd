//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Ricky Pattillo on 12/16/14.
//  Copyright (c) 2014 Ricky Pattillo. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

#pragma mark - Initializers

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   
   if ( self ) {
      self.tabBarItem.title = @"Hypnotize";
      UIImage *i = [UIImage imageNamed:@"Hypno"];
      self.tabBarItem.image = i;
   }
   
   return self;
}


#pragma mark - Overrides

-(void)loadView
{
   HypnosisView *backgroundView = [[HypnosisView alloc] init];
   self.view = backgroundView;
}

@end
