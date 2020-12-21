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
        widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(0, 0, (CGFloat)size, (CGFloat)size)];
        // Creating a parent view
        // This is needed as the widget would not show up unless the widget was at like 0,0 so this is needed
        UIView *container = [[UIView alloc] initWithFrame:CGRectMake(xAxis,yAxis,(CGFloat)size, (CGFloat)size)];
        [container addSubview:widget];
        [self.view addSubview:container];
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
