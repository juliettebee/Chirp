#import "Tweak/Tweak.h"

%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        %orig;
        JulietteVolumeWidget *widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [[self view] addSubview:widget];
    }
%end
