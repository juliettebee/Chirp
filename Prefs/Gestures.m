#import "Prefs.h"

@implementation JulietteCCSettingsGesture
    - (NSArray *)specifiers {
        if (!_specifiers) { 
            // Loading the specifiers so we get the title
            _specifiers = [self loadSpecifiersFromPlistName:@"gestures" target:self];
            // Now were creating arrays
            // These are just for if I ever want to add another gesture/action
            // To add another gesture or action just add some to the array
            // The gesture defaults are dependent on the index of action so make sure you append!
            NSArray *gesture = @[@"Up", @"Down", @"Left", @"Right" ]; 
            NSArray *actions = @[@"Play", @"Pause", @"Next", @"Previous", @"Airplay", @"Repeat", @"Repeat song", @"Shuffle"];
            // Dictionary of defaults for latter!
            NSDictionary *gestureDefaults = @{
                @"up": @1,
                @"down": @0,
                @"left": @3,
                @"right": @2
            };
            // Now we need to get the amount of values there are
            // We need this because of the values property
            NSMutableArray *values = [[NSMutableArray alloc] init];
            // Looping through all of the actions that can be picked then adding to the values array
            for (int i = 0; i < [actions count]; i++) 
                [values addObject:[NSString stringWithFormat:@"%d", i]];
            // Now were adding the buttons
            // The loop allows there to be one button per action
            for (int i = 0; i < [gesture count]; i++) {
                // Now were adding the label as by default theres no label for the PSSegmentCell type
                [_specifiers addObject:({
                    // Label is a string w/ format because we need to label the gesture and we cant get the gesture with out string with format
                    PSSpecifier *specifier = [PSSpecifier preferenceSpecifierNamed:[NSString stringWithFormat:@"Swipe %@", gesture[i]] target:self set:Nil get:Nil detail:Nil cell:PSGroupCell edit:Nil];
                    specifier;
                })];
                // Now were adding the table to set the action
                [_specifiers addObject:({
                    // The set & get properties are **extremely** important and cannot be removed
                    // I spent like a solid half hour on trying to figure out why they werent being updated
                    // and then I added those properties then boom its fixed
                     PSSpecifier *specifier = [PSSpecifier preferenceSpecifierNamed:[NSString stringWithFormat:@"action%@", gesture[i]] target:self set:@selector(setPreferenceValue:specifier:) get:@selector(readPreferenceValue:) detail:Nil cell:PSSegmentCell edit:Nil];
                    // Now we're going through and setting the normal stuff 
                    // It needs to be enabled for users to interact with it
                     [specifier setProperty:@YES forKey:@"enabled"];
                     // Now were setting the key, were using the string with format as it saves time and allows us to quickly add more actions
                     [specifier setProperty:[NSString stringWithFormat:@"action%@", gesture[i]] forKey:@"key"];
                     // Setting the id
                     [specifier setIdentifier:@"page.juliette.CCMusicSliderPrefs"];
                     // Then setting the defaults so its updated
                     [specifier setProperty:@"page.juliette.CCMusicSliderPrefs" forKey:@"defaults"];
                     // Setting the default
                     // String with format so we can use the dictionary
                     // so it gets the current gesture then makes it lowercase as the dictionary is all lowercase then gets the default gesture from the dictionary then formats the number it gets then returns it!
                     [specifier setProperty:[NSString stringWithFormat:@"%d", gestureDefaults[[gesture[i] lowercaseString]]] forKey:@"default"];
                     // Setting the values
                     specifier.values = values;
                     // Setting the labels
                     specifier.titleDictionary = [NSDictionary dictionaryWithObjects:actions forKeys:specifier.values]; 
                     specifier.shortTitleDictionary = [NSDictionary dictionaryWithObjects:actions forKeys:specifier.values]; 
                    // Adding the specifier
                     specifier;
                 })];
            }
        }
        // Then finally, returning it
        return _specifiers;
    }
@end
