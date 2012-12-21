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
    [self cheercAnimation];
    [self cheerdAnimation];
    [self keeperAnimation];
}

-(void) playerRun{
    //self animation
    NSMutableArray *playerlist = [NSMutableArray arrayWithCapacity:12];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=12; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"prun00%02d.png", i]];
        [playerlist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:playerlist delay:0.05f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [player runAction:runAction];
    //move animation
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    //ball size
    CGSize ballSize = [ball contentSize];
    id actionTo = [CCMoveTo actionWithDuration: 0.9f
                                      position:ccp(winSize.width*39.2/100-ballSize.width/2-20,winSize.height*8.1/100-ballSize.height/2)];
    id action = [CCSequence actions:actionTo,
				 [CCCallFunc actionWithTarget:self selector:@selector(kickAnimation)],nil];
    [player runAction:action];
}

-(void) kickAnimation{
    [player stopAllActions];
    NSMutableArray *playerKicklist = [NSMutableArray arrayWithCapacity:24];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=24; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"kick00%02d.png", i]];
        [playerKicklist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:playerKicklist delay:0.8f / 11.0f];
    id action = [CCSequence actions:[CCAnimate actionWithAnimation:animation],
                 [CCCallFunc actionWithTarget:self selector:@selector(ballAnimation)],nil];
    [player runAction:action];
}


-(void) ballAnimation{
    //ball move
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id actionTo = [CCMoveTo actionWithDuration: 2
                                      position:ccp(aimPos.x+winSize.width*0.12,aimPos.y)];//ccp(winSize.width*38.3,winSize.height*48.1)
    
    id action = [CCSequence actions:actionTo,
                 [CCCallFunc actionWithTarget:self selector:@selector(stopBallAnimation)],nil];
    [ball runAction:action];
    //ball rate
    NSMutableArray *balllist = [NSMutableArray arrayWithCapacity:24];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=24; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"football_00%02d.png", i]];
        [balllist addObject:frame];
    }
    CCAnimation *ballAnimation = [CCAnimation animationWithSpriteFrames:balllist delay:0.01f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:ballAnimation]];
    [ball runAction:runAction];
    //ball scale    
	id actionScaleTo = [CCScaleTo actionWithDuration: 2 scale:0.5f];
    [ball runAction:actionScaleTo];
    //player other animation
    NSMutableArray *playerKicklist = [NSMutableArray arrayWithCapacity:11];
    for (int i=25; i<=36; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"kick00%02d.png", i]];
        [playerKicklist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:playerKicklist delay:0.8f / 11.0f];
    [player runAction:[CCAnimate actionWithAnimation:animation]];
}

-(void) stopBallAnimation{
    [ball stopAllActions];
    [keeper stopAllActions];
}

-(void) keeperAnimation{
    NSMutableArray *keeperlist = [NSMutableArray arrayWithCapacity:11];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=11; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"stand00%02d.png", i]];
        [keeperlist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:keeperlist delay:0.2f / 3.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [keeper runAction:runAction];
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
    NSMutableArray *cheeralist = [NSMutableArray arrayWithCapacity:15];
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
    NSMutableArray *cheerblist = [NSMutableArray arrayWithCapacity:13];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=12; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"cheerb%d.png", i]];
        [cheerblist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:cheerblist delay:1.8f / 12.0f];
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

-(void) cheercAnimation{
    NSMutableArray *cheeralist = [NSMutableArray arrayWithCapacity:13];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=12; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"cheerb%d.png", i]];
        [cheeralist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:cheeralist delay:1.8f/ 14.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [cheerc runAction:runAction];
    
    /*  CCAnimation* animation = [CCAnimation animation];
     CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
     for( int i=0;i<=12;i++)
     [animation addSpriteFrame: [cache spriteFrameByName:[NSString stringWithFormat:@"cheerb%d.png", i]]];
     id action = [CCAnimate actionWithAnimation:animation];
     animation.delayPerUnit = 0.8f / 3.0f;
     animation.restoreOriginalFrame = YES;
     [cheerc runAction:[CCRepeatForever actionWithAction:[CCSequence actions: action, [action reverse], nil]]];*/
}

-(void) cheerdAnimation{
    NSMutableArray *cheeralist = [NSMutableArray arrayWithCapacity:15];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=0; i<=14; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"cheera%d.png", i]];
        [cheeralist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:cheeralist delay:1.8f/ 14.0f];
    CCAction  *runAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:animation]];
    [cheerd runAction:runAction];
    
    /*  CCAnimation* animation = [CCAnimation animation];
     CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
     for( int i=0;i<=12;i++)
     [animation addSpriteFrame: [cache spriteFrameByName:[NSString stringWithFormat:@"cheera%d.png", i]]];
     id action = [CCAnimate actionWithAnimation:animation];
     animation.delayPerUnit = 0.8f / 3.0f;
     animation.restoreOriginalFrame = YES;
     [cheerd runAction:[CCRepeatForever actionWithAction:[CCSequence actions: action, [action reverse], nil]]];*/
}
-(void) onEnter{
    [super onEnter];
}

-(void) onExit{
    [super onExit];
}


-(void) keeperLeftAnimation{
    [keeper stopAllActions];
    //move
    id actionTo = [CCMoveTo actionWithDuration: 0.5
                                      position:ccp(keeper.position.x-60,keeper.position.y)];//ccp(winSize.width*38.3,winSize.height*48.1)
    
    [keeper runAction:actionTo];
    //left animation
    NSMutableArray *keeperLeftlist = [NSMutableArray arrayWithCapacity:22];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=22; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"left00%02d.png", i]];
        [keeperLeftlist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:keeperLeftlist delay:0.2f / 3.0f];
    [keeper runAction:[CCAnimate actionWithAnimation:animation]];
}

-(void) keeperRightAnimation{
    NSMutableArray *keeperLeftlist = [NSMutableArray arrayWithCapacity:22];
    CCSpriteFrameCache *spriteFrameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
    for (int i=1; i<=22; i++) {
        CCSpriteFrame *frame = [spriteFrameCache spriteFrameByName:[NSString stringWithFormat:@"right00%02d.png", i]];
        [keeperLeftlist addObject:frame];
    }
    CCAnimation *animation = [CCAnimation animationWithSpriteFrames:keeperLeftlist delay:0.2f / 3.0f];
    [keeper runAction:[CCAnimate actionWithAnimation:animation]];
}

-(void) pressReset:(id) sender{
    CCLOG(@"reset");    
    CCScene *scence = [CCBReader sceneWithNodeGraphFromFile:@"main.ccbi"];
    [[CCDirector sharedDirector] replaceScene:scence];
}

-(void) pressA:(id) sender{    
    CCLOG(@"A");
    [self removeAllBtn];
    kickId = kLeftUp;
    aimPos = btnA.position;
    [self playerRun];
    [self keeperRandomAnimation];
}
-(void) pressB:(id) sender{
    CCLOG(@"B");
    [self removeAllBtn];
    kickId = kRightUp;
    aimPos = btnB.position;
    [self playerRun];
    [self keeperRandomAnimation];
}
-(void) pressC:(id) sender{
    CCLOG(@"C");
    [self removeAllBtn];
    kickId = kLeftDown;
    aimPos = btnC.position;
    [self playerRun];
    [self keeperRandomAnimation];
}
-(void) pressD:(id) sender{
    CCLOG(@"D");
    [self removeAllBtn];
    kickId = kRightDown;
    aimPos = btnD.position;
    [self playerRun];
    [self keeperRandomAnimation];
}

-(void) keeperRandomAnimation{
    keeperAnimationId = arc4random()%4+1;
    
    CCLOG(@"keeperAnimationId %d",keeperAnimationId);
    if (keeperAnimationId == 1
        || keeperAnimationId == 3) {
        [NSTimer scheduledTimerWithTimeInterval:3.8f target:self selector:@selector(keeperLeftAnimation) userInfo:nil repeats:NO];
       
    }else{        
        [NSTimer scheduledTimerWithTimeInterval:3.8f target:self selector:@selector(keeperRightAnimation) userInfo:nil repeats:NO];
    }
    [NSTimer scheduledTimerWithTimeInterval:4.8f target:self selector:@selector(gameOver) userInfo:nil repeats:NO];
}
-(void) gameOver{    
    if (((keeperAnimationId == kLeftUp || keeperAnimationId == kLeftDown) && (kickId == kLeftUp || kickId == kLeftDown))
        ||((keeperAnimationId == kRightUp || keeperAnimationId == kRightDown) && (kickId == kRightUp || kickId == kRightDown))) {
        CCLOG(@"success");
        [self successAnimation];
    }else{
        CCLOG(@"fail");
        [self failAnimation];
    }
}

-(void) successAnimation{
    CGSize winSize = [[CCDirector sharedDirector]winSize];
    id actionTo = [CCMoveTo actionWithDuration: 1.5
                                      position:ccp(fail.position.x,winSize.height/2)];
    id action = [CCSequence actions:actionTo,
                 [CCCallFunc actionWithTarget:self selector:@selector(pressReset:)],nil];
    
    [success runAction:action];
}

-(void) failAnimation{
    CGSize winSize = [[CCDirector sharedDirector]winSize];
    id actionTo = [CCMoveTo actionWithDuration: 1.5
                                      position:ccp(fail.position.x,winSize.height/2)];
    id action = [CCSequence actions:actionTo,
                 [CCCallFunc actionWithTarget:self selector:@selector(pressReset:)],nil];
    
    [fail runAction:action];
}

-(void) removeAllBtn{
    [btnA removeFromParentAndCleanup:YES];
    [btnB removeFromParentAndCleanup:YES];
    [btnC removeFromParentAndCleanup:YES];
    [btnD removeFromParentAndCleanup:YES];
}
@end
