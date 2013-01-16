//
//  Chess.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChessCardRoundB : CCLayer {
    //vars from ccb
    CCSprite *card0;
    CCSprite *card1;
    CCSprite *card2;
    CCSprite *card3;
    CCSprite *card4;
    CCSprite *card5;
   // CCSprite *grayBg;
    CCSprite *bg;
}
- (void)gameSuccess;
- (void)gameFailure;
- (void)gameTimeOut;
- (void)playAgain;
@end
