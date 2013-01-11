//
//  AppDelegate.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
    
    NSString *userName_;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) NSString *userName;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end
