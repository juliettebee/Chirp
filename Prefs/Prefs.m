#import "Prefs.h"

@implementation JulietteCCSettings 
    // Switch to enable/disable tweak
    -(instancetype)init {
        self = [super init];
        
        if (self) {
            UISwitch *enableTweak = [[UISwitch alloc] init];
            enableTweak.onTintColor = [UIColor colorWithRed: 0.99 green: 0.81 blue: 0.87 alpha: 1.00];
            // Seeing if tweak is on so we can set the status of the switch correctly
            preferences  = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];
            BOOL enabled;
            [preferences registerBool:&enabled default:YES forKey:@"JulietteWidgetEnabled"];
            [enableTweak setOn:enabled animated:NO];
            // Setup for response to switch update
            [enableTweak addTarget:self action:@selector(tweakStatus:) forControlEvents:UIControlEventValueChanged];
            UIBarButtonItem* switchAsAnUIBarButtonItemBecauseThatsANeededThingAndCausesCrashesIfItIsntLikeThis= [[UIBarButtonItem alloc] initWithCustomView: enableTweak];
            self.navigationItem.rightBarButtonItem = switchAsAnUIBarButtonItemBecauseThatsANeededThingAndCausesCrashesIfItIsntLikeThis;
            // Colors!
            HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
            appearanceSettings.tintColor = [UIColor colorWithRed: 0.99 green: 0.81 blue: 0.87 alpha: 1.00];
            self.hb_appearanceSettings = appearanceSettings;
        }
        return self;
    }

    - (void) viewDidLoad {
        [super viewDidLoad];

        self.header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        JAnimatedGradientBackground *background = [[JAnimatedGradientBackground alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        [self.header addSubview:background];

        background.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [background.topAnchor constraintEqualToAnchor:self.header.topAnchor],
            [background.bottomAnchor constraintEqualToAnchor:self.header.bottomAnchor],
            [background.leftAnchor constraintEqualToAnchor:self.header.leftAnchor],
            [background.rightAnchor constraintEqualToAnchor:self.header.rightAnchor],
        ]];

        UIView *iconParent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self.header addSubview:iconParent];
        iconParent.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [iconParent.topAnchor constraintEqualToAnchor:self.header.topAnchor],
            [iconParent.bottomAnchor constraintEqualToAnchor:self.header.bottomAnchor],

            /*
            [iconParent.leftAnchor constraintEqualToAnchor:self.header.leftAnchor],
            [iconParent.rightAnchor constraintEqualToAnchor:self.header.rightAnchor],
            */
            [NSLayoutConstraint constraintWithItem:iconParent attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.header attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f],
            [NSLayoutConstraint constraintWithItem:iconParent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.header attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],
        ]];

        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [icon setContentMode:UIViewContentModeScaleToFill];
        [icon setImage: [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/CCMusicSliderPrefs.bundle/massiveIcon.png"]];
//        [icon setClipsToBounds:YES];
        [iconParent addSubview:icon];

        icon.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [icon.widthAnchor constraintEqualToConstant: 100],
            [icon.heightAnchor constraintEqualToConstant: 100],
            /*
            [icon.leftAnchor constraintEqualToAnchor:iconParent.leftAnchor],
            [icon.rightAnchor constraintEqualToAnchor:iconParent.rightAnchor],
            */
            [NSLayoutConstraint constraintWithItem:icon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:iconParent attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f],
            [NSLayoutConstraint constraintWithItem:icon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:iconParent attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],

        ]];
        
        // Adding the widget preview
        // If music is playing, the widget will show above the icon
        JulietteVolumeWidget *widget = [[JulietteVolumeWidget alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [iconParent addSubview:widget];
        [iconParent bringSubviewToFront:widget];

        widget.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [widget.widthAnchor constraintEqualToConstant: 100],
            [widget.heightAnchor constraintEqualToConstant: 100],
            /*
            [icon.leftAnchor constraintEqualToAnchor:iconParent.leftAnchor],
            [icon.rightAnchor constraintEqualToAnchor:iconParent.rightAnchor],
            */
            [NSLayoutConstraint constraintWithItem:widget attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:iconParent attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f],
            [NSLayoutConstraint constraintWithItem:widget attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:iconParent attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f],

        ]];
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        tableView.tableHeaderView = self.header;
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }

    - (NSArray *)specifiers {
        if (!_specifiers)
            _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
        return _specifiers;
    }

    -(void)tweakStatus:(id)sender {
        BOOL state = [sender isOn];
        // Disable tweak
        preferences  = [[HBPreferences alloc] initWithIdentifier:@"page.juliette.CCMusicSliderPrefs"];
        [preferences setBool:state forKey:@"JulietteWidgetEnabled"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"page.juliette.Chirp/ReloadPrefs" object:nil];
    }

@end
