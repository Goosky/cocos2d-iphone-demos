//
//  mainTest.m
//  stepbysteplearncocos2d
//
//  Created by Podevor on 12-12-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "mainTest.h"
#import "TestHeader.h"


@implementation mainTest

+(CCScene*) scene{
    CCScene *scene = [CCScene node];
    mainTest *layer = [mainTest node];
    [scene addChild:layer z:0];
    return scene;
}

-(id) init{
    if (self = [super init]) {
        CCMenuItemFont *sceneTestItem = [CCMenuItemFont itemWithString: @"SceneTest" target:self selector:@selector(onSceneTest:)];
        
        CCMenuItemFont *quitItem = [CCMenuItemFont itemWithString: @"Quit" target:self selector:@selector(onQuit:)];
        CCMenu *menu = [CCMenu menuWithItems: sceneTestItem,quitItem, nil];
		[menu alignItemsVertically];
		[self addChild: menu];
    }
    return self;
}

-(void) onSceneTest:(id) sender{
    [[CCDirector sharedDirector] replaceScene:[SceneTest scene]];
}

-(void) onQuit:(id) sender{
    exit(0);
}
@end
