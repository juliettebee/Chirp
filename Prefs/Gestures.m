#import "Prefs.h"

@implementation JulietteCCSettingsGesture
    - (NSArray *)specifiers {
        if (!_specifiers) { 
            // Loading the specifiers so we get the title
            _specifiers = [self loadSpecifiersFromPlistName:@"gestures" target:self];
        }
        return _specifiers;
    }
    -(NSArray*)loadValues:(id)target {
       return @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7"]; 
    }
    -(NSArray*)loadTitles:(id)target {
        return  @[@"Play", @"Pause", @"Next", @"Previous", @"Airplay", @"Repeat", @"Repeat song", @"Shuffle"];
    }
@end
