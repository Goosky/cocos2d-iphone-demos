//
//  ChessCardHelper.h
//  Disney
//
//  Created by Podevor on 13-1-15.
//  Copyright (c) 2013年 Podevor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "const.h"
#import "cocos2d.h"

@interface ChessCardHelper : NSObject{
    NSMutableArray *_chessCards;
    NSMutableArray *_chosenCards;
    CCLayer *_parent;
    int errorTimes;
    NSTimer *clearPartileTimer;
    NSTimer *remainderTimer;
    NSTimer *bangTimer;
    NSTimer *rolloverBackTimer;
    int _gameTime;
}
@property (nonatomic,retain) CCLayer *parent;
@property (nonatomic,retain) NSMutableArray *chessCards;
@property (nonatomic,retain) NSMutableArray *chosenCards;
@property (nonatomic) int gameTime;
+ (id)shareInstance;
- (void)randomTagWithCards:(NSMutableArray*)cards;
/*- (void)rolloverByIndex:(int)index rolloverTo:(BOOL)isHeader;
- (void)replaceWithCard:(id)sender data:(NSNumber*)nIndex;
- (void)replaceWithHeader:(id)sender data:(NSNumber*)nIndex;
- (CGRect)rectInPixels:(CCSprite*)sprite;
- (NSNumber*)index:(int)index;
- (void)checkCard;*/
- (void)startGame;
- (void)touchProcess:(UITouch *)touch;
@end
