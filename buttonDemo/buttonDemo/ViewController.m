//
//  ViewController.m
//  buttonDemo
//
//  Created by Chenyun on 14/11/23.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "ViewController.h"
#import "CYTimeOutButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CYTimeOutButton *timeOut;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)timeAction:(id)sender
{
	[self.timeOut startCount];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	
}

@end
