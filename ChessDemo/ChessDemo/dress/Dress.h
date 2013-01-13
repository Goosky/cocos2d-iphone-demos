//
//  Dress.h
//  ChessDemo
//
//  Created by Podevor on 13-1-12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Dress : CCLayer <UIScrollViewDelegate> {
    int scrollWidth;
    int chooseSize;
    int chooseSizeOffset;
    int chooseCountOffset;
    int decorateCountOffset;
    int startPoint;
    NSString *suffix;
    int chooseIndex;
    UIScrollView *navScroll;
    UIScrollView *decorateScroll;
}

@end
