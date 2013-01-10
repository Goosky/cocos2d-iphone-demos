//
//  const.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//
//

#ifndef ChessDemo_const_h
#define ChessDemo_const_h

//scale values
const CGFloat kMidScaleX = -0.05f;
const CGFloat kScaleX = -1.0f;
const CGFloat kScaleY = 1.0f;
const CGFloat kSmallScale = 0.0f;
const CGFloat kHalfRolloverTime = 0.15f;
const CGFloat kRolloverBckDelayTime = 1.0f;
const CGFloat kClearPartileTime = 0.2f;
const CGFloat kShowSameCardTime = 1.0f;
const CGFloat kOpenTouchTime = 0.5f;
const CGFloat kGameStartRemainderTime = 0.5f;
const CGFloat kChangeTime = 1.0f;

//sprite images values
#define kHeaderImageName  @"image0.png"
#define kTailImageName  @"image1.png"
#define kParticaleName  @"bang.plist"
#define kClickEffect  @"click.mp3"
#define kClearEffect  @"clear.mp3"
#define kClockEffect  @"clock.mp3"
#define kBackground  @"bg.mp3"
#define kRemainderInfo  @"游戏剩余时间 :"
#define kRemainder  @"游戏即将开始..."
#define kGameOver  @"游戏结束"
#define kEntityName  @"Player"
#define kSortDesc  @"userScore"

const int kFirstBang = 110;
const int kSecondBang = 111;
const int kCardsCount = 8;

#endif
