#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface JulietteVolumeWidget : UIView
@property (nonatomic, retain) UIImageView *albumArt;
-(void)nextSong:(UISwipeGestureRecognizer*) gesture;
-(void)prevSong:(UISwipeGestureRecognizer*) gesture;
@end
