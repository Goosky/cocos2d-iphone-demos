//
//  Chess.m
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Chess.h"
#import "CCBReader.h"
#import "CCControlButton.h"
#import "SimpleAudioEngine.h"
#import "Player.h"
#import "AppDelegate.h"

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
    [delegate release];
    [openTouchTimer release];
}
#pragma mark - init all variables
-(void) didLoadFromCCB{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    cards = [NSMutableArray arrayWithCapacity:0];
    chosenCards = [NSMutableArray arrayWithCapacity:0];
    [cards addObject:card];
    [cards addObject:card1];
    [cards addObject:card2];
    [cards addObject:card3];
    [cards retain];
    [chosenCards retain];
    [self randomTag];
    isHeader = YES;
    //game time
    gameTime = kGameTime;
    // init delegate
    delegate = (AppController*) [[UIApplication sharedApplication] delegate];
    [delegate retain];
    userName = delegate.userName;
    //timer    
    remainderTimer = [NSTimer scheduledTimerWithTimeInterval:kGameStartRemainderTime target:self selector:@selector(startGame) userInfo:nil repeats:NO];
    //remainder label
    CGPoint remainderTimePos = remainderTime.position;
    [remainderTime removeFromParentAndCleanup:YES];
    remainderTime = [CCLabelTTF labelWithString:kRemainder fontName:@"Arial" fontSize:20];
    remainderTime.position = remainderTimePos;
    [self addChild:remainderTime];
    //score label
    CGPoint scoreLabelPos = scoreLabel.position;
    [scoreLabel removeFromParentAndCleanup:YES];
    scoreLabel = [CCLabelTTF labelWithString:kScoreRemainder fontName:@"Arial" fontSize:20];
    scoreLabel.position = scoreLabelPos;
    [self addChild:scoreLabel];
    //set score
    //init player info
    Player *player = [self pullData];
    score = [[player userScore] intValue];
    [self updateScore];
}

#pragma mark - changeRemainderTimeLabel

-(void) reStart{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"chess.ccbi"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

-(void) startGame{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:kBackground loop:YES];
    remainderTimer = [NSTimer scheduledTimerWithTimeInterval:kChangeTime target:self selector:@selector(changeRemainderTimeLabel) userInfo:nil repeats:YES];
}

-(void) changeRemainderTimeLabel{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [remainderTime setString:[NSString stringWithFormat:@"%@%d",kRemainderInfo,gameTime]];
    if (gameTime == 0) {
        [remainderTimer invalidate];
        [remainderTime setString:kGameOver];
        self.isTouchEnabled = NO;
    }else{
        [[SimpleAudioEngine sharedEngine] playEffect:kClockEffect];
        gameTime--;        
    }
}

#pragma mark - random the card sprite tag

-(void) randomTag{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    //card list
    NSMutableArray *allCards = [NSMutableArray arrayWithCapacity:0];
    for (int cardIndex = 1; cardIndex <= kCardsCount; cardIndex++) {
        [allCards addObject:[self index:cardIndex]];
    }
    //tag list
    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < cards.count/2; i++) {
        int index = arc4random()%allCards.count;
        [tags addObject:[allCards objectAtIndex:index]];
        [tags addObject:[allCards objectAtIndex:index]];
        [allCards removeObjectAtIndex:index];
    }
    //set tag for sprite
    for (CCSprite* sprite in cards) {
        int index  = arc4random()%tags.count;        
        sprite.tag = [[tags objectAtIndex:index] intValue];
        [tags removeObjectAtIndex:index];
    }
}

#pragma mark - rollover ,scale and change the spriteFrame

-(void)rolloverByIndex:(int) index { //play effect
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
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
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    //format index
    int index = [nIndex intValue];    
    CCSprite *sprite = [cards objectAtIndex:index];
    //get old data
    int tag = sprite.tag;
    CGPoint oldPos = [sprite position];
    [sprite removeFromParentAndCleanup:YES];
    //new sprite by tag
    if (isHeader) {
        sprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"image%d.png",tag]];
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


-(void) updateScore{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    [scoreLabel setString:[NSString stringWithFormat:@"%@%d",kScoreRemainder,score]];
}

- (CGRect)rectInPixels:(CCSprite*) sprite
{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
	CGSize s = [[sprite texture] contentSizeInPixels];
    return CGRectMake(-s.width/2, -s.height/2, s.width, s.height);
}

-(NSNumber*) index:(int) index{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    return [NSNumber numberWithInt:index];
}

#pragma mark - dispatch touch event

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    //CCLOG(@"begin");
    BOOL result = NO;
    result = [super ccTouchBegan:touch withEvent:event] && result;

    return result;
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
   // CCLOG(@"move");
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
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
                //add chosen card
                [chosenCards addObject:[self index:index]];
            }
        }
    }
    //check the card is the same or not
    [self checkCard];
}


#pragma mark - check card is the same or not
-(void) checkCard{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
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
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
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
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    id f = [self getChildByTag:kFirstBang];
    [f removeFromParentAndCleanup:YES];
    id s = [self getChildByTag:kSecondBang];
    [s removeFromParentAndCleanup:YES];
    //play effect    
    [[SimpleAudioEngine sharedEngine] playEffect:kClearEffect];
   
    //check win or not
    [self checkWon];
    openTouchTimer = [NSTimer scheduledTimerWithTimeInterval:kOpenTouchTime
                                     target:self selector:@selector(openTouch) userInfo:nil repeats:NO];
    [openTouchTimer retain];
}


-(void) checkWon{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    if ([cards count] == 0) {
       // CCLOG(@"won");
        score = 123;
        [self pushData];
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"" message:@"额,爷们你赢了~" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"好~再来一次吧~", nil];
        [view show];
        [view release];
        if (gameTime != 0) {
            [remainderTimer invalidate];
            [openTouchTimer invalidate];
            self.isTouchEnabled = YES;//sure??
        }
        [self reStart];
    }
}

-(void) rolloverBack{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
   // CCLOG(@"rolloverback");
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
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    self.isTouchEnabled = YES;
}

#pragma mark - push data to database ,pull data from database
-(void) pushData{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    CCLOG(@"push data");
    Player *player = nil;
    if ([self hasData]) { //logged score
        player = [self pullData];
        score += [[player userScore] intValue];
        CCLOG(@"score %d",[[player userScore] intValue]);
        [self updateScore];
    }else{
        player = (Player*) [NSEntityDescription
                            insertNewObjectForEntityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];        
        
    }    
    [player setUserName:userName];
    [player setUserScore:[NSNumber numberWithInt:score]];
    
    //push to sqlite
    NSError *error;
    BOOL isSaveSuccess = [delegate.managedObjectContext save:&error];
    
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}


-(BOOL) hasData{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    BOOL result = YES;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kSortDesc ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    [sortDescriptions release];
    [sortDescriptor release];
    NSError *error = nil;
    NSMutableArray *mutableFetchResult
    = [[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }    
    if (mutableFetchResult.count == 0) {
        result = NO;
    }
    [mutableFetchResult release];
    return result;
}


-(Player*) pullData{
    CCLOG(@"%@::%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kSortDesc ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    [sortDescriptions release];
    [sortDescriptor release];
    NSError *error = nil;
    NSMutableArray *mutableFetchResult
    = [[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    Player *player = nil;
    for (Player *playerObj in mutableFetchResult) {
        NSLog(@"name:%@---Score : %d",playerObj.userName,playerObj.userScore.intValue);
        if ([playerObj.userName isEqualToString:userName]) {
            player = playerObj;
            break;
        }
    }
    [mutableFetchResult release];
    [request release];
    return player;
}
@end
