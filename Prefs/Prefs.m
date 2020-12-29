#import "Prefs.h"

@implementation JulietteCCSettings 

    - (NSArray *)specifiers {
        if (!_specifiers) 
            _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
        return _specifiers;
    }
    -(void)getTwitter {
        [[UIApplication sharedApplication]
                openURL:[NSURL URLWithString:@"https://twitter.com/JuliettePod"]
                options:@{}
                completionHandler:nil];
    }
    -(void)getSource {
        [[UIApplication sharedApplication]
                openURL:[NSURL URLWithString:@"https://github.com/justnaa/Chirp"]
                options:@{}
                completionHandler:nil];
    }
@end
