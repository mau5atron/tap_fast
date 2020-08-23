//
//  ViewController.m
//  002_tap_fast
//
//  Created by Gabriel Betancourt on 8/17/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	totalScoreCount = 0;
	timeInt = 10;
	gameMode = 0;
	
	self.timeLeft.text = [NSString stringWithFormat:@"%i", timeInt];
	self.totalScore.text = [NSString stringWithFormat:@"%i", totalScoreCount];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)startGameBtn:(id)sender {
//	totalScoreCount += 1;
	if ( timeInt == 10 ){
		gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCounter) userInfo:NULL repeats:TRUE];
		// calling startCounter every second
		self.startBtn.enabled = FALSE;
		self.startBtn.alpha = 0.25;
	}
	
	switch (gameMode) {
		case 1:
			totalScoreCount += 1;
			self.totalScore.text = [NSString stringWithFormat:@"%i", totalScoreCount];
			break;
		case 0:
			timeInt = 10;
			totalScoreCount = 0;
			self.timeLeft.text = [NSString stringWithFormat:@"%i", timeInt];
			self.totalScore.text = [NSString stringWithFormat:@"%i", totalScoreCount];
			[self.startBtn setTitle:@"Start" forState:UIControlStateNormal];
			break;
		default:
			break;
	}
}

- (void)startCounter {
	timeInt -= 1;
	self.timeLeft.text = [NSString stringWithFormat:@"%i", timeInt];
	gameMode = 1;
	self.startBtn.enabled = TRUE;
	self.startBtn.alpha = 1.00;
	[self.startBtn setTitle:@"Tap !" forState:UIControlStateNormal];
	if ( timeInt == 0 ){
		[gameTimer invalidate];
		self.startBtn.enabled = FALSE;
		self.startBtn.alpha = 0.25;
		// schedule game to reset after 3s
		[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(restartGame) userInfo:NULL repeats:FALSE];
	}
}

- (void)restartGame {
	self.startBtn.enabled = TRUE;
	self.startBtn.alpha = 1.0;
	[self.startBtn setTitle:@"Restart" forState:UIControlStateNormal];
	gameMode = 0;
}
@end
