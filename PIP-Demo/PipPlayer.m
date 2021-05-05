//
//  PipPlayer.m
//  PIP-Demo
//
//  Created by 梁明哲 on 2021/5/5.
//

#import "PipPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PipPlayer ()<AVPictureInPictureControllerDelegate>
@property (nonatomic ,strong)AVPlayer *videoPlayer;
@property (nonatomic ,strong)AVPlayerItem *avItem;
@property (nonatomic ,strong)AVPlayerLayer *playLayer;
@property (nonatomic ,strong)AVPictureInPictureController *pipController;

@end
@implementation PipPlayer
static PipPlayer *player = nil;

+ (PipPlayer *)sharedInstance {
    static dispatch_once_t onceToken;
    if (player == nil) {
        dispatch_once(&onceToken, ^{
            player = [[PipPlayer alloc] init];
        });
    }
    
    return player;
}

- (void)setup:(NSURL *)url onView:(UIView *)view {
    NSError *error = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
    [[AVAudioSession sharedInstance] setActive:YES error:&error];
    _avItem = [[AVPlayerItem alloc] initWithURL:url];
    _videoPlayer = [AVPlayer playerWithPlayerItem:_avItem];
    _playLayer = [AVPlayerLayer playerLayerWithPlayer:_videoPlayer];
    _playLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.width * 9/16);
    
    self.pipController = [[AVPictureInPictureController alloc] initWithPlayerLayer:_playLayer];
    _pipController.delegate = self;
    
    [_videoPlayer play];
    
}
- (AVPlayerLayer *)videoPlayPlayer {
    return _playLayer;
}
- (void)play {
    [_videoPlayer play];
}

- (void)startPicInPic {
    if ([AVPictureInPictureController isPictureInPictureSupported] == YES) {
        [self.pipController startPictureInPicture];
    }
    
}

- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"start");
}

- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {
    NSLog(@"stop");
}
@end
