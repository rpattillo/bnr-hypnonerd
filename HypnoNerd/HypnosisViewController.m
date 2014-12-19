//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Ricky Pattillo on 12/16/14.
//  Copyright (c) 2014 Ricky Pattillo. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController()

@property (nonatomic, strong) HypnosisView *view;

@end


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
   
   NSArray *colors = @[@"Red", @"Green", @"Blue"];
   UISegmentedControl *colorSwitcher = [[UISegmentedControl alloc] initWithItems:colors];
   
   CGRect switcherFrame = [colorSwitcher frame];
   switcherFrame.origin = CGPointMake(120, 120);
   colorSwitcher.frame = switcherFrame;
   
   SEL action = @selector(updateColors:);
   [colorSwitcher addTarget:self action:action forControlEvents:UIControlEventValueChanged];
   
   [backgroundView addSubview:colorSwitcher];

   
   
}


-(void)updateColors:(UISegmentedControl *)control
{
   switch(control.selectedSegmentIndex) {
      case 0:
         [self.view setCircleColor:[UIColor redColor]];
         break;
         
      case 1:
         [self.view setCircleColor:[UIColor greenColor]];
         break;
         
      case 2:
         [self.view setCircleColor:[UIColor blueColor]];
         break;
   }
}


@end
