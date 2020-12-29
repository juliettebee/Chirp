#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface JulietteVolumeWidget : UIView {
    HBPreferences *preferences;
    NSInteger *up;
    NSInteger *down;
    NSInteger *left;
    NSInteger *right;
    double radius;
}
@property (nonatomic, retain) UIImageView *albumArt;
-(void)nextSong:(UISwipeGestureRecognizer*) gesture; 
-(void)prevSong:(UISwipeGestureRecognizer*) gesture; 
-(void)pauseSong:(UISwipeGestureRecognizer*) gesture; 
-(void)playSong:(UISwipeGestureRecognizer*) gesture; 
-(void)toggleRepeat:(UISwipeGestureRecognizer*) gesture;
-(void)songChangeNotification:(NSNotification *) notification; 
-(void)updateArtwork; 
-(void)getPreferences; 
-(SEL)getAction:(NSInteger*)key; 
@end
