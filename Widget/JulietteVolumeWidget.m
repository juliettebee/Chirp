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
        // Getting prefs
        [self getPreferences];
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
-(void)pauseSong:(UISwipeGestureRecognizer*) gesture {
    [MPMusicPlayerController.systemMusicPlayer stop];
}
-(void)playSong:(UISwipeGestureRecognizer*) gesture {
    [MPMusicPlayerController.systemMusicPlayer play];
}
- (void)songChangeNotification:(NSNotification *) notification {
    [self updateArtwork];
}
// Dedicated function to update artwork 
-(void)updateArtwork {
    MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
    [self.albumArt setImage:[art imageWithSize:self.frame.size]];
}
// Function to get prefs
-(void)getPreferences {
    preferences = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];

    // Creation and registration of variables
    NSInteger *up;
    [preferences registerInteger:&up default:1 forKey:@"actionUp"];
    NSInteger *down;
    [preferences registerInteger:&down default:0 forKey:@"actionDown"];
    NSInteger *left;
    [preferences registerInteger:&left default:3 forKey:@"actionLeft"];
    NSInteger *right;
    [preferences registerInteger:&right default:4 forKey:@"actionRight"];
    // Setting gestures
    UISwipeGestureRecognizer *upGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:[self getAction:up]];
    UISwipeGestureRecognizer *downGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:[self getAction:down]];
    UISwipeGestureRecognizer *leftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:[self getAction:left]];
    UISwipeGestureRecognizer *rightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:[self getAction:right]];
    // Setting directions
    [upGesture setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [downGesture setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [leftGesture setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [rightGesture setDirection:(UISwipeGestureRecognizerDirectionRight)];
    // Adding
    [self addGestureRecognizer:upGesture];
    [self addGestureRecognizer:downGesture];
    [self addGestureRecognizer:leftGesture];
    [self addGestureRecognizer:rightGesture];

}
-(SEL)getAction:(NSInteger*)key {
    switch((int)key) {
        case 0:
            return @selector(playSong:);
            break;
        case 1:
            return @selector(pauseSong:);
            break;
        case 2:
            return @selector(nextSong:);
            break;
        case 3:
            return @selector(prevSong:);
            break;
        default:
            return @selector(playSong:);
            break;
    }
}
@end
