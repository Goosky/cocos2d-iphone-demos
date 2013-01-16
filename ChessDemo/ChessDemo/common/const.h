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
#define kMidScaleX  -0.05f
#define kScaleX  -1.0f
#define kScaleY  1.0f
#define kSmallScale  0.0f
#define kHalfRolloverTime  0.2f
#define kRolloverBckDelayTime  1.2f
#define kShowSameCardTime  1.2f
#define kClearPartileTime  0.22f
#define kGameStartRemainderTime  2.01f
#define kChangeTime  1.0f

//sprite images values
#define kHeaderImageName  @"image0.png"
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
#define kScoreRemainder @"您的成绩是: "

#define kFirstBang 110
#define kSecondBang  111
#define kCardsCount  8

//time
#define kGameTime 30

//score

#define firstLevelScore 100


//dress
#define kChooseSize 100
#define kScrollWidth 100
#define kChooseCount  8
#define kChooseSizeOffset  20
#define kChooseCountOffset 2
#define kDecorateCountOffset  3
#define kFirstChoosenFrameStartPoint  0
#define kSecondChoosenFrameStartPoint  110

#define kAlphaValue  0.8f
#define kFirstBgTag 11111
#define kSecondBgTag 11112
#define kFirstScrollTag 111
#define kSecondScrollTag 112

//device
#define isRetina ([UIScreen instancesRespondToSelector:@selector(scale)] ? (2 == [[UIScreen mainScreen] scale]): NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIphone5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568) < DBL_EPSILON )
#define IS_IPHONE ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone"] )
#define IS_IPHONE_SIMULATOR ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator"] )
#define IS_IPOD   ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch"] )
#define IS_IPHONE_5 ( ((IS_IPHONE) || (IS_IPHONE_SIMULATOR)) && IS_WIDESCREEN )
#endif
