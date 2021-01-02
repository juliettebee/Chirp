#import "JulietteVolumeWidget.h"

@implementation JulietteVolumeWidget
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
    
     if (self) {
        // Loading preferences
        // We load it here as getPreferences() gets called multiple times 
        preferences = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];
        // Getting album art
        MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
        // Creating blank ui view 
        self.albumArt = [[UIImageView alloc] initWithFrame:frame];
        // This is needed for radius
        self.layer.masksToBounds = TRUE;
        // Setting the artwork's image
        [self updateArtwork];
        // Getting prefs
        [self getPreferences];
        // Adding view
        [self addSubview:self.albumArt];
        // Subscribing to a notification that gets posted when a song changes 
        [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(songChangeNotification:) 
        name:@"MPMusicPlayerControllerNowPlayingItemDidChangeNotification"
        object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(getPreferences:) 
        name:@"page.juliette.Chirp/ReloadPrefs"
        object:nil];
    }
    return self;
} 
-(void)nextSong:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(4, 0);
    [self updateArtwork];
}
-(void)prevSong:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(5, 0);
    [self updateArtwork];
}
-(void)pauseSong:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(1, 0);
}
-(void)playSong:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(0, 0);
}
-(void)showAirplay:(UISwipeGestureRecognizer*) gesture {
    // The picker only shows the logo :/
    AVRoutePickerView *picker = [[AVRoutePickerView alloc] init];
    // Hide it so no one sees it
    [picker setHidden:YES];
    // Lets get that button!
    UIButton *coolHiddenButton = picker.subviews[0];
    // Now lets tap it!
    [coolHiddenButton sendActionsForControlEvents: UIControlEventTouchUpInside];
}
-(void)toggleRepeat:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(7, 0);
}
-(void)toggleShuffle:(UISwipeGestureRecognizer*) gesture {
    MRMediaRemoteSendCommand(6, 0);
}
- (void)songChangeNotification:(NSNotification *) notification {
    [self updateArtwork];
}
// Dedicated function to update artwork 
-(void)updateArtwork {
    // This is used as it allows us to get media artwork when user isnt using music.app
    MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
        if (information) {
            // Converting information from CFDictionaryRef to NSDictionary
            NSDictionary* mediaInfo = (__bridge NSDictionary *)information;
            if (mediaInfo)
                // Then setting the album art
                self.albumArt.image = [UIImage imageWithData:[mediaInfo objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
        }
    });
}
// Function to get prefs
-(void)getPreferences {
    
    // Registration
    [preferences registerInteger:&up default:1 forKey:@"actionUp"];
    [preferences registerInteger:&down default:0 forKey:@"actionDown"];
    [preferences registerInteger:&left default:3 forKey:@"actionLeft"];
    [preferences registerInteger:&right default:2 forKey:@"actionRight"];
    [preferences registerDouble:&radius default:10 forKey:@"JulietteWidgetRadius"];
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
    //Rounding corners
    [[self layer] setCornerRadius:radius];

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
        case 4:
            return @selector(showAirplay:);
            break;
        case 5:
            return @selector(toggleRepeat:);
            break;
        case 6:
            return @selector(toggleShuffle:);
            break;
        default:
            return @selector(playSong:);
            break;
    }
}
@end
