#import "Prefs.h"

@implementation JulietteCCSettingsGesture
    - (NSArray *)specifiers {
        if (!_specifiers) 
            _specifiers = [self loadSpecifiersFromPlistName:@"gestures" target:self];
        return _specifiers;
    }
@end
