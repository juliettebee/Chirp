#import <Preferences/PSTableCell.h>
#import <Preferences/PSHeaderFooterView.h>

@interface JulietteCCPreview : PSTableCell
@property (nonatomic, retain) UIImageView *albumArt;
-(void)nextSong:(UISwipeGestureRecognizer*) gesture;
-(void)prevSong:(UISwipeGestureRecognizer*) gesture;
-(void) songChangeNotification:(NSNotification *) notification; 
-(void)updateArtwork;
@end
