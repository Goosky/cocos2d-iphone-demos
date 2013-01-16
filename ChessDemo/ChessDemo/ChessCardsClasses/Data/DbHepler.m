//
//  DbHepler.m
//  ChessDemo
//
//  Created by Podevor on 13-1-14.
//
//

#import "DbHepler.h"
#import "const.h"

@implementation DbHepler


- (void)dealloc{
    [super dealloc];
    [delegate release];
    [helper release];
}

#pragma mark - singleton 
static DbHepler *helper = nil;

+ (id)shareInstance{
    @synchronized(self){
        if(helper == nil){
            helper = [[self alloc] init];
        }
    }
    return helper;
}

#pragma mark - init dbhelper

- (id)init{
    if (self = [super init]) {        
        // init delegate
        delegate = (AppController*)[[UIApplication sharedApplication] delegate];
        [delegate retain];
        userName = delegate.userName;
    }
    return self;
}

#pragma mark - push data to database ,pull data from database

- (void)saveScore:(int)score{
    Player *player = nil;
    if ([self hasPlayer]){ //logged score
        player = [self gamePlayer];
        score += [[player userScore] intValue];
    }else{
        player = (Player*)[NSEntityDescription
                           insertNewObjectForEntityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];
        [player setUserName:userName];
        
    }
    [player setUserScore:[NSNumber numberWithInt:score]];
    
    //push to sqlite
    NSError *error;
    BOOL isSaveSuccess = [delegate.managedObjectContext save:&error];
    
    if (!isSaveSuccess){
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else {
        NSLog(@"Save successful!");
    }
}


- (BOOL)hasPlayer{
    BOOL result = YES;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
   /* NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kSortDesc ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    [sortDescriptions release];
    [sortDescriptor release];*/
    NSError *error = nil;
    NSMutableArray *mutableFetchResult
    = [[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil){
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    if (mutableFetchResult.count == 0){
        result = NO;
    }
    [mutableFetchResult release];
    return result;
}


- (Player*)gamePlayer{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
  /*  NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:kSortDesc ascending:NO];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    [sortDescriptions release];
    [sortDescriptor release];*/
    NSError *error = nil;
    NSMutableArray *mutableFetchResult
    = [[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil){
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    Player *player = nil;
    for (Player *playerObj in mutableFetchResult){
        if ([playerObj.userName isEqualToString:userName]){
            player = playerObj;
            break;
        }
    }
    [mutableFetchResult release];
    [request release];
    return player;
}
@end
