//
//  SceneTest.m
//  stepbysteplearncocos2d
//
//  Created by Podevor on 12-12-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "SceneTest.h"
#import "TestHeader.h"


#pragma mark -sceneTest
@implementation SceneTest
-(void) dealloc{
    [super dealloc];
}
// Helper class method that creates a Scene with the SceneTest as the only child.
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	SceneTest *layer = [SceneTest node];
	[scene addChild: layer];
	return scene;
}

//init the operation menus
-(id) init{
    if (self = [super init]) {
        CCMenuItemFont *pushSceneItem
        = [CCMenuItemFont itemWithString: @"Push(Pop)Scene" target:self selector:@selector(onReplaceCC:)];
        CCMenuItemFont *replaceSceneItem
        = [CCMenuItemFont itemWithString: @"ReplaceScene" target:self selector:@selector(onReplaceScene:)];

		CCMenuItemFont *replaceCCTranSlideInTItem
        = [CCMenuItemFont itemWithString: @"ReplaceCCTranSlideInT" target:self selector:@selector(onReplaceCCTranSlideInT:)];
        
        CCMenuItemFont *replaceCCTranSlideInBItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTranSlideInB" target:self selector:@selector(onReplaceCCTransitionSlideInB:)];
        CCMenuItemFont *replaceSceneCCTransitionShrinkGrowItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionShrinkGrow" target:self selector:@selector(onReplaceCCCCTransitionShrinkGrow:)];
		CCMenuItemFont *replaceSceneCCTransitionFlipXItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFlipX" target:self selector:@selector(onReplaceCCCCTransitionFlipX:)];
       	CCMenuItemFont *replaceSceneCCTransitionFlipYItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFlipY" target:self selector:@selector(onReplaceCCCCTransitionFlipY:)];
        CCMenuItemFont *replaceSceneCCTransitionFlipAngularItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFlipAngular" target:self selector:@selector(onReplaceCCTransitionFlipAngular:)];
        CCMenuItemFont *replaceSceneCCTransitionZoomFlipXItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionZoomFlipX" target:self selector:@selector(onReplaceCCTransitionZoomFlipX:)];
        CCMenuItemFont *replaceSceneCCTransitionZoomFlipYItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionZoomFlipY" target:self selector:@selector(onReplaceCCTransitionZoomFlipY:)];
        CCMenuItemFont *replaceCCTransitionZoomFlipAngularItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionZoomFlipAngular" target:self selector:@selector(onReplaceCCTransitionZoomFlipAngular:)];
        CCMenuItemFont *replaceCCTransitionFadeItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFade" target:self selector:@selector(onReplaceCCTransitionFade:)];        
        CCMenuItemFont *replaceCCTransitionCrossFadeItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionCrossFade" target:self selector:@selector(onReplaceCCTransitionCrossFade:)];
        CCMenuItemFont *replaceCCTransitionTurnOffTilesItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionTurnOffTiles" target:self selector:@selector(onReplaceCCTransitionTurnOffTiles:)];
        CCMenuItemFont *replaceCCTransitionSplitColsItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionSplitCols" target:self selector:@selector(onReplaceCCTransitionSplitCols:)];        
        CCMenuItemFont *replaceCCTransitionSplitRowsItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionSplitRows" target:self selector:@selector(onReplaceCCTransitionSplitRows:)];
        CCMenuItemFont *replaceCCTransitionFadeTRItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFadeTR" target:self selector:@selector(onReplaceCCTransitionFadeTR:)];
        CCMenuItemFont *replaceCCTransitionFadeBLItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFadeBL" target:self selector:@selector(onReplaceCCTransitionFadeBL:)];
        CCMenuItemFont *replaceCCTransitionFadeUpItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFadeUp"  target:self selector:@selector(onReplaceCCTransitionFadeUp:)];
        CCMenuItemFont *replaceCCTransitionFadeDownItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionFadeDown" target:self selector:@selector(onReplaceCCTransitionFadeDown:)];
        CCMenuItemFont *replaceCCTransitionSceneOrientedItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionSceneOriented" target:self selector:@selector(onReplaceCCTransitionSceneOriented:)];
        CCMenuItemFont *replaceCCTransitionRotoZoomItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionRotoZoom" target:self selector:@selector(onReplaceCCTransitionRotoZoom:)];
        CCMenuItemFont *replaceCCTransitionMoveInLItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionMoveInL" target:self selector:@selector(onReplaceCCTransitionMoveInL:)];
        CCMenuItemFont *replaceCCTransitionMoveInRItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionMoveInR" target:self selector:@selector(onReplaceCCTransitionMoveInR:)];
        CCMenuItemFont *replaceCCTransitionMoveInTItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionMoveInT" target:self selector:@selector(onReplaceCCTransitionMoveInT:)];
        CCMenuItemFont *replaceCCTransitionMoveInBItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionMoveInB" target:self selector:@selector(onReplaceCCTransitionMoveInB:)];
        CCMenuItemFont *repaceCCTransitionSlideInLItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionSlideInL" target:self selector:@selector(onReplaceCCTransitionSlideInL:)];
        CCMenuItemFont *repaceCCTransitionSlideInRItem
        = [CCMenuItemFont itemWithString:@"ReplaceCCTransitionSlideInR" target:self selector:@selector(onReplaceCCTransitionSlideInR:)];
        
        
        CCMenuItemFont *quitItem
        = [CCMenuItemFont itemWithString: @"Back" target:self selector:@selector(onBack:)];
        
		menu = [CCMenu menuWithItems:
                        pushSceneItem,
                        replaceSceneItem,
                        replaceCCTranSlideInTItem,
                        replaceCCTranSlideInBItem,
                        replaceSceneCCTransitionShrinkGrowItem,
                        replaceSceneCCTransitionFlipXItem,
                        replaceSceneCCTransitionFlipYItem,
                        replaceSceneCCTransitionFlipAngularItem,
                        replaceSceneCCTransitionZoomFlipXItem,                        
                        replaceSceneCCTransitionZoomFlipYItem,
                        replaceCCTransitionZoomFlipAngularItem,
                        replaceCCTransitionFadeItem,
                        replaceCCTransitionCrossFadeItem,
                        replaceCCTransitionTurnOffTilesItem,
                        replaceCCTransitionSplitColsItem,
                        replaceCCTransitionSplitRowsItem,
                        replaceCCTransitionFadeTRItem,
                        replaceCCTransitionFadeBLItem,
                        replaceCCTransitionFadeUpItem,
                        replaceCCTransitionFadeDownItem,
                        replaceCCTransitionSceneOrientedItem,
                        replaceCCTransitionRotoZoomItem,
                        replaceCCTransitionMoveInLItem,
                        replaceCCTransitionMoveInRItem,
                        replaceCCTransitionMoveInTItem,
                        replaceCCTransitionMoveInBItem,
                        repaceCCTransitionSlideInLItem,
                        repaceCCTransitionSlideInRItem,
                        quitItem, nil];
		[menu alignItemsVertically];
        
		[self addChild: menu];
    }
    return self;
}

- (void)onEnter
{
	CCDirector *director =  [CCDirector sharedDirector];
    
	[[director touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void) onExit{
	[[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

#pragma mark touch setting
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:[touch view]];
    touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
    CGSize winsize = [[CCDirector sharedDirector] winSize];
    menu.position = ccp(winsize.width/2,touchPoint.y);
}

//push a scene
-(void) onReplaceCC: (id) sender
{
	CCScene *scene = [ScenePopTest scene];
	[[CCDirector sharedDirector] pushScene: scene];
}

//replace a scene
-(void) onReplaceScene:(id) sender{
    CCScene *scene = [SceneTestActer initSceneWithTitle:@"ReplacedSceneTest is running"];
	[[CCDirector sharedDirector] replaceScene:scene];
}

-(void) onReplaceCCTranSlideInT: (id) sender
{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"TransitionSlideInT TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInT transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionSlideInB:(id)sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"TransitionSlideInB TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInB transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCCCTransitionShrinkGrow:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionShrinkGrow TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionShrinkGrow transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCCCTransitionFlipX:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFlipX TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFlipX transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCCCTransitionFlipY:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFlipY TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFlipY transitionWithDuration:2 scene:scene]];
}


-(void) onReplaceCCTransitionFlipAngular:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFlipAngular TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFlipAngular transitionWithDuration:2 scene:scene]];
}


-(void) onReplaceCCTransitionZoomFlipX:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionZoomFlipX TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionZoomFlipX transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionZoomFlipY:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionZoomFlipY TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionZoomFlipY transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionZoomFlipAngular:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionZoomFlipAngular TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionZoomFlipAngular transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionFade:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFade TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionCrossFade:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionCrossFade TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionCrossFade transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionTurnOffTiles:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionTurnOffTiles TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionTurnOffTiles transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionSplitCols:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionSplitCols TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSplitCols transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionSplitRows:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionSplitRows TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSplitRows transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionFadeTR:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFadeTR TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFadeTR transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionFadeBL:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFadeBL TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFadeBL transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionFadeUp:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFadeUp TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFadeUp transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionFadeDown:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionFadeDown TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionFadeDown transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionSceneOriented:(id) sender{    
	//CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionSceneOriented TestScene is running"];
	//[[CCDirector sharedDirector] replaceScene: [CCTransitionSceneOriented transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionRotoZoom:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionRotoZoom TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionRotoZoom transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionJumpZoom:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionJumpZoom TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionJumpZoom transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionMoveInL:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionMoveInL TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionMoveInL transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionMoveInR:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionMoveInR TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionMoveInR transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionMoveInT:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionMoveInT TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionMoveInT transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionMoveInB:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionMoveInB TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionMoveInB transitionWithDuration:2 scene:scene]];
}

-(void) onReplaceCCTransitionSlideInL:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionSlideInL TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInL transitionWithDuration:2 scene:scene]];    
}

-(void) onReplaceCCTransitionSlideInR:(id) sender{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionSlideInR TestScene is running"];
	[[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:2 scene:scene]];
}



-(void) onBack: (id) sender
{
    CCScene *scene = [mainTest scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}

@end

#pragma mark -pushScentTest
@implementation SceneTestActer

-(void) dealloc{
    [super dealloc];
}

+(CCScene*) initSceneWithTitle:(NSString*)title{
    CCScene *scene = [CCScene node];
    CGSize winsize = [[CCDirector sharedDirector] winSize];
    CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:title fontName:@"Helvetica" fontSize:25.0f];
    titleLabel.position = ccp(winsize.width/2,winsize.height*3/4);
    [scene addChild:titleLabel z:0];
    CCScene *pushTestScene = [SceneTestActer node];
    [scene addChild:pushTestScene z:1];
    return scene;
}

-(id) init{
    
    if (self = [super init]) {
        CCMenuItemFont *backItem = [CCMenuItemFont itemWithString: @"Back(ReplaceScene)" target:self selector:@selector(onBack:)];
        CCMenu *menu = [CCMenu menuWithItems: backItem, nil];
		[menu alignItemsVertically];
		[self addChild: menu];
    }
    return self;
}

//replace a scene that running
-(void) onBack:(id) sender{
    CCScene *scene = [SceneTest scene];
    [[CCDirector sharedDirector] replaceScene:scene];
}
@end

#pragma mark -popSceneTest
@implementation ScenePopTest

//helper create a scene that has only child (ScenePopTest)
+(CCScene*) scene{
    CCScene *scene = [CCScene node];
    
    ScenePopTest *layer = [ScenePopTest node];
    [scene addChild:layer];
    return scene;
}

-(id) init{
    
    if (self = [super init]) {        
        CGSize winsize = [[CCDirector sharedDirector] winSize];
        CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:@"PushedScene is running" fontName:@"Helvetica" fontSize:25.0f];
        titleLabel.position = ccp(winsize.width/2,winsize.height*3/4);
        [self addChild:titleLabel z:0];
        CCMenuItemFont *backItem = [CCMenuItemFont itemWithString: @"Back(PopScene)" target:self selector:@selector(onBack:)];
        CCMenu *menu = [CCMenu menuWithItems: backItem, nil];
		[menu alignItemsVertically];
		[self addChild: menu];
    }
    return self;
}

//pop a scene that running
-(void) onBack:(id) sender{
    [[CCDirector sharedDirector] popScene];
}
@end