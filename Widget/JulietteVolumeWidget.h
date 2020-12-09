#import <UIKit/UIKit.h>

#import <MediaPlayer/MediaPlayer.h>
@interface JulietteVolumeWidget : UIView
@property (nonatomic, retain) UIImageView *albumArt;
-(void)nextSong:(UISwipeGestureRecognizer*) gesture;
-(void)prevSong:(UISwipeGestureRecognizer*) gesture;
-(void)playSong:(UISwipeGestureRecognizer*) gesture;
-(void)pauseSong:(UISwipeGestureRecognizer*) gesture; 
-(void) songChangeNotification:(NSNotification *) notification; 
-(void)updateArtwork;
@end
