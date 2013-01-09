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
NSString *kHeaderImageName = @"image0.png";
NSString *kTailImageName = @"image1.png";
NSString *kParticaleName = @"bang.plist";
NSString *kClickEffect = @"click.mp3";
NSString *kClearEffect = @"clear.mp3";
NSString *kRemainderInfo = @"剩餘时间 :";
NSString *kRemainder = @"遊戲开始";
NSString *kGameOver = @"遊戲结束";

const int kFirstBang = 110;
const int kSecondBang = 111;
const int kCardsCount = 8;

#endif
