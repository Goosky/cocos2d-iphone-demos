//
//  BallGame.h
//  ballSend
//
//  Created by Podevor on 12-12-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCControlButton.h"

enum kKickId {
    kLeftUp = 1,
    kRightUp = 2,
    kLeftDown = 3,
    kRightDown = 4
    };

@interface BallGame : CCLayer {
    CCSprite* ball;
    CCSprite* ace;
    CCSprite* cheera;
    CCSprite* cheerb;
    CCSprite* cheerc;
    CCSprite* cheerd;
    CCSprite* player;
    CCSprite* keeper;
    CCControlButton *btnA;
    CCControlButton *btnB;
    CCControlButton *btnC;    
    CCControlButton *btnD;
    int kickId;
    CGPoint aimPos;
    int keeperAnimationId;
    CCSprite* success;
    CCSprite* fail;
}

@end
