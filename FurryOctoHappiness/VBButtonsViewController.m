//
//  VBButtonsViewController.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBButtonsViewController.h"

@interface VBButtonsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *codeButton;

@end

@implementation VBButtonsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[self codeButton] setAccessibilityLabel:@"Sea ex semper incorrupte, est te dolore"];
    
}

@end
