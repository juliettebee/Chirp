#import "Tweak/Tweak.h"

%group CCMusic 
%hook SBElasticVolumeViewController // Volume slider 
    -(void)viewDidLoad {
        NSLog(@"Hello cc player");
        %orig;
       // Getting size
        [preferences registerInteger:&size default:100 forKey:@"JulietteWidgetSize"];
        // Getting position
        int xAxis;
        int yAxis;
        [preferences registerInteger:&xAxis default:self.view.frame.origin.x forKey:@"JulietteWidgetLocationX"];
        [preferences registerInteger:&yAxis default:0 forKey:@"JulietteWidgetLocationY"];
        // Creating widget
        widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(xAxis, yAxis, (CGFloat)size, (CGFloat)size)];
        // Adding widget
        [[self view] addSubview:widget];

   }
%end
%end

%ctor {
        // Getting prefs
        preferences = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];
        // Registering enabled bool
        BOOL enabled;
        [preferences registerBool:&enabled default:YES forKey:@"JulietteWidgetEnabled"];
        if (enabled)
            %init(CCMusic); 
}
