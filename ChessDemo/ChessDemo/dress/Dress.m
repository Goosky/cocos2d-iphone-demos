//
//  Dress.m
//  ChessDemo
//
//  Created by Podevor on 13-1-12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Dress.h"
#import "CCBReader.h"
#import "const.h"


@implementation Dress

-(void) dealloc{
    [super dealloc];
    [suffix release];
    [navScroll release];
    [decorateScroll release];
}

-(void) didLoadFromCCB{
    [self initGame];
    [self showDecorateWithIndex:chooseIndex];
}

#pragma mark - init game

-(void) initGame{
    [self initConf];
    [self initGameNav];
}

-(void) initConf{
    
    chooseIndex = 1;
    
    if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ){//iphone or ipod
        scrollWidth = kScrollWidth/2;
        chooseSize = kChooseSize/2;
        chooseSizeOffset = kChooseSizeOffset/2;
        chooseCountOffset = kChooseCountOffset/2;
        decorateCountOffset = kDecorateCountOffset/2;
        startPoint = kSecondChoosenFrameStartPoint/2;
        suffix = @"";
    }/*else if([[CCDirector sharedDirector]  enableRetinaDisplay:YES]){//Retina ipad Device
      
    }*/else{
          scrollWidth = kScrollWidth;
          chooseSize = kChooseSize;
          chooseSizeOffset = kChooseSizeOffset;
          chooseCountOffset = kChooseCountOffset;
          decorateCountOffset = kDecorateCountOffset;
          startPoint = kSecondChoosenFrameStartPoint;
          suffix = @"@2x";
      }
}

-(void) initGameNav{ 

    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    navScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(kFirstChoosenFrameStartPoint, winSize.height, scrollWidth, winSize.height)];
   
    navScroll.contentSize = CGSizeMake(scrollWidth, chooseSize*(kChooseCount+chooseCountOffset));
    navScroll.center = CGPointMake(kFirstChoosenFrameStartPoint+scrollWidth/2, winSize.height/2);
    navScroll.showsVerticalScrollIndicator = NO;
    navScroll.showsHorizontalScrollIndicator = NO;
    navScroll.userInteractionEnabled = YES;//user interaction
    navScroll.scrollEnabled = YES;//can scroll
    navScroll.pagingEnabled = NO;
    navScroll.canCancelContentTouches = YES;
    navScroll.tag = kFirstScrollTag;
    navScroll.delegate = self;
    //add grag bg
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"choosedecorategraybg%@.png",suffix]]];
    [bg setBounds:CGRectMake(kFirstChoosenFrameStartPoint, winSize.height, scrollWidth, winSize.height)];
    [bg setCenter:CGPointMake(kFirstChoosenFrameStartPoint+scrollWidth/2, winSize.height/2)];
    [bg setAlpha:kAlphaValue];
    [bg setTag:kFirstBgTag];
    [[[CCDirector sharedDirector] view] addSubview:bg];
    [bg release];
    
    for (int i=1; i<=kChooseCount; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(kFirstChoosenFrameStartPoint, i*chooseSize, chooseSize, chooseSize)];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btnn%@.png",suffix]] forState:UIControlStateNormal];
        [button setTag:i];
        [button setCenter:CGPointMake(chooseSize/2, (i-1)*(chooseSize+chooseSizeOffset)+chooseSize*0.6)];
        [button setAdjustsImageWhenHighlighted:NO];
        [button setAdjustsImageWhenDisabled:NO];
        [button addTarget:self action:@selector(showDecorate:) forControlEvents:UIControlEventTouchUpInside];
        [navScroll addSubview:button];
        [button release];
    }
    
    [[[CCDirector sharedDirector] view] addSubview:navScroll];
}




#pragma mark - event catch

-(void) showDecorate:(id)sender{
    //default all button
    for (int i=1; i<=kChooseCount; i++) {
        UIButton *btn = (UIButton *)[navScroll viewWithTag:i];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btnn%@.png",suffix]] forState:UIControlStateNormal];
        [btn setEnabled:YES];
    }
    UIButton *button = (UIButton*) sender;
    [button setEnabled:NO];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btns%@.png",suffix]] forState:UIControlStateNormal];
    //the disable img by buttion tag
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"btns%@.png",suffix]] forState:UIControlStateDisabled];
    chooseIndex = button.tag;
    [self showDecorateWithIndex:chooseIndex];
}

-(void) showDecorateWithIndex:(int) decorateIndex{
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int count = 0;
    NSString *imageName = @"";
    switch (decorateIndex) {
        case 1:{
            count = 15;
            imageName = [NSString stringWithFormat:@"decorate%@.png",suffix];
        }
            break;
        case 2:{
            count = 15;
            imageName = [NSString stringWithFormat:@"dress%@.png",suffix];
        }
            break;
        default:{
            count = 15;
            imageName = [NSString stringWithFormat:@"dress%@.png",suffix];
        }
            break;
    }
    
    if (decorateScroll != nil && decorateScroll.tag == kSecondScrollTag) {
        [decorateScroll removeFromSuperview];
    }
    decorateScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(startPoint, winSize.height, scrollWidth, winSize.height)];
    decorateScroll.contentSize = CGSizeMake(scrollWidth, chooseSize*(count+decorateCountOffset));
    decorateScroll.center = CGPointMake(startPoint+scrollWidth/2, winSize.height/2);
    decorateScroll.delegate = self;
    decorateScroll.showsVerticalScrollIndicator = NO;
    decorateScroll.showsHorizontalScrollIndicator = NO;
    decorateScroll.pagingEnabled = NO;
    decorateScroll.userInteractionEnabled = YES;
    decorateScroll.scrollEnabled = YES;
    //add grag bg
    UIImageView *bg = (UIImageView *)[[[CCDirector sharedDirector] view] viewWithTag:kSecondBgTag];
    if (bg != nil) {
        [bg removeFromSuperview];
    }
    bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"choosedecorategraybg%@.png",suffix]]];
    [bg setBounds:CGRectMake(startPoint, winSize.height, scrollWidth, winSize.height)];
    [bg setCenter:CGPointMake(startPoint+scrollWidth/2, winSize.height/2)];
    [bg setAlpha:kAlphaValue];
    [bg setTag:kSecondBgTag];
    [[[CCDirector sharedDirector] view] addSubview:bg];
    [bg release];
    //decorate choose nav
    for (int i=1; i<=count; i++) {
        UIButton *button =
        [[UIButton alloc] initWithFrame:CGRectMake(startPoint+chooseSize/2, i*chooseSize, chooseSize, chooseSize)];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
        [button setTag:i];
        [button setCenter:CGPointMake(chooseSize/2, (i-1)*(chooseSize+chooseSizeOffset)+chooseSize*0.6)];
        [button setAdjustsImageWhenHighlighted:NO];
        [button setAdjustsImageWhenDisabled:NO];
        [button addTarget:self action:@selector(changeDecorate:) forControlEvents:UIControlEventTouchUpInside];
        [decorateScroll addSubview:button];
        [button release];
    }
    decorateScroll.tag = kSecondScrollTag;
    
    [[[CCDirector sharedDirector] view] addSubview:decorateScroll];
    [decorateScroll release];
}

-(void) changeDecorate:(id) sender{
    //default all button
    for (int i=1; i<=kChooseCount; i++) {
        UIButton *btn = (UIButton *)[decorateScroll viewWithTag:i];
        [btn setEnabled:YES];
    }
    UIButton *button = (UIButton*) sender;
    [button setEnabled:NO];
    [self changeDecorateWithIndex:button.tag];
}

-(void) changeDecorateWithIndex:(int) decorateIndex{
   CCLOG(@"choose index %d current index %d",chooseIndex,decorateIndex);
}

#pragma mark - common

@end
