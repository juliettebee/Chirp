#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import <MediaPlayer/MediaPlayer.h>

@interface JulietteVolumeWidget : UIView {
    HBPreferences *preferences;
}
@property (nonatomic, retain) UIImageView *albumArt;
-(void)nextSong:(UISwipeGestureRecognizer*) gesture; 
-(void)prevSong:(UISwipeGestureRecognizer*) gesture; 
-(void)pauseSong:(UISwipeGestureRecognizer*) gesture; 
-(void)playSong:(UISwipeGestureRecognizer*) gesture; 
-(void)songChangeNotification:(NSNotification *) notification; 
-(void)updateArtwork; 
-(void)getPreferences; 
-(SEL)getAction:(NSInteger*)key; 
@end
