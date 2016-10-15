//
//  JWDPlayerController.m
//  AVFoundation-AudioPlay-Group
//
//  Created by 蒋伟东 on 16/10/15.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import "JWDPlayerController.h"
#import <AVFoundation/AVFoundation.h>

@interface JWDPlayerController ()


@end


@implementation JWDPlayerController

- (instancetype)init {

    self = [super init];
    if (self){
    
        
        
    }
    return self;
}

- (AVAudioPlayer *)playerWithFileName:(NSString *)fileName {

    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"caf"];
    
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:&error];
    
    if (audioPlayer) {
        audioPlayer.numberOfLoops = -1; // 无限循环播放
        audioPlayer.enableRate = YES; // 设置为 YES 可以控制播放速率
        [audioPlayer prepareToPlay];
        
    }else {
        NSLog(@"创建播放器出错 error: %@",[error localizedDescription]);
    }
    
    return audioPlayer;
}

// 播放
- (void)play {

}
// 停止
- (void)stop {

}
// 速率
- (void)adjustRate:(CGFloat)rate {

}

- (void)adjustPan:(CGFloat)pan forPlayerAtIndex:(NSInteger)index {

}
// 音量
- (void)adjustVolume:(CGFloat)volume forPlayerAtIndex:(NSInteger)index {

}



@end












