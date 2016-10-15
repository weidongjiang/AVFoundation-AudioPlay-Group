//
//  JWDPlayerController.h
//  AVFoundation-AudioPlay-Group
//
//  Created by 蒋伟东 on 16/10/15.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface JWDPlayerController : NSObject


@property (nonatomic,readonly,getter=isPlaying) BOOL playing;

- (void)play;
- (void)stop;
- (void)adjustRate:(CGFloat)rate;// 控制播放速率

- (void)adjustPan:(CGFloat)pan forPlayerAtIndex:(NSInteger)index; /* 调节声道权重  set panning. -1.0 is left, 0.0 is center, 1.0 is right. */
- (void)adjustVolume:(CGFloat)volume forPlayerAtIndex:(NSInteger)index; // 音量


@end
