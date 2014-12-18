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


#pragma mark - Overrides

-(void)loadView
{
   HypnosisView *backgroundView = [[HypnosisView alloc] init];
   self.view = backgroundView;
}

@end
