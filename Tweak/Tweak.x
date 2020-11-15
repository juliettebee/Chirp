#import "Tweak/Tweak.h"

%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        %orig;
        [[self view] addSubview:ccMusic];
    }
%end

%hook MRPlatterViewController
    -(void)viewDidLoad {
        %orig;
        ccMusic = [self view];
    }
%end
