//
//  Chess.m
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Chess.h"
#import "CCBReader.h"
#import "const.h"
#import "SimpleAudioEngine.h"

@implementation Chess

-(void) dealloc{
    [super dealloc];
    for (id obj in cards) {
        [obj release];
    }
    [cards release];
    for (id obj in chosenCards) {
        [obj release];
    }
    [chosenCards release];
}

-(void) didLoadFromCCB{
    cards = [NSMutableArray arrayWithCapacity:0];
    chosenCards = [NSMutableArray arrayWithCapacity:0];
    [cards addObject:card];
    [cards addObject:card1];
    [cards addObject:card2];
    [cards addObject:card3];
    [cards retain];
    [chosenCards retain];
    isHeader = YES;
    //load effect    
    [[SimpleAudioEngine sharedEngine] preloadEffect:kClickEffect];
    [[SimpleAudioEngine sharedEngine] preloadEffect:kClearEffect];
}


#pragma mark - rollover ,scale and change the spriteFrame

-(void)rolloverByIndex:(int) index { //play effect
    if (isHeader) {
        [[SimpleAudioEngine sharedEngine] playEffect:kClickEffect];
    }
    //get sprite by index
    CCSprite *sprite = [cards objectAtIndex:index];
    //package obj
    NSNumber *nIndex = [NSNumber numberWithInt:index];
    //one half rollover
    id oneHalfRollover = [CCScaleTo actionWithDuration:kHalfRolloverTime scaleX:kMidScaleX scaleY:kScaleY];
    id firstSeqAction = [CCSequence actions:oneHalfRollover,
                         [CCCallFuncND actionWithTarget:self selector:@selector(changeSprite:data:) data:nIndex], nil];
    [sprite runAction:firstSeqAction];
}


-(void) changeSprite:(id) sender data:(NSNumber*) nIndex{
    //format index
    int index = [nIndex intValue];    
    CCSprite *sprite = [cards objectAtIndex:index];
    //get old data
    int tag = sprite.tag;
    CGPoint oldPos = [sprite position];
    [sprite removeFromParentAndCleanup:YES];
    //new sprite by tag
    if (isHeader) {
        sprite = [CCSprite spriteWithFile:kTailImageName];
    }else{
        sprite = [CCSprite spriteWithFile:kHeaderImageName];
    }
    sprite.tag = tag;
    sprite.position = oldPos;
    [sprite setScaleX:kMidScaleX];
    [self addChild:sprite];
    //another half rollover
    id anotherHalfRollover = [CCScaleTo actionWithDuration:kHalfRolloverTime scaleX:kScaleX scaleY:kScaleY];
    [sprite runAction:anotherHalfRollover];
    //replace sprite
    [cards replaceObjectAtIndex:index withObject:sprite];
}

#pragma mark - common 

- (CGRect)rectInPixels:(CCSprite*) sprite
{
	CGSize s = [[sprite texture] contentSizeInPixels];
    return CGRectMake(-s.width/2, -s.height/2, s.width, s.height);
}

-(NSNumber*) index:(int) index{
    return [NSNumber numberWithInt:index];
}

#pragma mark - dispatch touch event

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{ 
    CCLOG(@"begin");
    BOOL result = NO;
    result = [super ccTouchBegan:touch withEvent:event] && result;

    return result;
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"move");
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{    
    UITouch *touch = [touches anyObject];
    for (int index = 0; index < [cards count]; index++) {
        CGRect r = [self rectInPixels:[cards objectAtIndex:index]];
        CGPoint p = [[cards objectAtIndex:index] convertTouchToNodeSpaceAR:touch];
        if (CGRectContainsPoint(r, p)) {
            if (![chosenCards containsObject:[self index:index]]
                && [chosenCards count] <= 2) {
                isHeader = YES;
                //rollover card
                [self rolloverByIndex:index];
                //add chose list
                [chosenCards addObject:[self index:index]];
            }
        }
    }
    //check the card is the same or not
    [self checkCard];
}


#pragma mark - check card is the same or not
-(void) checkCard{
    if ([chosenCards count] == 2) {
        self.isTouchEnabled = NO;
        int firstIndex = [[chosenCards objectAtIndex:0] intValue];
        int secondIndex = [[chosenCards objectAtIndex:1] intValue];
        CCSprite *firstChoose = [cards objectAtIndex:firstIndex];
        CCSprite *secondChoose = [cards objectAtIndex:secondIndex];
        if ( firstChoose.tag == secondChoose.tag) {
            //the same card
            [NSTimer scheduledTimerWithTimeInterval:kShowSameCardTime
                                             target:self selector:@selector(bangAnimation) userInfo:nil repeats:NO];
        }else{
            //not same
            [NSTimer scheduledTimerWithTimeInterval:kRolloverBckDelayTime
                                             target:self selector:@selector(rolloverBack) userInfo:nil repeats:NO];
        }
    }
}

-(void) bangAnimation{
    int firstIndex = [[chosenCards objectAtIndex:0] intValue];
    int secondIndex = [[chosenCards objectAtIndex:1] intValue];
    CCSprite *firstChoose = [cards objectAtIndex:firstIndex];
    CCSprite *secondChoose = [cards objectAtIndex:secondIndex];
    CCParticleSystem *firstBang = [CCParticleSystemQuad particleWithFile:kParticaleName];
    firstBang.position = firstChoose.position;
    // [firstChoose runAction:scale];
    [self addChild:firstBang z:0 tag:kFirstBang];
    CCParticleSystem *secondBang = [CCParticleSystemQuad particleWithFile:kParticaleName];
    secondBang.position = secondChoose.position;
    // [secondChoose runAction:scale];
    [self addChild:secondBang z:0 tag:kSecondBang];
    //clear
    [firstChoose removeFromParentAndCleanup:YES];
    [secondChoose removeFromParentAndCleanup:YES];
    [cards removeObjectAtIndex:[cards indexOfObject:firstChoose]];
    [cards removeObjectAtIndex:[cards indexOfObject:secondChoose]];
    //clear the choose list
    [chosenCards removeAllObjects];
    //clear the particles
    [NSTimer scheduledTimerWithTimeInterval:kClearPartileTime
                                     target:self selector:@selector(clearParticales) userInfo:nil repeats:NO];
}

-(void) clearParticales{
    id f = [self getChildByTag:kFirstBang];
    [f removeFromParentAndCleanup:YES];
    id s = [self getChildByTag:kSecondBang];
    [s removeFromParentAndCleanup:YES];
    //play effect    
    [[SimpleAudioEngine sharedEngine] playEffect:kClearEffect];
   
    //check win or not
    [self checkWon];
    [NSTimer scheduledTimerWithTimeInterval:kOpenTouchTime
                                     target:self selector:@selector(openTouch) userInfo:nil repeats:NO];
}


-(void) checkWon{
    if ([cards count] == 0) {
        CCLOG(@"won");
    }
}

-(void) rolloverBack{
    int firstIndex = [[chosenCards objectAtIndex:0] intValue];
    int secondIndex = [[chosenCards objectAtIndex:1] intValue];
    //rollover back
    isHeader = NO;
    [self rolloverByIndex:firstIndex];
    [self rolloverByIndex:secondIndex];
    //clear the choose list
    [chosenCards removeAllObjects];
    [NSTimer scheduledTimerWithTimeInterval:kOpenTouchTime
                                     target:self selector:@selector(openTouch) userInfo:nil repeats:NO];
}

-(void) openTouch{
     self.isTouchEnabled = YES;
}
@end
