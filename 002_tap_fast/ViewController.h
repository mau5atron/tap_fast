//
//  ViewController.h
//  002_tap_fast
//
//  Created by Gabriel Betancourt on 8/17/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	NSTimer *gameTimer;
	int totalScoreCount;
//	BOOL startedGame;
	int timeInt;
	int gameMode;
}

@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLeft;
@property (weak, nonatomic) IBOutlet UILabel *totalScore;

- (IBAction)startGameBtn:(id)sender;
- (void)startCounter;
- (void)restartGame;
@end

