#import "Prefs.h"

@implementation JulietteCCSettingsGesture
    - (NSArray *)specifiers {
        if (!_specifiers) { 
            // Setting actions
            self.actions = @[@"Play", @"Pause", @"Next", @"Previous", @"Airplay", @"Repeat", @"Repeat song", @"Shuffle"];
            // Loading the specifiers so we get the title
            _specifiers = [self loadSpecifiersFromPlistName:@"gestures" target:self];
        }
        return _specifiers;
    }
    -(NSArray*)loadValues:(id)target {
        NSMutableArray *values = [[NSMutableArray alloc] init];
        for (int i = 0; i < [self.actions count]; i++)
                [values addObject:[NSString stringWithFormat:@"%d", i]];
        return values; 
    }
    -(NSArray*)loadTitles:(id)target {
        return self.actions; 
    }
@end
