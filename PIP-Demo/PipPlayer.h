//
//  PipPlayer.h
//  PIP-Demo
//
//  Created by 梁明哲 on 2021/5/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface PipPlayer : NSObject


+ (id)sharedInstance;
- (void)setup:(NSURL *)url onView:(UIView *)view;
- (AVPlayerLayer *)videoPlayPlayer;
- (void)startPicInPic;
@end

NS_ASSUME_NONNULL_END
