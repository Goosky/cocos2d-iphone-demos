//
//  Player.h
//  ChessDemo
//
//  Created by Podevor on 13-1-10.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * userScore;

@end
