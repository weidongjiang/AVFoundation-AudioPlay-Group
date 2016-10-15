//
//  ViewController.m
//  AVFoundation-AudioPlay-Group
//
//  Created by 蒋伟东 on 16/10/15.
//  Copyright © 2016年 YIXIA. All rights reserved.
//

#import "ViewController.h"
#import "JWDPlayerController.h"

@interface ViewController ()

@property(nonatomic, strong)JWDPlayerController *playerController;//!< <#value#>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.playerController = [[JWDPlayerController alloc] init];
    
    
    
}
// 播放
- (IBAction)paly {
    NSLog(@"播放");
    
    [self.playerController play];
}


// 暂停
- (IBAction)stop {
    NSLog(@"暂停");
    [self.playerController stop];
}
// 速率
- (IBAction)changeRate:(UISlider *)sender {
    NSLog(@"改变速率-sender %f -- tag %ld",sender.value,(long)sender.tag);
}


// 音量
- (IBAction)changeVolume:(UISlider *)sender {
    NSLog(@"改变音量-sender %f -- tag %ld",sender.value,(long)sender.tag);
}

// 声道权衡
- (IBAction)pan:(UISlider *)sender {
    NSLog(@"改变声道比重-sender %f -- tag %ld",sender.value,(long)sender.tag);
}


@end
















