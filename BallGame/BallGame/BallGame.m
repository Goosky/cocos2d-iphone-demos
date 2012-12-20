//
//  BallGame.m
//  ballSend
//
//  Created by Podevor on 12-12-18.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "BallGame.h"
#import "CCBReader.h"

@implementation BallGame
- (void) didLoadFromCCB
{
    [self aceAnimation];
    [self cheeraAnimation];
    [self cheerbAnimation];
}

-(void) aceAnimation{
    NSMutableArray *acelist = [NSMutableArray arrayWithCapacity:4];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=3; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"ace%d.png", i]];
        [acelist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:acelist delay:0.8f / 3.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [ace runAction:runAction];
    
  /*  CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
   CCAnimation* animation = [CCAnimation animation];
	for( int i=0;i<=3;i++)
		[animation addSpriteFrame: [cache spriteFrameByName:[NSString stringWithFormat:@"ace%d.png", i]]];
    id action = [CCAnimate actionWithAnimation:animation];
    animation.delayPerUnit = 0.8f / 3.0f;
	animation.restoreOriginalFrame = YES;
    [ace runAction:[CCRepeatForever actionWithAction:[CCSequence actions: action, [action reverse], nil]]];*/
}

-(void) cheeraAnimation{
    NSMutableArray *cheeralist = [NSMutableArray arrayWithCapacity:4];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=14; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"cheera%d.png", i]];
        [cheeralist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:cheeralist delay:1.8f/ 14.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [cheera runAction:runAction];
    
  /*  CCAnimation* animation = [CCAnimation animation];
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
	for( int i=0;i<=12;i++)
		[animation addSpriteFrame: [cache spriteFrameByName:[NSString stringWithFormat:@"cheera%d.png", i]]];
    id action = [CCAnimate actionWithAnimation:animation];
    animation.delayPerUnit = 0.8f / 3.0f;
	animation.restoreOriginalFrame = YES;
    [cheera runAction:[CCRepeatForever actionWithAction:[CCSequence actions: action, [action reverse], nil]]];*/
}
-(void)cheerbAnimation{
    NSMutableArray *cheerblist = [NSMutableArray arrayWithCapacity:4];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=12; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"cheerb%d.png", i]];
        [cheerblist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:cheerblist delay:0.2f / 12.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [cheerb runAction:runAction];
  
    /*CCAnimation* animation = [CCAnimation animation];
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
	for( int i=0;i<=12;i++)
		[animation addSpriteFrame: [cache spriteFrameByName:[NSString stringWithFormat:@"cheerb%d.png", i]]];
    id action = [CCAnimate actionWithAnimation:animation];
    animation.delayPerUnit = 0.8f / 3.0f;
	animation.restoreOriginalFrame = YES;
    [cheerb runAction:[CCRepeatForever actionWithAction:[CCSequence actions: action, [action reverse], nil]]];*/
}
-(void) onEnter{
    CCLOG(@"enter");
    [super onEnter];
}

-(void) onExit{
    CCLOG(@"exit");
    [super onExit];
}
@end
