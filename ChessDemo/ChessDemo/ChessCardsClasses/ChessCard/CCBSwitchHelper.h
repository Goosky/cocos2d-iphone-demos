//
//  CCBSwitchHelper.h
//  Disney
//
//  Created by Podevor on 13-1-16.
//  Copyright (c) 2013年 Podevor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "const.h"

@interface CCBSwitchHelper : NSObject
+ (CCBSwitchHelper*)shareInstance;
- (void)switchSceneWithResponse:(ParentResponse)res;
- (void)playerAgain;
@end
