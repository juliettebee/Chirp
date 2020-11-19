#import "Tweak/Tweak.h"

%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        %orig;
        CGPoint center = [[self view] center];
        UIView *widget = [[UIView alloc] initWithFrame:CGRectMake(center.x, center.y, 100, 100)];
         // Getting album art
         MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
         // Creating UIView with album art
         albumArt = [[UIImageView alloc] initWithImage:[art imageWithSize:CGSizeMake(100, 100)]];
         // Setting UIView's size
         [albumArt setFrame:CGRectMake(0, 0, 100, 100)];
         // Rounding corners
         [[widget layer] setCornerRadius:10];
         widget.layer.masksToBounds = TRUE;
         // Adding next song gesture
         UISwipeGestureRecognizer *nextSong = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(nextSong:)]; // Creating with the target of self and the action of next song, that method gets called when the swipe is made.
         [nextSong setDirection:(UISwipeGestureRecognizerDirectionRight)]; // Setting direction of the swipe
         [widget addGestureRecognizer:nextSong]; // Adding the gesture to the widget
         // Adding previous song gesture
         UISwipeGestureRecognizer *prevSong = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(prevSong:)];
         [prevSong setDirection:(UISwipeGestureRecognizerDirectionLeft)];
         [widget addGestureRecognizer:prevSong];
         
         // Adding view
         [widget addSubview:albumArt];
         [[self view] addSubview:widget];
    }
    %new
    -(void)nextSong:(UISwipeGestureRecognizer*) gesture {
        [MPMusicPlayerController.systemMusicPlayer skipToNextItem];
        MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
        [albumArt setImage:[art imageWithSize:CGSizeMake(100,100)]];
    }
    %new 
    -(void)prevSong:(UISwipeGestureRecognizer*) gesture {
        [MPMusicPlayerController.systemMusicPlayer skipToPreviousItem];
        MPMediaItemArtwork *art = MPMusicPlayerController.systemMusicPlayer.nowPlayingItem.artwork;
        [albumArt setImage:[art imageWithSize:CGSizeMake(100,100)]];
    }
%end

