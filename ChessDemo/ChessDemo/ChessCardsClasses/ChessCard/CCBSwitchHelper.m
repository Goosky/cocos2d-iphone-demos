//
//  CCBSwitchHelper.m
//  Disney
//
//  Created by Podevor on 13-1-16.
//  Copyright (c) 2013年 Podevor. All rights reserved.
//

#import "CCBSwitchHelper.h"
#import "CCBReader.h"
#import "AppDelegate.h"

@implementation CCBSwitchHelper

- (void)dealloc{
    [helper release];
    [super dealloc];
}

static CCBSwitchHelper* helper = nil;
+ (CCBSwitchHelper*)shareInstance{
    @synchronized(self){
        if(helper == nil){
            helper = [[self alloc] init];
        }
    }
    return helper;
}

- (void)playerAgain{
    [self switchScene];
}

- (void)switchScene{
    
    AppController *delegate = (AppController*) [[UIApplication sharedApplication] delegate];
    
    NSString *ccbiFileName = nil;
    switch (delegate.chessCardRound) {
        case kChessCardA:{//first round
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardB:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardC:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardD:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardE:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardF:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
        case kChessCardG:{
            ccbiFileName = @"chess.ccbi";
        }
            break;
    }
    
    CCScene *scene  = [CCBReader sceneWithNodeGraphFromFile:ccbiFileName];
    [ccbiFileName release];
    [[CCDirector sharedDirector] replaceScene:scene];
    
}

- (void)switchSceneWithResponse:(ParentResponse)res{
    
    AppController *delegate = (AppController*) [[UIApplication sharedApplication] delegate];
    //process the response
    if ( res == kGameSuccess && (delegate.chessCardRound < kGameRounds) ) {
        delegate.chessCardRound++;
    }
    [self switchScene];
}
@end
