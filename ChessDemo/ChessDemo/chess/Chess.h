//
//  Chess.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "const.h"
#import "AppDelegate.h"

@interface Chess : CCLayer {
    CCSprite *card;
    CCSprite *card1;
    CCSprite *card2;
    CCSprite *card3;
    CCLabelTTF *remainderTime;
    NSTimer *remainderTimer;
    int gameTime;
    NSMutableArray *cards;
    NSMutableArray *chosenCards;
    BOOL isHeader;
    //player score
    int score;
    //delegate
    AppController *delegate;
}
@end
