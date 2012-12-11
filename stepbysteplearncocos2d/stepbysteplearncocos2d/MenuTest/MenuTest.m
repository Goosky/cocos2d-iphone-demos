//
//  MenuTest.m
//  stepbysteplearncocos2d
//
//  Created by Podevor on 12-12-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "MenuTest.h"


@implementation MenuTest

-(void) dealloc{
    [super dealloc];
}

+(CCScene*) scene{
    CCScene *scene = [CCScene node];
    MenuTest *layer = [MenuTest node];
    [scene addChild:layer z:0];
    return scene;
}

-(id) init{
    if (self = [super init]) {
        
    }
    return self;
}

@end
