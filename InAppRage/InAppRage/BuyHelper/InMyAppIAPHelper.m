//
//  InMyAppIAPHelper.m
//  InAppRage
//
//  Created by podevor@gmail.com on 12-9-17.
//  Copyright (c) 2012年 Beijing Interaction Times Network Technology Co.,Ltd. All rights reserved.
//

#import "InMyAppIAPHelper.h"

@implementation InAppRageIAPHelper

static InAppRageIAPHelper * _sharedHelper;

+ (InAppRageIAPHelper *) sharedHelper {
    
    if (_sharedHelper != nil) {
        return _sharedHelper;
    }
    _sharedHelper = [[InAppRageIAPHelper alloc] init];
    return _sharedHelper;
    
}

- (id)init {
    
    NSSet *productIdentifiers = [NSSet setWithObjects:
                                 @"com.raywenderlich.inapprage.drummerrage",
                                 @"com.raywenderlich.inapprage.itunesconnectrage", 
                                 @"com.raywenderlich.inapprage.nightlyrage",
                                 @"com.raywenderlich.inapprage.studylikeaboss",
                                 @"com.raywenderlich.inapprage.updogsadness",
                                 nil];
    
    if ((self = [super initWithProductIdentifiers:productIdentifiers])) {                
        
    }
    return self;
    
}

@end
