//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Ricky Pattillo on 12/16/14.
//  Copyright (c) 2014 Ricky Pattillo. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@interface HypnosisViewController() <UITextFieldDelegate>
@property (nonatomic, weak) UITextField *textField;
@end

@implementation HypnosisViewController

#pragma mark - Initializers

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   
   if ( self ) {
      self.tabBarItem.title = @"Hypnotize";
      UIImage *i = [UIImage imageNamed:@"Hypno"];
      self.tabBarItem.image = i;
   }
   
   return self;
}


#pragma mark -

- (void)drawHypnoticMessage:(NSString *)message
{
   for (int i = 0; i < 20; i++) {
      UILabel *messageLabel = [[UILabel alloc] init];
      
      messageLabel.backgroundColor = [UIColor clearColor];
      messageLabel.textColor = [UIColor blackColor];
      messageLabel.text = message;
      
      [messageLabel sizeToFit];
      
      int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
      int x = arc4random() % width;
      
      int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
      int y = arc4random() % height;
      
      CGRect frame = messageLabel.frame;
      frame.origin = CGPointMake(x, y);
      messageLabel.frame = frame;
      
      [self.view addSubview:messageLabel];

      messageLabel.alpha = 0.0;
      [UIView animateWithDuration:0.5
                            delay:0
                          options:UIViewAnimationOptionCurveEaseIn
                       animations:^{
                          messageLabel.alpha = 1.0;
                       }
                       completion:NULL];
      [UIView
         animateKeyframesWithDuration:1.0
         delay:0.0
         options:0
         animations:^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.8 animations:^{
               messageLabel.center = self.view.center;
            }];
            [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
               int x = arc4random() % width;
               int y = arc4random() % height;
               messageLabel.center = CGPointMake(x, y);
            }];
         }
         completion:^(BOOL finished){
            NSLog(@"Animation finished");
         }];
      
      UIInterpolatingMotionEffect *motionEffect;
      motionEffect = [[UIInterpolatingMotionEffect alloc]
                      initWithKeyPath:@"center.x"
                      type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
      motionEffect.minimumRelativeValue = @(-25);
      motionEffect.maximumRelativeValue = @(25);
      [messageLabel addMotionEffect:motionEffect];
      
      motionEffect = [[UIInterpolatingMotionEffect alloc]
                      initWithKeyPath:@"center.y"
                      type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
      motionEffect.minimumRelativeValue = @(-25);
      motionEffect.maximumRelativeValue = @(25);
      [messageLabel addMotionEffect:motionEffect];
      
   }
}


#pragma mark - Overrides

- (void)loadView
{
   HypnosisView *backgroundView = [[HypnosisView alloc] init];
   
   CGRect textFieldRect = CGRectMake(40, -70, 240, 30);
   UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
   
   textField.borderStyle = UITextBorderStyleRoundedRect;
   textField.placeholder = @"Hypnotize me";
   textField.returnKeyType = UIReturnKeyDone;
   
   textField.delegate = self;
   
   [backgroundView addSubview:textField];

   self.textField = textField;
   self.view = backgroundView;
}


- (void)viewDidLoad
{
   [super viewDidLoad];
   
   NSLog(@"HypnosisViewController loaded its view.");
}


- (void)viewDidAppear:(BOOL)animated
{
   [super viewDidAppear:animated];

   [UIView animateWithDuration:2.0
                         delay:0.0
        usingSpringWithDamping:0.25
         initialSpringVelocity:0.0
                       options:0
                    animations:^{
                       CGRect frame = CGRectMake(40, 70, 240, 30);
                       self.textField.frame = frame;
                    }
                    completion:NULL];
}


#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
   [self drawHypnoticMessage:textField.text];
   
   textField.text = @"";
   [textField resignFirstResponder];
   return YES;
}

@end
