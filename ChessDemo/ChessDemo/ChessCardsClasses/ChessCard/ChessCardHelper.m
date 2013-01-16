//
//  ChessCardHelper.m
//  Disney
//
//  Created by Podevor on 13-1-15.
//  Copyright (c) 2013年 Podevor. All rights reserved.
//

#import "ChessCardHelper.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"
#import "ChessCard.h"
#import "DbHepler.h"

@implementation ChessCardHelper
@synthesize parent = _parent;
@synthesize chessCards = _chessCards;
@synthesize chosenCards = _chosenCards;
@synthesize gameTime = _gameTime;

#pragma mark - delloc

- (void)dealloc{
    for (id obj in _chessCards) {
        [obj release];
    }
    [_chessCards release];
    [_parent release];
    [clearPartileTimer release];
    [bangTimer release];
    [rolloverBackTimer release];
    [remainderTimer release];
    [super dealloc];
}

static ChessCardHelper *shareChessCardHelper = nil;
+ (id)shareInstance{
    @synchronized(self){
        if(shareChessCardHelper == nil){
            shareChessCardHelper = [[self alloc] init];
        }
    }
    return shareChessCardHelper;
}


#pragma mark - init helper
- (id)init{
    if (self = [super init]) {
        _chosenCards = [NSMutableArray arrayWithCapacity:2];
        [_chosenCards retain];
        //init local cards array
        _chessCards = [NSMutableArray arrayWithCapacity:8];
        [_chessCards retain];
        bangTimer = nil;
        rolloverBackTimer = nil;
    }
    return self;
}

- (void)startGame{
    remainderTimer
    = [NSTimer scheduledTimerWithTimeInterval:kChangeTime target:self selector:@selector(changeRemainderTime)userInfo:nil repeats:YES];
    [remainderTimer retain];
}

- (void)changeRemainderTime{
    CCLOG(@"time == %d",_gameTime);
    if (_gameTime == 0){
        [self responseToParent:kGameTimeOut];
    }else{
        [[SimpleAudioEngine sharedEngine] playEffect:kClockEffect];
        _gameTime--;
    }
}

#pragma mark - rollover ,scale and change the spriteFrame

- (void)rolloverByIndex:(int)index rolloverTo:(BOOL)isHeader{
    //get sprite by index
    CCSprite *sprite = [_chessCards objectAtIndex:index];
    //package obj
    NSNumber *nIndex = [NSNumber numberWithInt:index];
    //one half rollover
    id oneHalfRollover = [CCScaleTo actionWithDuration:kHalfRolloverTime scaleX:kMidScaleX scaleY:kScaleY];
    id firstSeqAction = nil;
    if (isHeader){
        [[SimpleAudioEngine sharedEngine] playEffect:kClickEffect];
        firstSeqAction = [CCSequence actions:oneHalfRollover,
                          [CCCallFuncND actionWithTarget:self selector:@selector(replaceWithCard:data:)data:nIndex], nil];
    }else{
        firstSeqAction
        = [CCSequence actions:oneHalfRollover,[CCCallFuncND actionWithTarget:self selector:@selector(replaceWithHeader:data:)data:nIndex], nil];
    }
    [sprite runAction:firstSeqAction];
}


- (void)replaceWithCard:(id)sender data:(NSNumber*)nIndex {
    //format index
    int index = [nIndex intValue];
    CCSprite *sprite = [_chessCards objectAtIndex:index];
    //get old data
    int tag = sprite.tag;
    CGPoint oldPos = sprite.position;
    CGFloat oldScaleY = sprite.scaleY;
    [sprite removeFromParentAndCleanup:YES];
    //new sprite by tag
    sprite = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"image%d.png",tag]];
    sprite.tag = tag;
    sprite.position = oldPos;
    [sprite setScaleX:kMidScaleX];
    [sprite setScaleY:oldScaleY];
    [_parent addChild:sprite];
    //another half rollover
    id anotherHalfRollover = [CCScaleTo actionWithDuration:kHalfRolloverTime scaleX:kScaleX scaleY:kScaleY];
    [sprite runAction:anotherHalfRollover];
    //replace sprite
    [_chessCards replaceObjectAtIndex:index withObject:sprite];
}

- (void)replaceWithHeader:(id)sender data:(NSNumber*)nIndex {
    //format index
    int index = [nIndex intValue];
    CCSprite *sprite = [_chessCards objectAtIndex:index];
    //get old data
    int tag = sprite.tag;
    CGPoint oldPos = [sprite position];
    CGFloat oldScaleY = sprite.scaleY;
    [sprite removeFromParentAndCleanup:YES];
    //new sprite by tag
    sprite = [CCSprite spriteWithFile:kHeaderImageName];
    sprite.tag = tag;
    sprite.position = oldPos;
    [sprite setScaleX:kMidScaleX];
    [sprite setScaleY:oldScaleY];
    [_parent addChild:sprite];
    //another half rollover
    id anotherHalfRollover = [CCScaleTo actionWithDuration:kHalfRolloverTime scaleX:kScaleX scaleY:kScaleY];
    [sprite runAction:anotherHalfRollover];
    //replace sprite
    [_chessCards replaceObjectAtIndex:index withObject:sprite];
}


#pragma mark - random the card sprite tag

- (void)randomTagWithCards:(NSMutableArray*)cards{
    //empty old obj
    [_chessCards removeAllObjects];
    //card list
    NSMutableArray *allCards = [NSMutableArray arrayWithCapacity:0];
    for (int cardIndex = 1; cardIndex <= kCardsCount; cardIndex++){
        [allCards addObject:[self index:cardIndex]];
    }
    //tag list
    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < cards.count/2; i++){
        int index = arc4random()%allCards.count;
        [tags addObject:[allCards objectAtIndex:index]];
        [tags addObject:[allCards objectAtIndex:index]];
        [allCards removeObjectAtIndex:index];
    }
    //set tag for sprite
    for (CCSprite* sprite in cards){
        //add obj to local cards
        [_chessCards addObject:sprite];
        int index  = arc4random()%tags.count;
        sprite.tag = [[tags objectAtIndex:index] intValue];
        [tags removeObjectAtIndex:index];
    }
}

#pragma mark - common
- (NSNumber*)index:(int)index{
    return [NSNumber numberWithInt:index];
}

- (CGRect)rectInPixels:(CCSprite*)sprite{
	CGSize s = [[sprite texture] contentSizeInPixels];
    return CGRectMake(-s.width/2, -s.height/2, s.width, s.height);
    //return CGRectMake(-s.width/4.0f, -s.height/4.0f, s.width*0.5f, s.height*0.5f);
}


#pragma mark - check card is the same or not

- (void)checkCard{
    if ([_chosenCards count] == 2){
        _parent.touchEnabled = NO;
        int firstIndex = [[_chosenCards objectAtIndex:0] intValue];
        int secondIndex = [[_chosenCards objectAtIndex:1] intValue];
        CCSprite *firstChoose = [_chessCards objectAtIndex:firstIndex];
        CCSprite *secondChoose = [_chessCards objectAtIndex:secondIndex];
        if ( firstChoose.tag == secondChoose.tag){
            //the same card
            //compute rollover card score
            // [self computeRolloverCardScore];
            bangTimer = [NSTimer scheduledTimerWithTimeInterval:kShowSameCardTime
                                             target:self selector:@selector(bangAnimation)userInfo:nil repeats:NO];
            [bangTimer retain];
        }else{
            //not same
            errorTimes++;
           rolloverBackTimer = [NSTimer scheduledTimerWithTimeInterval:kRolloverBckDelayTime
                                             target:self selector:@selector(rolloverBack)userInfo:nil repeats:NO];
            [rolloverBackTimer retain];
        }
        //[self updateScore];//update the score label
    }
}

- (void)bangAnimation{
    //NSMutableArray *cards = [[ChessCardHelper shareInstance] chessCards];
    int firstIndex = [[_chosenCards objectAtIndex:0] intValue];
    int secondIndex = [[_chosenCards objectAtIndex:1] intValue];
    CCSprite *firstChoose = [_chessCards objectAtIndex:firstIndex];
    CCSprite *secondChoose = [_chessCards objectAtIndex:secondIndex];
    CCParticleSystem *firstBang = [CCParticleSystemQuad particleWithFile:kParticaleName];
    firstBang.position = firstChoose.position;
    // [firstChoose runAction:scale];
    [_parent addChild:firstBang z:0 tag:kFirstBang];
    CCParticleSystem *secondBang = [CCParticleSystemQuad particleWithFile:kParticaleName];
    secondBang.position = secondChoose.position;
    // [secondChoose runAction:scale];
    [_parent addChild:secondBang z:0 tag:kSecondBang];
    //clear
    [firstChoose removeFromParentAndCleanup:YES];
    [secondChoose removeFromParentAndCleanup:YES];
    [_chessCards removeObjectAtIndex:[_chessCards indexOfObject:firstChoose]];
    [_chessCards removeObjectAtIndex:[_chessCards indexOfObject:secondChoose]];
    //clear the choose list
    [_chosenCards removeAllObjects];
    //clear the particles
    clearPartileTimer = [NSTimer scheduledTimerWithTimeInterval:kClearPartileTime
                                                         target:self selector:@selector(clearParticales)userInfo:nil repeats:NO];
    [clearPartileTimer retain];
}

- (void)clearParticales{
    id f = [_parent getChildByTag:kFirstBang];
    [f removeFromParentAndCleanup:YES];
    id s = [_parent getChildByTag:kSecondBang];
    [s removeFromParentAndCleanup:YES];
    //play effect
    [[SimpleAudioEngine sharedEngine] playEffect:kClearEffect];
    
    //check win or not
    
    if ([_chessCards count] != 0){
        _parent.touchEnabled = YES;
    }else{
        if (_gameTime != 0){//success
            [self responseToParent:kGameSuccess];
        }else{//failure
            [self responseToParent:kGameFailure];
        }
    }
}

#pragma mark - response to parent

- (void)responseToParent:(ParentResponse)res{
    
    _parent.touchEnabled = NO;
    if (remainderTimer!= nil) {
        [remainderTimer invalidate];
    }    
    if (clearPartileTimer != nil) {
        [clearPartileTimer invalidate];
    }
    if (bangTimer != nil) {
        [bangTimer invalidate];
    }
    if (rolloverBackTimer != nil) {
        [rolloverBackTimer invalidate];
    }
    bangTimer = nil;
    rolloverBackTimer = nil;
    remainderTimer = nil;
    clearPartileTimer = nil;
    
    id p = nil;
    switch (res) {
        case kGameSuccess:
        {
            //call parent win process
            AppController *delegate = (AppController*) [[UIApplication sharedApplication] delegate];
            int score = 0;
            id p = nil;
            switch (delegate.chessCardRound) {
                case kChessCardA:{
                    score = kChessCardRoundAScore;
                }
                    break;
                    
                case kChessCardB:{
                    score = kChessCardRoundBScore;
                }
                    break;
                case kChessCardC:{
                    score = kChessCardRoundCScore;
                }
                    break;
                case kChessCardD:{
                    score = kChessCardRoundDScore;
                }
                    break;
                case kChessCardE:{
                    score = kChessCardRoundEScore;
                }
                    break;
                case kChessCardF:{
                    score = kChessCardRoundFScore;
                }
                    break;
                case kChessCardG:{
                    score = kChessCardRoundGScore;
                }
                    break;
            }
            p = [self currentRound];
            [p gameSuccess];
            //save score
            delegate.chessCardScore += score;//current game score
            [[DbHepler shareInstance] saveScore:score];//player total score
        }
            break;
            
        case kGameFailure:
        {
            p = [self currentRound];
            [p gameFailure];
        }
            break;
        case kGameTimeOut:
        {
          
            [_chosenCards removeAllObjects];
            //response to parent
            p = [self currentRound];
            [p gameTimeOut];
        }
            break;
    }
}

- (id)currentRound{
    AppController *delegate = (AppController*) [[UIApplication sharedApplication] delegate];
    id p = nil;
    switch (delegate.chessCardRound) {
        case kChessCardA:{//Round A cocobuilder parent class
            p = (ChessCard*)_parent;
            // [p playAgain];
        }
            break;
            
        case kChessCardB:{
            p = (ChessCard*)_parent;
        }
            break;
        case kChessCardC:{
            p = (ChessCard*)_parent;
        }
            break;
        case kChessCardD:{
            p = (ChessCard*)_parent;
        }
            break;
        case kChessCardE:{
            p = (ChessCard*)_parent;
        }
            break;
        case kChessCardF:{
            p = (ChessCard*)_parent;
        }
            break;
        case kChessCardG:{
            p = (ChessCard*)_parent;
        }
            break;
    }
    return p;
}

#pragma mark - rollover back the error cards

- (void)rolloverBack{
    int firstIndex = [[_chosenCards objectAtIndex:0] intValue];
    int secondIndex = [[_chosenCards objectAtIndex:1] intValue];
    //rollover back
    [self rolloverByIndex:firstIndex rolloverTo:NO];
    [self rolloverByIndex:secondIndex rolloverTo:NO];
    //clear the choose list
    [_chosenCards removeAllObjects];
    _parent.touchEnabled = YES;
}


#pragma mark - dispatch touch event
- (void)touchProcess:(UITouch *)touch{
    //NSMutableArray *chosenCards = [[ChessCardHelper shareInstance] chosenCards];
   // NSMutableArray *cards = [[ChessCardHelper shareInstance] chessCards];
    for (int index = 0; index < _chessCards.count; index++){
        CGRect r = [[ChessCardHelper shareInstance] rectInPixels:[_chessCards objectAtIndex:index]];
        CGPoint p = [[_chessCards objectAtIndex:index] convertTouchToNodeSpaceAR:touch];
        if (CGRectContainsPoint(r, p)){
            if (![_chosenCards containsObject:[NSNumber numberWithInt:index]]
                && [_chosenCards count] < 2){
                //rollover card
                [self rolloverByIndex:index rolloverTo:YES];
                //add chosen card
                [_chosenCards addObject:[NSNumber numberWithInt:index]];
            }
        }
    }
    //check the card is the same or not
    [self checkCard];
}
@end
