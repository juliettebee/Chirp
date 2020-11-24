#import "Tweak/Tweak.h"

%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        %orig;
        // Getting prefs
        preferences = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];
        // Getting size
        [preferences registerInteger:&size default:100 forKey:@"JulietteWidgetSize"];
        // Getting x center
        int xCenter = self.view.frame.origin.x;
        // Creating widget
        widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(xCenter, 0, (CGFloat)size, (CGFloat)size)];
        // Adding widget
        [[self view] addSubview:widget];
   }
%end
