//
//  Chess.m
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ChessCard.h"
#import "CCControlButton.h"
#import "const.h"
#import "CCBReader.h"
#import "ChessCardHelper.h"
#import "CCBSwitchHelper.h"
#import "SimpleAudioEngine.h"

@implementation ChessCard

#pragma mark - init all variables

- (void)didLoadFromCCB{
    [self initGame];
}

- (void)initGame{   
    [self initConf];
    [self initCards];
    [self updateScore];
    [self startGame];  
}

- (void)initConf{
   self.touchEnabled = NO;
   /* if (isIphone5) {
        [bg setScaleX:kIphone5ScaleX];
    }*/
    //set parent
    [[ChessCardHelper shareInstance] setParent:self];
    [[ChessCardHelper shareInstance] setGameTime:kGameTime];
}

- (void)initCards{
    NSMutableArray *tempCards = [NSMutableArray arrayWithCapacity:0];
    [tempCards addObject:card0];
    [tempCards addObject:card1];
    [tempCards addObject:card2];
    [tempCards addObject:card3];
    [tempCards retain];
    [[ChessCardHelper shareInstance] randomTagWithCards:tempCards];
    [tempCards release];  
}

#pragma mark - startaGame

- (void)startGame{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:kBackground loop:YES];
    [[ChessCardHelper shareInstance] startGame];
    self.touchEnabled = YES;
}

#pragma mark - common

- (void)updateScore{
}

#pragma mark - game state

- (void)gameSuccess{
    [[CCBSwitchHelper shareInstance] switchSceneWithResponse:kGameSuccess];
}

- (void)gameFailure{
    [[CCBSwitchHelper shareInstance] switchSceneWithResponse:kGameFailure];
}

- (void)gameTimeOut{
    [[CCBSwitchHelper shareInstance] switchSceneWithResponse:kGameTimeOut];
}

- (void)playAgain{
    [[CCBSwitchHelper shareInstance] playerAgain];
}


#pragma mark - dispatch touch event

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    [[ChessCardHelper shareInstance] touchProcess:touch];
   /* NSMutableArray *chosenCards = [[ChessCardHelper shareInstance] chosenCards];
    NSMutableArray *cards = [[ChessCardHelper shareInstance] chessCards];
    for (int index = 0; index < [cards count]; index++){
        CGRect r = [[ChessCardHelper shareInstance] rectInPixels:[cards objectAtIndex:index]];
        CGPoint p = [[cards objectAtIndex:index] convertTouchToNodeSpaceAR:touch];
        if (CGRectContainsPoint(r, p)){
            if (![chosenCards containsObject:[NSNumber numberWithInt:index]]
                && [chosenCards count] < 2){
                //rollover card
                [[ChessCardHelper shareInstance] rolloverByIndex:index rolloverTo:YES];
                //add chosen card
                [chosenCards addObject:[NSNumber numberWithInt:index]];
            }
        }
    }
    //check the card is the same or not
    [[ChessCardHelper shareInstance] checkCard];*/
}

@end
