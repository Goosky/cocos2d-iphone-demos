//
//  Chess.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AppDelegate.h"

@interface Chess : CCLayer {
    CCSprite *card;
    CCSprite *card1;
    CCSprite *card2;
    CCSprite *card3;
    CCSprite *gray;
    CCLabelTTF *remainderTime;
    CCLabelTTF *userLabel;
    CCLabelTTF *scoreLabel;
    NSTimer *remainderTimer;
    int gameTime;
    NSMutableArray *cards;
    NSMutableArray *chosenCards;
    //player score
    int score;
    NSString *userName;
    int errorTimes;
    //delegate
    AppController *delegate;
}
@end
