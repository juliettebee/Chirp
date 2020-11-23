#import "JulietteVolumeWidget.h"

@implementation JulietteVolumeWidget
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
 if (self) {
        // Getting album art
        MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
        // Creating UIView with album art
        // Have to use custom size as frame is being dumb smh
        self.albumArt = [[UIImageView alloc] initWithImage:[art imageWithSize:frame.size]];
        // Setting UIView's size
        // Also here but with different vars
        [self.albumArt setFrame:frame];
        //Rounding corners
        [[self layer] setCornerRadius:10];
        self.layer.masksToBounds = TRUE;
        // Adding next song gesture
        UISwipeGestureRecognizer *nextSong = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextSong:)]; // Creating with the target of self and the action of next song, that method gets called when the swipe is made.
        [nextSong setDirection:(UISwipeGestureRecognizerDirectionRight)]; // Setting direction of the swipe
        [self addGestureRecognizer:nextSong]; // Adding the gesture to the widget
        // Adding previous song gesture
        UISwipeGestureRecognizer *prevSong = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(prevSong:)];
        [prevSong setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [self addGestureRecognizer:prevSong];
        // Adding view
        [self addSubview:self.albumArt];

        // Subscribing to a notification that gets posted when a song changes 
        [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(songChangeNotification:) 
        name:@"MPMusicPlayerControllerNowPlayingItemDidChangeNotification"
        object:nil];

    }
    return self;
} 
-(void)nextSong:(UISwipeGestureRecognizer*) gesture {
    [MPMusicPlayerController.systemMusicPlayer skipToNextItem];
    [self updateArtwork];
}
-(void)prevSong:(UISwipeGestureRecognizer*) gesture {
    [MPMusicPlayerController.systemMusicPlayer skipToPreviousItem];
    [self updateArtwork];
}
- (void) songChangeNotification:(NSNotification *) notification {
    [self updateArtwork];
}
// Dedicated function to update artwork 
-(void)updateArtwork {
    MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
    [self.albumArt setImage:[art imageWithSize:self.frame.size]];
}
@end
