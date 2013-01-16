//
//  const.h
//  ChessDemo
//
//  Created by Podevor on 13-1-7.
//
//

#ifndef ChessDemo_const_h
#define ChessDemo_const_h

//device
#define isRetina ([UIScreen instancesRespondToSelector:@selector(scale)] ? (2 == [[UIScreen mainScreen] scale]): NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isIphone5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
//scale values
#define kIphone5ScaleX (4.0f/3.0f)*(1136.0f/960.0f)
#define kMidScaleX -0.05f
#define kScaleX  -1.0f
#define kScaleY  1.0f
#define kHalfRolloverTime  0.25f
#define kRolloverBckDelayTime  1.2f
#define kShowSameCardTime  1.2f
#define kClearPartileTime  0.22f
#define kGameStartRemainderTime  2.01f
#define kChangeTime  1.0f

//sprite images values
#define kHeaderImageName  @"a_header.png"
#define kParticaleName  @"bang.plist"
#define kClickEffect  @"click.mp3"
#define kClearEffect  @"clear.mp3"
#define kClockEffect  @"clock.mp3"
#define kBackground  @"bg.mp3"
#define kEntityName  @"Player"
#define kSortDesc  @"userScore"

#define kFirstBang 110
#define kSecondBang  111
#define kCardsCount  8

//time
#define kGameTime 30
typedef enum{
    kGameSuccess,
    kGameFailure,
    kGameTimeOut    
}ParentResponse;

typedef enum{
    kChessCardA = 1,
    kChessCardB,
    kChessCardC,
    kChessCardD,
    kChessCardE,
    kChessCardF,
    kChessCardG
}ChessCardRound;


typedef enum{
    kChessCardRoundAScore = 1,
    kChessCardRoundBScore,
    kChessCardRoundCScore,
    kChessCardRoundDScore,
    kChessCardRoundEScore = 6,
    kChessCardRoundFScore = 8,
    kChessCardRoundGScore = 10
}ChessCardScoreInRound;

#define kGameRounds 7

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


#endif
