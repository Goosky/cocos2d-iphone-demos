//
//  SceneTest.h
//  stepbysteplearncocos2d
//
//  Created by Podevor on 12-12-10.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

//the main scene
@interface SceneTest : CCLayer/*<CCTargetedTouchDelegate>*/ {
    CCMenu *menu;
}
+(CCScene *) scene;
@end

//the push scenetest
@interface SceneTestActer : CCLayer{
    
}
+(CCScene *) initSceneWithTitle:(NSString*)title;
@end

//the pop sceneTest

@interface ScenePopTest : CCLayer{
    
}
+(CCScene*) scene;
@end
