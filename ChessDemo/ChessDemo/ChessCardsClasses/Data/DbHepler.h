//
//  DbHepler.h
//  ChessDemo
//
//  Created by Podevor on 13-1-14.
//
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Player.h"

@interface DbHepler : NSObject{    
    //delegate
    AppController *delegate;
    NSString *userName;
}
+ (id)shareInstance;
- (void)saveScore:(int)score;
- (Player*)gamePlayer;
@end
