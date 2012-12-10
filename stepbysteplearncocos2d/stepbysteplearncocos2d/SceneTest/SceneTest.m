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
@synthesize scenes = _scenes;
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
        = [CCMenuItemFont itemWithString: @"Push(Pop)Scene" target:self selector:@selector(onPushScene:)];
        CCMenuItemFont *replaceSceneItem
        = [CCMenuItemFont itemWithString: @"ReplaceScene" target:self selector:@selector(onReplaceScene:)];

		CCMenuItemFont *pushSceneTranSlideInTItem
        = [CCMenuItemFont itemWithString: @"PushSceneTranSlideInT" target:self selector:@selector(onPushSceneTranSlideInT:)];
        
        CCMenuItemFont *pushSceneTranSlideInBItem
        = [CCMenuItemFont itemWithString:@"PushSceneTranSlideInB" target:self selector:@selector(onPushSceneTransitionSlideInB:)];
        CCMenuItemFont *pushSceneCCTransitionShrinkGrowItem
        = [CCMenuItemFont itemWithString:@"PushCCTransitionShrinkGrow" target:self selector:@selector(onPushSceneCCTransitionShrinkGrow:)];
		CCMenuItemFont *quitItem
        = [CCMenuItemFont itemWithString: @"Back" target:self selector:@selector(onBack:)];
        
		CCMenu *menu = [CCMenu menuWithItems:
                        pushSceneItem,
                        replaceSceneItem,
                        pushSceneTranSlideInTItem,
                        pushSceneTranSlideInBItem,
                        pushSceneCCTransitionShrinkGrowItem,
                        quitItem, nil];
		[menu alignItemsVertically];
        
		[self addChild: menu];
        _scenes = nil;
    }
    return self;
}

//push a scene
-(void) onPushScene: (id) sender
{
	CCScene *scene = [ScenePopTest scene];
	[[CCDirector sharedDirector] pushScene: scene];
    if (_scenes == nil) {
        [NSMutableArray arrayWithCapacity:0];
    }
    [_scenes addObject:scene];
}

//replace a scene
-(void) onReplaceScene:(id) sender{
    CCScene *scene = [SceneTestActer initSceneWithTitle:@"ReplacedSceneTest is running"];
	[[CCDirector sharedDirector] replaceScene:scene];
    if (_scenes == nil) {
        [NSMutableArray arrayWithCapacity:0];
        [_scenes addObject:scene];
    }else{        
        int count = [_scenes count];
        [_scenes replaceObjectAtIndex:count-1 withObject:scene];
    }
}

-(void) onPushSceneTranSlideInT: (id) sender
{
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"TransitionSlideInT TestScene is running"];
	[[CCDirector sharedDirector] pushScene: [CCTransitionSlideInT transitionWithDuration:2 scene:scene]];
}

-(void) onPushSceneTransitionSlideInB:(id)sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"TransitionSlideInB TestScene is running"];
	[[CCDirector sharedDirector] pushScene: [CCTransitionSlideInB transitionWithDuration:2 scene:scene]];
}

-(void) onPushSceneCCTransitionShrinkGrow:(id) sender{    
	CCScene *scene = [SceneTestActer initSceneWithTitle:@"CCTransitionShrinkGrow TestScene is running"];
	[[CCDirector sharedDirector] pushScene: [CCTransitionShrinkGrow transitionWithDuration:2 scene:scene]];
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
    titleLabel.position = ccp(winsize.width/4,winsize.height/3);
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
        titleLabel.position = ccp(winsize.width/4,winsize.height/3);
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