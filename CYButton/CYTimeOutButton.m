//
//  CTButton.m
//  buttonDemo
//
//  Created by Chenyun on 14/11/23.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "CYTimeOutButton.h"

@interface CYTimeOutButton ()
{
	int _count;
	NSTimer * _timer;
	UILabel * labelTimeS;
}

@end

@implementation CYTimeOutButton

- (void)awakeFromNib
{
	[super awakeFromNib];

	_count = 60;

	labelTimeS = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	labelTimeS.textAlignment = NSTextAlignmentCenter;
	labelTimeS.text = @"获取验证码";
	labelTimeS.textColor = [UIColor whiteColor];
	[self addSubview:labelTimeS];

	self.backgroundColor = [UIColor colorWithRed:0.39 green:0.66 blue:0.27 alpha:1.0];
}

#pragma amrk -

- (void)startCount
{
	self.enabled = NO;

	NSString * time = [NSString stringWithFormat:@"(%d)重新获取",_count];

	labelTimeS.text = time;

	self.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.81 alpha:1.0];
	
	if ( _timer )
	{
		[_timer invalidate];
		_timer = nil;
	}

	_timer = [NSTimer scheduledTimerWithTimeInterval:1.f
											  target:self
											selector:@selector(updateLabel)
											userInfo:nil
											 repeats:YES];
}

- (void)updateLabel
{
	_count--;
	
	if ( _count < 0 )
	{
		[self stopCount];
	}
	else
	{
		NSString * time = [NSString stringWithFormat:@"(%d)重新获取",_count];
		labelTimeS.text = time;
	}
}

- (void)stopCount
{
	[_timer invalidate];
	_count = 60;

	self.enabled = YES;
	labelTimeS.text = @"获取验证码";
	self.backgroundColor = [UIColor colorWithRed:0.39 green:0.66 blue:0.27 alpha:1.0];
}

#pragma mark - 

- (void)dealloc
{
	[self stopCount];
}

@end
