//
//  HelloWorldLayer.h
//  BallGame
//
//  Created by podevor@gmail.com on 12-12-19.
//  Copyright Beijing Interaction Times Network Technology Co.,Ltd. 2012年. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
