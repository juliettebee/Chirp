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
        // Creating a default
        // This is not perfect but its a good starting point to allow the user to set their own location
        // It gets the center than adds 40 pixels to make sure its not in the same location of the slider
        int defaultX;
        int defaultY;
        defaultX = self.view.subviews[0].center.x;
        defaultY = self.sliderView.center.y;
        defaultX = xAxis + 40;
        defaultY = yAxis + 40;

        [preferences registerInteger:&xAxis default:defaultX forKey:@"JulietteWidgetLocationX"];
        [preferences registerInteger:&yAxis default:defaultY forKey:@"JulietteWidgetLocationY"];
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
