#import <Preferences/PSListController.h>
#import "JulietteCCPreview.h"

@interface JulietteCCSettings : PSListController
-(void)getTwitter;
-(void)getSource;
@end

@interface JulietteCCSettingsGesture : PSListController
@property (nonatomic, retain) NSArray *actions;
-(NSArray*)loadValues:(id)target; 
-(NSArray*)loadTitles:(id)target; 
@end

@interface PSSpecifier : NSObject 
@property (nonatomic,retain) NSArray * values; 
@property (nonatomic,retain) NSDictionary * titleDictionary;    
@property (nonatomic,retain) NSDictionary * shortTitleDictionary;
+(id)preferenceSpecifierNamed:(id)arg1 target:(id)arg2 set:(SEL)arg3 get:(SEL)arg4 detail:(Class)arg5 cell:(long long)arg6 edit:(Class)arg7 ;
-(void)setProperty:(id)arg1 forKey:(id)arg2 ;
-(void)setIdentifier:(NSString *)arg1 ;
@end
