#import "Tweak/Tweak.h"

%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        %orig;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"JulietteCCGet" object:nil];
        [[self view] addSubview:ccMusic];
    }
%end

%hook MRPlatterViewController
    -(void)viewDidLoad {
        %orig;
        // Creating a notification catcher to get the updated song
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                      selector:@selector(julietteCCMusicNotificationCatcher:) 
                                      name:@"JulietteCCGet" 
                                      object:nil];
    }
    // Catching notification then sending song
    // TODO: Clone view instead of forcefully relocating it to volume hud
    %new
    - (void)julietteCCMusicNotificationCatcher:(NSNotification *)notification {
        ccMusic = [self view];
    }
%end
