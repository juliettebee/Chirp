#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "../Widget/Widget.h"
#import <Cephei/HBPreferences.h>

@interface SBElasticVolumeViewController : UIViewController 
@property (nonatomic,readonly) UIView * sliderView;
@end

@interface MRPlatterViewController : UIViewController
@end

JulietteVolumeWidget *widget;
HBPreferences *preferences;
NSInteger size;
