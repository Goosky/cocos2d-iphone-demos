//
//  Chess.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Chess : CCLayer {
    CCSprite *card;
    CCSprite *card1;
    CCSprite *card2;
    CCSprite *card3;
    NSMutableArray *cards;
    NSMutableArray *chosenCards;
    BOOL isHeader;
}

@end
