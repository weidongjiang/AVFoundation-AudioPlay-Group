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

@property (nonatomic,assign) BOOL    playing;
@property (nonatomic, strong)NSArray *players;

@end


@implementation JWDPlayerController

- (instancetype)init {

    self = [super init];
    if (self){
    
        AVAudioPlayer *guitarplayer = [self playerWithFileName:@"guitar"];
        AVAudioPlayer *bassplayer = [self playerWithFileName:@"bass"];
        AVAudioPlayer *drumplayer = [self playerWithFileName:@"drums"];
        
        _players = @[guitarplayer,drumplayer,bassplayer];
        
    }
    return self;
}

- (AVAudioPlayer *)playerWithFileName:(NSString *)fileName {


    NSURL *fileURL = [[NSBundle bundleForClass:[self class]] URLForResource:fileName withExtension:@"caf"];
    
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:&error];
    
    if (audioPlayer) {
        audioPlayer.numberOfLoops = -1; // 无限循环播放
        audioPlayer.enableRate = YES; // 设置为 YES 可以控制播放速率
        [audioPlayer prepareToPlay];
        return audioPlayer;

    }else {
        NSLog(@"创建播放器出错 error: %@",[error localizedDescription]);
        return nil;
    }
    
}


/**
 播放
 播放要对三个播放器同步，获取当前设备的时间，加一个小延时，然后遍历播放器数组里面的播放器，通过[player playAtTime:delayTime];设置起始播放时间，这样三个播放器就能精密的同步播放了。
 
 */
- (void)play {
    if (!self.playing) {
        NSTimeInterval delayTime = [self.players[0] deviceCurrentTime] + 0.01;
        for (AVAudioPlayer *player in self.players) {
            [player playAtTime:delayTime];
        }
        self.playing = YES;
    }
}
/**
 停止
 如果三个播放器都在播放，遍历去停止播放，并且player.currentTime = 0.0f;让播放进度回到音频文件的原点。
 
 */
- (void)stop {
    if (self.playing) {
        for (AVAudioPlayer *player in self.players) {
            [player stop];
            player.currentTime = 0.0f;
        }
        self.playing = NO;
    }
}
// 速率,在不改变音调的前提下，改变速率
- (void)adjustRate:(CGFloat)rate {

    for (AVAudioPlayer *player in self.players) {
        player.rate = rate;
    }
}

/* 调节声道权重  set panning. -1.0 is left, 0.0 is center, 1.0 is right. */
- (void)adjustPan:(CGFloat)pan forPlayerAtIndex:(NSInteger)index {
    if([self isValidIndex:index]){
        AVAudioPlayer *player = self.players[index];
        player.pan = pan;
    }
}
// 音量
- (void)adjustVolume:(CGFloat)volume forPlayerAtIndex:(NSInteger)index {
    if([self isValidIndex:index]){
        AVAudioPlayer *player = self.players[index];
        player.volume = volume;
    }
}

// 防止数组越界
- (BOOL)isValidIndex:(NSUInteger)index {

    return index == 0 || index < self.players.count;
}

@end












